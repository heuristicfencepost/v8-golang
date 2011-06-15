%module v8
%{
#include "v8.h"
%}
namespace v8 {

  template <class T> class Persistent : public Handle<T> {

  };

  class Context {
  public:
    Persistent<Context> New();

    class Scope {
    public:
      Scope(Handle<Context> context);
    };
  };
}
