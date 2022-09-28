# 说明

这是一个Robocup2d环境安装脚本，只需要执行这个脚本就能一键安装完全部所需环境。

这个脚本会安装：

1. rcssserver

2. rcssmonitor

3. librcsc

4. soccerwindow2

5. fedit2

安装过程会**占满CPU**以提高安装速度，建议在此安装期间不要运行其他程序。

安装脚本使用assets目录中的压缩包进行安装。如果你要更新本地的包，请直接将压缩包放入assets文件夹中，脚本会识别出最新的版本进行安装。注意压缩包内的文件夹名应与压缩包同名。比如rcssserver-17.0.1.tar.gz解压出来应该是rcssserver-17.0.1

脚本会自行识别Linux发行版本进行安装,目前该脚本仅支持`Ubuntu`/`ArchLinux`/`Manjaro`，其他发行版可以在`env-others`文件里配置安装依赖的命令，格式可以参考`env-archlinux.sh`或`env-ubuntu.sh`文件。

# 安装

## 前提

首先假定你已经完成了基本的系统配置，比如你已经

1. 给系统换好了源

2. 更新了系统

3. 安装了python3和python3-pip

## 使用方法

执行环境安装脚本：

```shell
git clone https://gitee.com/juzaizai/robocup2d-environment.git
cd robocup2d-environment
pip3 install -r requirements.txt
python3 install.py
```

# 运行

## 运行soccerwindow2

```shell
soccerwindow2
```

## 运行monitor

```shell
rcssmonitor
```

## 运行server

```shell
rcssserver
```

## 运行fedit2

```shell
fedit2
```

## 终止server进程

```shell
killall -9 rcssserver
```

# 参考链接

[helios-base](https://github.com/helios-base/helios-base.git)

[Pyrus2D](https://github.com/Cyrus2D/Pyrus2D.git)

[librcsc](https://github.com/helios-base/librcsc.git)

[rcssserver](https://github.com/rcsoccersim/rcssserver.git)

[rcssmonitor](https://github.com/rcsoccersim/rcssmonitor.git)

[soccerwindow2](https://github.com/helios-base/soccerwindow2.git)

[fedit2](https://github.com/helios-base/fedit2.git)
