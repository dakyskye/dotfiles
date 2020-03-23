package main

import (
	"encoding/json"
	"io/ioutil"
	"log"
	"math/rand"
	"os"
	"os/exec"
	"path"
	"time"

	"github.com/ztrue/tracerr"
)

type recent struct {
	File    []File `json:"file,omitempty"`
	Current string `json:"current,omitempty"`
}

type File struct {
	Name string    `json:"name"`
	When time.Time `json:"when"`
}

func main() {
	wallpapersPath := path.Join(os.Getenv("HOME"), "Images", "wallpapers")
	recentsDirPath := path.Join(os.Getenv("HOME"), ".config", ".wallpapers")
	recentsFilePath := path.Join(recentsDirPath, "recents.json")

	err := os.MkdirAll(recentsDirPath, 0744)
	if err != nil {
		tracerr.PrintSourceColor(tracerr.Wrap(err))
	}

	var recentsFile *os.File

	existed := true

	if _, err = os.Stat(recentsFilePath); os.IsNotExist(err) {
		recentsFile, err = os.Create(recentsFilePath)
		if err != nil {
			tracerr.PrintSourceColor(tracerr.Wrap(err))
		}
		recentsFile.Write([]byte("{}"))
		recentsFile.Close()
		existed = false
	}

	recents := &recent{}

	recentsFile, err = os.OpenFile(recentsFilePath, os.O_RDWR, os.ModePerm)
	if err != nil {
		tracerr.PrintSourceColor(tracerr.Wrap(err))
	}

	recentsFileAsBytes, _ := ioutil.ReadAll(recentsFile)

	recentsFile.Close()

	if existed {
		err = json.Unmarshal(recentsFileAsBytes, &recents)
		if err != nil {
			tracerr.PrintSourceColor(tracerr.Wrap(err))
		}
	}

	wallpapers := []string{}

	files, err := ioutil.ReadDir(wallpapersPath)
	if err != nil {
		tracerr.PrintSourceColor(tracerr.Wrap(err))
	}

	for _, file := range files {
		if file.IsDir() {
			continue
		}

		wallpapers = append(wallpapers, file.Name())
	}

	if len(wallpapers) == 0 {
		log.Fatal("no wallpaper found at " + wallpapersPath)
	}

	rand.Seed(time.Now().Unix())

	recsCount := make(map[string]int)

	chosen := ""

	for {
		chosen = wallpapers[rand.Intn(len(wallpapers))]
		for index, recent := range recents.File {
			if count, ok := recsCount[recent.Name]; ok {
				if count >= 10 {
					recents.Current = chosen
					recents.File[index].When = time.Now()
					goto final
				}
			}
			if chosen == recent.Name {
				if time.Since(recent.When) >= time.Hour*24*7 {
					recents.Current = chosen
					recents.File[index].When = time.Now()
					goto final
				}
				if _, ok := recsCount[chosen]; ok {
					recsCount[chosen] += 1
					goto redo
				} else {
					recsCount[chosen] = 1
					goto redo
				}
			}
		}
		recents.File = append(recents.File, File{Name: chosen, When: time.Now()})
		recents.Current = chosen
	final:
		break
	redo:
		continue
	}

	err = exec.Command("feh", "--bg-scale", path.Join(wallpapersPath, chosen)).Run()
	if err != nil {
		tracerr.PrintSourceColor(tracerr.Wrap(err))
	}

	recentsFileAsBytes, err = json.Marshal(recents)
	if err != nil {
		tracerr.PrintSourceColor(tracerr.Wrap(err))
	}

	err = ioutil.WriteFile(recentsFilePath, recentsFileAsBytes, 0744)
	if err != nil {
		tracerr.PrintSourceColor(tracerr.Wrap(err))
	}
}
