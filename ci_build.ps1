if ($PSVersionTable.Platform -eq "Unix") {
    sh ./ci_build_unix.sh
}
else{
    Start-FileDownload "https://static.rust-lang.org/dist/rust-nightly-x86_64-pc-windows-msvc.exe"
    Start-FileDownload "https://static.rust-lang.org/dist/rust-nightly-i686-pc-windows-msvc.exe"
    .\ci_build_win.bat
}
