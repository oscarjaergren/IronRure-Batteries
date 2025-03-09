REM --- Locate Visual Studio tools for x64 ---
set "VS_PATHS=C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Auxiliary\Build\vcvars64.bat;C:\Program Files\Microsoft Visual Studio\2022\Professional\VC\Auxiliary\Build\vcvars64.bat;C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"
set "VSDIR="
for %%p in ("%VS_PATHS:;=" "%") do (
    if exist "%%~p" (
        set "VSDIR=%%~p"
        goto :found_vcvars64
    )
)
echo vcvars64.bat not found.
exit /b 1
:found_vcvars64
echo Found vcvars64.bat at "%VSDIR%"
call "%VSDIR%"
pushd %~dp0\rure\regex-capi
cargo clean
cargo build --release
popd
