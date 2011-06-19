#include "v8wrapper.h"
#include <v8.h>
#include <string.h>
#include <stdlib.h>

namespace v8 {

  // Every call to execute() results in the creation of a new context and
  // scope.  Per the v8 docs this should be a reasonable use case.
  char* JavaScript::execute(char* js) {

    HandleScope handle_scope;
    Persistent<Context> context = Context::New();
    Context::Scope context_scope(context);
    
    Handle<String> source = String::New(js);
    Handle<Script> script = Script::Compile(source);
    Handle<Value> result = script->Run();

    context.Dispose();

    String::AsciiValue ascii(result);

    // TODO: This isn't very C++ like...
    char* foo = (char*)malloc(strlen(*ascii));
    strcpy(foo,*ascii);
    return foo;
  }
}

