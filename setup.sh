# Utility shell script to setup build environment

# Begin by identifying Go environment variables
export GOROOT=$HOME/hg/go
export GOARCH=386
export GOOS=linux
export GOBIN=$HOME/local/go

# Throw in a few path additions
export PATH=$PATH:$HOME/local/swig-2.0.4/bin:$HOME/local/go
