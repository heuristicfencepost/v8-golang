package main

import fmt "fmt"
import v8 "v8"
import io "io/ioutil"
import flag "flag"

func main() {

	var scriptname *string = flag.String("script","v8.js","Name of JavaScript source file to run")
	flag.Parse()

	fmt.Printf("Using JavaScript file: %s\n",*scriptname)
	bytes,err := io.ReadFile(*scriptname)
	if err == nil {

		fmt.Printf("Script: %s\n",bytes)	

		var r string = v8.JsRuntimeExecute(string(bytes))
		fmt.Printf("Result: %s\n",r)
	}
}
