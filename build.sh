#! /usr/bin/env bash

set -e

rid=osx
platform=Darwin

# Make sure the source is up to date
git submodule init && git submodule update

# Ask cargo to build us the libary. We only care about the
# regex-capi part of the crate.
(cd rure/regex-capi/ && cargo build --release)

# create a folder for the package to reside in
rm -rf contents
mkdir -p contents/runtimes/$rid/native/
cp rure/regex-capi/target/release/librure* contents/runtimes/$rid/native/

# Pack it all up
nuget pack IronRure.Batteries-$platform.nuspec
