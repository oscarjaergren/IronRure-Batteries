pushd %~dp0\rure\regex-capi

SET VCTOOLPATH=C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\
echo "%VCTOOLPATH%

call "%VCTOOLPATH%\vcvars64.bat"
%~dp0\rust-nightly-x86_64-pc-windows-msvc.exe /VERYSILENT /NORESTART /DIR="C:\Program Files (x86)\Rust\"
cargo clean
cargo build --release
xcopy ..\target\release\rure.dll %~dp0\runtimes\win-x64\native\


call "%VCTOOLPATH%\vcvars32.bat"
%~dp0\rust-nightly-i686-pc-windows-msvc.exe /VERYSILENT /NORESTART /DIR="C:\Program Files (x86)\Rust\"
cargo clean
cargo build --release
xcopy ..\target\release\rure.dll %~dp0\runtimes\win-x86\native\

pushd %~dp0
dotnet build IronRure.Batteries-Windows.csproj
