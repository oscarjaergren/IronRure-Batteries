REM --- Locate Visual Studio tools for x86 ---
set "VS_PATHS=C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Auxiliary\Build\vcvars32.bat;C:\Program Files\Microsoft Visual Studio\2022\Professional\VC\Auxiliary\Build\vcvars32.bat;C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars32.bat"
set "VSDIR="
for %%p in ("%VS_PATHS:;=" "%") do (
    if exist "%%~p" (
        set "VSDIR=%%~p"
        goto :found_vcvars32
    )
)
echo vcvars32.bat not found.
exit /b 1
:found_vcvars32
echo Found vcvars32.bat at "%VSDIR%"
call "%VSDIR%"
pushd %~dp0\rure\regex-capi
cargo clean
cargo build --release
popd
