#include "v8wrapper.h"
#include <v8.h>

namespace v8 {

  char* JsRuntime::execute(char* js) {

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

    printf("%s\n", *ascii);
    return *ascii;
  }
}

