call "%VS150COMNTOOLS%\..\..\VC\Auxiliary\Build\vcvars32.bat"
pushd rure\regex-capi
cargo build --release
