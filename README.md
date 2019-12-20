# Omega

## Dependence

* Git
* CMake
* MinGW
* MSYS2
* Python

## Build

```bash
git clone --depth 1 --recurse-submodules --shallow-submodules -j3 git@github.com:XhstormR/Omega.git
cd Omega
./make.bat
```

构建生成的文件存放在 `cmake-build-default` 目录下。

## Use

### Meterpreter Loader

该模块能够与 `reverse_tcp_rc4` Meterpreter 直接通信，无需调用 `msfvenom` 生成 Payload。

### Shellcode Launcher
