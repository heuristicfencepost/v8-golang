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

		var r string = v8.JsRuntimeExecute(string(bytes))
		fmt.Printf("Result: %s\n",r)
	}
}
