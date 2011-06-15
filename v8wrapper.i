%module v8
%{
#include "v8.h"
#include "v8wrapper.h"
%}
namespace v8 {

 class JsRuntime {
  public:
    static char* execute(char* js);
  };
}

 
