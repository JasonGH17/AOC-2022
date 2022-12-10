package main

import (
	"os"
	"sort"
	"fmt"
)

func readInput() string {
	data, err := os.ReadFile("input.txt")
	if err != nil {
		panic("Input file (input.txt) not found!")
	}

	return string(data)
}

type Runes []rune

func (r Runes) Len() int           { return len(r) }
func (r Runes) Less(i, j int) bool { return r[i] < r[j] }
func (r Runes) Swap(i, j int)      { r[i], r[j] = r[j], r[i] }

func checkForDup(runes []rune) bool {
	sort.Sort(Runes(runes))
	for i := 0; i < len(runes) - 1; i++ {
		if runes[i] == runes[i+1] {
			return true
		}
	}
	return false
}

func main() {
	data := readInput()
	for i := 0; i < len(data); i++ {
		if !checkForDup([]rune(data[i:i+4])) {
			fmt.Printf("Part 1: %d\n", i+4);
			break
		}
	}
	for i := 0; i < len(data); i++ {
		if !checkForDup([]rune(data[i:i+14])) {
			fmt.Printf("Part 2: %d\n", i+14);
			break
		}
	}
}
