# Omega

## Dependence

* Git
* CMake
* Clang
* MinGW
* MSYS2
* Python

## Build

```bash
git clone --depth 1 --recurse-submodules --shallow-submodules -j3 git@github.com:XhstormR/Omega.git
cd Omega
make.bat
```

构建生成的文件存放在 `cmake-build-default` 目录下。

## Use

### Meterpreter Loader

该模块能够与 `reverse_tcp_rc4` Meterpreter 直接通信，无需调用 `msfvenom` 生成 Payload。

若工作目录下存在 `handler.txt` 文件，则按以下格式从其中读取 `Meterpreter` 连接配置；若不存在此文件，则使用默认连接配置。

```bash
0.0.0.0:443:pass
```

### Shellcode Launcher

该模块能够加载并执行外部 `shellcode`。若工作目录下存在 `payload.txt` 文件，则以 HEX 格式加载并执行。

### UAC Enigma

该模块能够自动 ByPass UAC，并提升至 SYSTEM 权限。
