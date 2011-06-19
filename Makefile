include $(GOROOT)/src/Make.inc
TARG=v8
include $(GOROOT)/src/Make.pkg

swig:
	swig -c++ -go v8wrapper.i

buildwrapper: swig
	g++ -c -I$(HOME)/svn/v8/include -fpic v8wrapper.cc
	g++ -c -I$(HOME)/svn/v8/include -fpic v8wrapper_wrap.cxx
	g++ -shared -L$(HOME)/svn/v8 v8wrapper_wrap.o v8wrapper.o -o v8.so -lv8
	8g v8.go
	8c -I$(HOME)/hg/go/src/pkg/runtime v8_gc.c
	gopack grc v8.a v8.8 v8_gc.8

buildshell: buildwrapper
	8g -I. v8shell.go
	8l -L . -r . -o v8shell v8shell.8

runshell:
	./v8shell -script=fib.js

# Override default definition of clean from Go build scripts in order to make sure
# we clean up C++ code generated by SWIG as well
cleanwrapper:
	rm -f v8wrapper_wrap.cxx v8_gc.c v8.go
	rm -f v8wrapper.o v8wrapper_wrap.o v8_gc.8 v8.8
	rm -f v8.so v8.a

cleanshell:
	rm -f v8shell.8 v8shell

cleanall: cleanwrapper cleanshell
