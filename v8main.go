package main

import fmt "fmt"
import v8 "v8"

func main() {

	context := v8.NewContext()
	fmt.Printf("Context: %s",context)
}
