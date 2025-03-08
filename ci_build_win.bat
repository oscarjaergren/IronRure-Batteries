REM --- Set up PATH and install toolchains ---
SET PATH=%PATH%;C:\Program Files (x86)\Rust\bin
SET PATH=%PATH%;C:\MinGW\bin

rustup toolchain list --verbose
rustup toolchain install stable-x86_64-pc-windows-msvc
rustup toolchain install stable-i686-pc-windows-msvc
rustup toolchain list --verbose

git submodule update --init

pushd %~dp0\rure\regex-capi

REM --- Dynamically detect VsDevCmd.bat ---
set "VS_PATHS=C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools\VsDevCmd.bat;C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\Tools\VsDevCmd.bat;C:\Program Files\Microsoft Visual Studio\2022\Enterprise\Common7\Tools\VsDevCmd.bat"
set "VSDIR="
for %%p in ("%VS_PATHS:;=" "%") do (
    echo Checking path: %%~p
    if exist "%%~p" (
        set "VSDIR=%%~p"
        goto :found_vsdevcmd
    )
)
echo VsDevCmd.bat not found.
exit /b 1

:found_vsdevcmd
echo Found VsDevCmd.bat at "%VSDIR%"

REM --- Call VsDevCmd.bat to set up the VS environment ---
call "%VSDIR%"

REM --- Derive VCTOOLPATH from the detected VS location ---
for %%I in ("%VSDIR%") do (
    set "VS_ROOT=%%~dpI"
)
set "VCTOOLPATH=%VS_ROOT%..\VC\Auxiliary\Build"
echo Using VC build tools at "%VCTOOLPATH%"

REM --- Build for x64 ---
call "%VCTOOLPATH%\vcvars64.bat"
rustup default stable-x86_64-pc-windows-msvc
cargo --version --verbose
cargo clean
cargo build --release
xcopy ..\target\release\rure.dll %~dp0\runtimes\win-x64\native\ /Y
REM xcopy ..\target\release\rure.dll %~dp0\runtimes\win-x64\native\

REM --- Build for x86 ---
call "%VCTOOLPATH%\vcvars32.bat"
rustup default stable-i686-pc-windows-msvc
cargo --version --verbose
cargo clean
cargo build --release
xcopy ..\target\release\rure.dll %~dp0\runtimes\win-x86\native\ /Y
REM xcopy ..\target\release\rure.dll %~dp0\runtimes\win-x86\native\

popd
REM pushd %~dp0
dotnet build -c Release -o PublishOutput IronRure.Batteries-Windows.csproj 
