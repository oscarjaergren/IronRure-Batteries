#! /usr/bin/env bash

set -e

curl https://sh.rustup.rs -sSf | sh -s -- -y

dotnet --version
/home/appveyor/.cargo/bin/cargo --version

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

# Ask cargo to build us the libary. We only care about the
# regex-capi part of the crate.
(cd rure/regex-capi/ && /home/appveyor/.cargo/bin/cargo build --release)

# create a folder for the package to reside in
rm -rf runtimes
mkdir -p runtimes/$rid/native/
cp rure/target/release/librure* runtimes/$rid/native/

# Pack it all up
dotnet build IronRure.Batteries-$platform.csproj

