/*
	This file is part of nimdowstatus program
	Made by Lasha Kanteladze, a.k.a dakyskye
	Licensed under the MIT license
	Repository: https://github.com/dakyskye/nimdowstatus
*/

package main

import (
	"bufio"
	"bytes"
	"fmt"
	"os/exec"
	"strings"
	"text/template"
)

type Status struct {
	Memory      Module
	CPU         Module
	Temperature Module
	DistroWM    Module
	Kernel      Module
	Updates     Module
	Installed   Module
	Volume      Module
	Keyboard    Module
	Date        Module
}

type Module struct {
	Emoji   string
	Text    string
	Postfix string
}

const (
	memory      = `{{$.Memory.Emoji}}  {{$.Memory.Text}}  {{- $.Memory.Postfix}}`
	cpu         = `{{$.CPU.Emoji}}  {{$.CPU.Text}}  {{- $.CPU.Postfix}}`
	temperature = `{{$.Temperature.Emoji}}  {{$.Temperature.Text}}  {{- $.Temperature.Postfix}}`
	distrowm    = `{{$.DistroWM.Emoji}}  {{$.DistroWM.Text}}  {{- $.DistroWM.Postfix}}`
	kernel      = `{{$.Kernel.Emoji}}  {{$.Kernel.Text}}  {{- $.Kernel.Postfix}}`
	updates     = `{{$.Updates.Emoji}}  {{$.Updates.Text}}  {{- $.Updates.Postfix}}`
	installed   = `{{$.Installed.Emoji}}  {{$.Installed.Text}}  {{- $.Installed.Postfix}}`
	volume      = `{{$.Volume.Emoji}}  {{$.Volume.Text}}  {{- $.Volume.Postfix}}`
	keyboard    = `{{$.Keyboard.Emoji}}  {{$.Keyboard.Text}}  {{- $.Keyboard.Postfix}}`
	date        = `{{$.Date.Emoji}}  {{$.Date.Text}}  {{- $.Date.Postfix}}`
	output      = memory + " | " + cpu + " | " + temperature + " | " + distrowm + " | " + kernel + " | " + updates + " | " + installed + " | " + volume + " | " + keyboard + " | " + date
)

func main() {
	tmpl, err := template.New("default").Parse(output)
	if err != nil {
		panic(err)
	}

	status := &Status{
		Memory:      Module{Emoji: "", Postfix: "%"},
		CPU:         Module{Emoji: "", Postfix: "%"},
		Temperature: Module{Emoji: "", Postfix: "°C"},
		DistroWM:    Module{Emoji: ""},
		Kernel:      Module{Emoji: ""},
		Updates:     Module{Emoji: ""},
		Installed:   Module{Emoji: ""},
		Volume:      Module{Postfix: "%"},
		Keyboard:    Module{Emoji: ""},
		Date:        Module{Emoji: ""},
	}

	out := new(bytes.Buffer)

	errs := make(chan error)

	memoryChan := make(chan string)
	cpuChan := make(chan string)
	temperatureChan := make(chan string)
	distrowmChan := make(chan string)
	kernelChan := make(chan string)
	updatesChan := make(chan string)
	installedChan := make(chan string)
	volumeChan := make(chan string)
	keyboardChan := make(chan string)
	dateChan := make(chan string)

	go sMemory(errs, memoryChan)
	go sCPU(errs, cpuChan)
	go sTemperature(errs, temperatureChan)
	go sDistroWM(errs, distrowmChan)
	go sKernel(errs, kernelChan)
	go sUpdates(errs, updatesChan)
	go sInstalled(errs, installedChan)
	go sVolume(errs, volumeChan)
	go sKeyboard(errs, keyboardChan)
	go sDate(errs, dateChan)

	update := func() {
		out.Reset()
		err = tmpl.Execute(out, status)
		if err != nil {
			panic(err)
		}
		err = setStatus(out.String())
		if err != nil {
			panic(err)
		}
	}

	for {
		select {
		case err = <-errs:
			if err == nil {
				continue
			}
			panic(err)
		case status.Memory.Text = <-memoryChan:
			update()
		case status.CPU.Text = <-cpuChan:
			update()
		case status.Temperature.Text = <-temperatureChan:
			update()
		case status.DistroWM.Text = <-distrowmChan:
			update()
		case status.Kernel.Text = <-kernelChan:
			update()
		case status.Updates.Text = <-updatesChan:
			update()
		case status.Installed.Text = <-installedChan:
			update()
		case status.Volume.Text = <-volumeChan:
			if strings.HasPrefix(status.Volume.Text, "true ") {
				status.Volume.Emoji = ""
				status.Volume.Text = strings.TrimPrefix(status.Volume.Text, "true ")
			} else {
				status.Volume.Emoji = ""
				status.Volume.Text = strings.TrimPrefix(status.Volume.Text, "false ")
			}
			update()
		case status.Keyboard.Text = <-keyboardChan:
			update()
		case status.Date.Text = <-dateChan:
			update()
		}
	}
}

func sMemory(e chan<- error, c chan<- string) {
	e <- readOutput("s_memory", c)
}
func sCPU(e chan<- error, c chan<- string) {
	e <- readOutput("s_cpu", c)
}
func sTemperature(e chan<- error, c chan<- string) {
	e <- readOutput("s_temperature", c)
}
func sDistroWM(e chan<- error, c chan<- string) {
	e <- readOutput("s_distrowm", c)
}
func sKernel(e chan<- error, c chan<- string) {
	e <- readOutput("s_kernel", c)
}
func sUpdates(e chan<- error, c chan<- string) {
	e <- readOutput("s_updates", c)
}
func sInstalled(e chan<- error, c chan<- string) {
	e <- readOutput("s_installed", c)
}
func sVolume(e chan<- error, c chan<- string) {
	e <- readOutput("s_volume", c)
}
func sKeyboard(e chan<- error, c chan<- string) {
	e <- readOutput("s_keyboard", c)
}
func sDate(e chan<- error, c chan<- string) {
	e <- readOutput("s_date", c)
}

func readOutput(command string, output chan<- string) (err error) {
	cmd := exec.Command(command)

	out, err := cmd.StdoutPipe()
	if err != nil {
		return
	}

	scanner := bufio.NewScanner(out)

	go func() {
		for scanner.Scan() {
			output <- scanner.Text()
		}
	}()

	return cmd.Run()
}

func setStatus(status string) (err error) {
	cmd := exec.Command("/bin/sh")
	cmd.Stdin = strings.NewReader(fmt.Sprintf("xsetroot -name \"%s\"", status))
	return cmd.Run()
}
