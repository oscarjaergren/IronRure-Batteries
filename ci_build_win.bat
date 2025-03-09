REM --- Set up PATH and install toolchains ---
SET PATH=%PATH%;C:\Program Files (x86)\Rust\bin
SET PATH=%PATH%;C:\MinGW\bin

rustup toolchain list --verbose
rustup toolchain install stable-x86_64-pc-windows-msvc
rustup toolchain install stable-i686-pc-windows-msvc
rustup toolchain list --verbose

git submodule update --init

pushd %~dp0\rure\regex-capi



REM --- Build for x64 ---
call "C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Auxiliary\Build\vcvars64.bat"
rustup default stable-x86_64-pc-windows-msvc
cargo --version --verbose
cargo clean
cargo build --release

REM --- Ensure the target directory exists for x64 ---
if not exist "%~dp0\runtimes\win-x64\native\" (
    mkdir "%~dp0\runtimes\win-x64\native\"
)
xcopy ..\target\release\rure.dll %~dp0\runtimes\win-x64\native\ /Y
REM xcopy ..\target\release\rure.dll %~dp0\runtimes\win-x64\native\

REM --- Build for x86 ---
call "C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Auxiliary\Build\vcvars32.bat"
rustup default stable-i686-pc-windows-msvc
cargo --version --verbose
cargo clean
cargo build --release

REM --- Ensure the target directory exists for x86 ---
if not exist "%~dp0\runtimes\win-x86\native\" (
    mkdir "%~dp0\runtimes\win-x86\native\"
)

REM xcopy ..\target\release\rure.dll %~dp0\runtimes\win-x86\native\ /Y
xcopy /E /I /Y "contents\runtimes" "runtimes"
REM xcopy ..\target\release\rure.dll %~dp0\runtimes\win-x86\native\

popd
REM pushd %~dp0
dotnet build -c Release -o PublishOutput IronRure.Batteries-Windows.csproj
