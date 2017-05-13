call "%VS150COMNTOOLS%\..\..\VC\Auxiliary\Build\vcvars64.bat"
pushd rure\regex-capi
cargo build --release
