package main

import (
	"bufio"
	"bytes"
	"fmt"
	"os/exec"
	"strings"
)

func main() {
	out := new(bytes.Buffer)

	var err error
	errs := make(chan error)

	memory := ""
	cpu := ""
	temperature := ""
	distrowm := ""
	kernel := ""
	updates := ""
	installed := ""
	volume := ""
	keyboard := ""
	date := ""

	memoryChan := make(chan string)
	cpuChan := make(chan string)
	temperatureChan := make(chan string)
	volumeChan := make(chan string)
	distrowmChan := make(chan string)
	kernelChan := make(chan string)
	updatesChan := make(chan string)
	installedChan := make(chan string)
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
		out.WriteString(fmt.Sprintf("%s | %s | %s | %s | %s | %s | %s | %s | %s | %s", memory, cpu, temperature, distrowm, kernel, updates, installed, volume, keyboard, date))
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
		case memory = <-memoryChan:
			update()
		case cpu = <-cpuChan:
			update()
		case temperature = <-temperatureChan:
			update()
		case distrowm = <-distrowmChan:
			update()
		case kernel = <-kernelChan:
			update()
		case updates = <-updatesChan:
			update()
		case installed = <-installedChan:
			update()
		case volume = <-volumeChan:
			update()
		case keyboard = <-keyboardChan:
			update()
		case date = <-dateChan:
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
	cmd.Stdin = strings.NewReader(fmt.Sprintf("xsetroot -name \"NIMDOW_MONITOR_INDEX=1 %s\"", status))
	return cmd.Run()
}
