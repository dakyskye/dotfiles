package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"os/exec"
)

var (
	readMemory      string
	readCPU         string
	readTemperature string
	readDistroWM    string
	readUptime      string
	readKernel      string
	readUpdates     string
	readInstalled   string
	readVolume      string
	readWebcam      string
	readDND         string
	readGHNotif     string
	readKeyboard    string
	readDate        string
	readTime        string
)

var (
	chanMemory      = make(chan string)
	chanCPU         = make(chan string)
	chanTemperature = make(chan string)
	chanDistroWM    = make(chan string)
	chanUptime      = make(chan string)
	chanKernel      = make(chan string)
	chanUpdates     = make(chan string)
	chanInstalled   = make(chan string)
	chanVolume      = make(chan string)
	chanWebcam      = make(chan string)
	chanDND         = make(chan string)
	chanGHNotif     = make(chan string)
	chanKeyboard    = make(chan string)
	chanDate        = make(chan string)
	chanTime        = make(chan string)
)

func main() {
	var (
		err  error
		errs = make(chan error)
	)

	go sMemory(errs, chanMemory)
	go sCPU(errs, chanCPU)
	go sTemperature(errs, chanTemperature)
	go sDistroWM(errs, chanDistroWM)
	go sUptime(errs, chanUptime)
	go sKernel(errs, chanKernel)
	go sUpdates(errs, chanUpdates)
	go sInstalled(errs, chanInstalled)
	go sVolume(errs, chanVolume)
	go sKeyboard(errs, chanKeyboard)
	go sWebcam(errs, chanWebcam)
	go sDND(errs, chanDND)
	go sGHNotif(errs, chanGHNotif)
	go sDate(errs, chanDate)
	go sTime(errs, chanTime)

	updateStatus := func() {
		mon0 := fmt.Sprintf("%s | %s | %s | %s | %s | %s | %s | %s | %s | %s | %s | %s | %s | %s | %s", readMemory, readCPU, readTemperature, readDistroWM, readUptime, readKernel, readUpdates, readInstalled, readVolume, readWebcam, readDND, readGHNotif, readKeyboard, readDate, readTime)
		mon1 := fmt.Sprintf("%s | %s | %s | %s | %s | %s | %s | %s | %s | %s | %s", readMemory, readCPU, readTemperature, readUpdates, readVolume, readWebcam, readDND, readGHNotif, readKeyboard, readDate, readTime)
		err = exec.Command("/usr/bin/xsetroot", "-name", fmt.Sprintf("NIMDOW_MONITOR_INDEX=0 %s NIMDOW_MONITOR_INDEX=1 %s", mon0, mon1)).Run()
		if err != nil {
			errs <- err
		}
	}

	for {
		select {
		case err = <-errs:
			if err == nil {
				continue
			}
			log.Fatalln(err)
			os.Exit(1)
		case readMemory = <-chanMemory:
			updateStatus()
		case readCPU = <-chanCPU:
			updateStatus()
		case readTemperature = <-chanTemperature:
			updateStatus()
		case readDistroWM = <-chanDistroWM:
			updateStatus()
		case readUptime = <-chanUptime:
			updateStatus()
		case readKernel = <-chanKernel:
			updateStatus()
		case readUpdates = <-chanUpdates:
			updateStatus()
		case readInstalled = <-chanInstalled:
			updateStatus()
		case readVolume = <-chanVolume:
			updateStatus()
		case readKeyboard = <-chanKeyboard:
			updateStatus()
		case readWebcam = <-chanWebcam:
			updateStatus()
		case readDND = <-chanDND:
			updateStatus()
		case readGHNotif = <-chanGHNotif:
			updateStatus()
		case readDate = <-chanDate:
			updateStatus()
		case readTime = <-chanTime:
			updateStatus()
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
func sUptime(e chan<- error, c chan<- string) {
	e <- readOutput("s_uptime", c)
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
func sWebcam(e chan<- error, c chan<- string) {
	e <- readOutput("s_webcam", c)
}
func sDND(e chan<- error, c chan<- string) {
	e <- readOutput("s_dnd", c)
}
func sGHNotif(e chan<- error, c chan<- string) {
	e <- readOutput("s_github", c)
}
func sKeyboard(e chan<- error, c chan<- string) {
	e <- readOutput("s_keyboard", c)
}
func sDate(e chan<- error, c chan<- string) {
	e <- readOutput("s_date", c)
}
func sTime(e chan<- error, c chan<- string) {
	e <- readOutput("s_time", c)
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
