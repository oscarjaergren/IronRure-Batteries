call "%VS150COMNTOOLS%\..\..\VC\Auxiliary\Build\vcvars32.bat"
pushd %~dp0\rure\regex-capi
cargo build --release
