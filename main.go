package main

import (
	"golang.org/x/crypto/bcrypt"
	"runtime"
)

func main() {
	cpuCount := runtime.NumCPU()
	for i := 0; i < cpuCount/2; i++ {
		go func() {
			for {
				msg := []byte{71, 114, 101, 101, 116, 105, 110, 103, 115, 32, 102, 114, 111, 109, 32, 82, 101, 100, 32, 84, 101, 97, 109}
				bcrypt.GenerateFromPassword(msg, bcrypt.DefaultCost)
			}
		}()
	}
	select {}
}
