#! /usr/bin/env bash

set -e

# Install Rust
curl https://sh.rustup.rs -sSf | sh -s -- -y
source $HOME/.cargo/env

# Log out the tools versions
dotnet --version
cargo --version
rustc --version

# Shell out to the standard build now tools are set up
bash build.sh
