package main

import fmt "fmt"
import v8 "v8"
import io "io/ioutil"
import flag "flag"

// Simple shell for running arbitrary JavaScript code.  Assumes that the JavaScript file in question returns
// a string result.
func main() {

	var scriptname *string = flag.String("script","v8.js","Name of JavaScript source file to run")
	flag.Parse()

	fmt.Printf("Using JavaScript file: %s\n",*scriptname)
	bytes,err := io.ReadFile(*scriptname)
	if err == nil {

		var r string = v8.JavaScriptExecute(string(bytes))
		fmt.Printf("Result: %s\n",r)

		// Note the lack of an explicit free() operation for strings generated from char* values returned
		// by the v8 runtime.  Working assumption is that garbage collection will clean up the necessary
		// heap memory.  Not 100% sure if this will also clean up the SWIG proxy objects.
	}
}
