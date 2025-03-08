SET PATH=%PATH%;C:\Program Files (x86)\Rust\bin
SET PATH=%PATH%;C:\MinGW\bin

rustup toolchain list --verbose
rustup toolchain install stable-x86_64-pc-windows-msvc
rustup toolchain install stable-i686-pc-windows-msvc
rustup toolchain list --verbose

git submodule update --init

pushd %~dp0\rure\regex-capi

SET VCTOOLPATH=C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\VC\Auxiliary\Build\
echo "%VCTOOLPATH%

call "%VCTOOLPATH%\vcvars64.bat"
rustup default stable-x86_64-pc-windows-msvc
cargo --version --verbose
cargo clean
cargo build --release
xcopy ..\target\release\rure.dll %~dp0\runtimes\win-x64\native\


call "%VCTOOLPATH%\vcvars32.bat"
rustup default stable-i686-pc-windows-msvc
cargo --version --verbose
cargo clean
cargo build --release
xcopy ..\target\release\rure.dll %~dp0\runtimes\win-x86\native\

pushd %~dp0
dotnet build -c Release -o PublishOutput IronRure.Batteries-Windows.csproj 
