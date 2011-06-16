#include "v8wrapper.h"
#include <v8.h>
#include <string.h>
#include <stdlib.h>

namespace v8 {

  char* JavaScript::execute(char* js) {

    // Create a stack-allocated handle scope.
    HandleScope handle_scope;
    
    // Create a new context.
    Persistent<Context> context = Context::New();
    
    // Enter the created context for compiling and
    // running the input script. 
    Context::Scope context_scope(context);
    
    // Create a string containing the JavaScript source code.
    Handle<String> source = String::New(js);
    
    // Compile the source code.
    Handle<Script> script = Script::Compile(source);
    
    // Run the script to get the result.
    Handle<Value> result = script->Run();
    
    // Dispose the persistent context.
    context.Dispose();
    
    // Convert the result to an ASCII string and return it
    String::AsciiValue ascii(result);

    // Grab some memory from the heap and copy our output onto it.
    char* foo = (char*)malloc(strlen(*ascii));
    strcpy(foo,*ascii);
    return foo;
  }
}

