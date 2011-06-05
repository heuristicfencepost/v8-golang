%module v8
%{
#include "v8.h"
%}
namespace v8 {

  template <class T> class Persistent : public Handle<T> {
  public:

    Persistent();
    template <class S> Persistent(S* that) : Handle<T>(that);
    template <class S> Persistent(Handle<S> that) : Handle<T>(*that);
    template <class S> Persistent<T> Cast(Persistent<S> that);
    template <class S> Persistent<S> As();

    Persistent<T> New(Handle<T> that);

    void Dispose();

    void MakeWeak(void* parameters, WeakReferenceCallback callback);

    void ClearWeak();

    inline void MarkIndependent();

    inline bool IsNearDeath() const;

    inline bool IsWeak() const;

    inline void SetWrapperClassId(uint16_t class_id);

  private:
    friend class ImplementationUtilities;
    friend class ObjectTemplate;
  };

  class Context {
  public:
    Persistent<Context> New();
  };
}
