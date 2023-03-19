# 仓库 b12

本仓库为使用 Flutter 开发的控制面板应用程序，旨在在树莓派4B开发板上与猫咪进行交互。该应用程序类似于游戏《Stray》中主角身上的B12控制面板，允许用户与他们的猫咪进行交流。



## 安装

在树莓派 4B 上使用Flutter开发的应用程序需要以下条件：

- 树莓派 4B 设备
- 安装 Raspbian 操作系统
- Flutter SDK

安装Flutter SDK的方法可以参考[官方文档](https://flutter.dev/docs/get-started/install/linux)。在安装完成Flutter SDK后，可以通过运行以下命令检查Flutter是否正确安装：

```
rubyCopy code
$ flutter doctor
```

## 用法

在克隆该仓库后，您需要将 Flutter 应用程序构建为树莓派的 ARM 架构，命令如下：

```
cssCopy code
$ flutter build apk --target-platform android-arm
```

构建完成后，您可以将应用程序安装到树莓派上，命令如下：

```
rubyCopy code
$ flutter install
```

此时，您可以打开应用程序并开始使用它与您的猫咪进行交流。

## 功能

本应用程序计划支持以下功能：

- 播放 b12 语音
- 翻译简单的猫咪叫声
- 查看猫咪当前的状态
- 引导猫咪的移动
