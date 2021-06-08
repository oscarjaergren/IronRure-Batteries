if ($PSVersionTable.Platform -eq "Unix") {
    bash ./ci_build_unix.sh
}
else{
    .\ci_build_win.bat
}
