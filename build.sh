#! /usr/bin/env bash

set -e

# Check for the programs we need to do the build

if ! (which git && which cargo && which dotnet)>/dev/null
then
	echo "git, cargo and dotnet are rquired for compilation" 1>&2
	exit 1
fi

# Work out the platform we are building on, and the RID which goes
# along with it.
case `uname` in
	Darwin) rid="osx"
			  platform="Darwin"
			  ;;
	Linux) rid="linux"
			 platform="Linux"
			 ;;
	*) echo "Unrecognised platform `uname`" 1>&2
	   exit 1;
	   ;;
esac

# log out the RID decided on
echo "Compiling for $rid on $platform"

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
dotnet pack IronRure.Batteries-$platform.csproj -o .
