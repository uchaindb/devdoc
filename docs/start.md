## 入门

优链数据库使用区块链技术使得数据库中的数据历史不可更改。

优链数据库使用C#开发，采用.NET Core跨平台框架，支持以下操作系统：

* Windows x64/x86
* Linux x64
* Docker
* Mac（理论支持，尚未测试）


### 直接运行

> 前置条件:
> * [.Net core 2.0](https://www.microsoft.com/net/download/Windows/run)

1. 从 <https://github.com/uchaindb/Binary/releases> 下载程序包
1. 将程序包解压至任意目录
1. 对文件appsettings.json进行[配置](/docs/config "配置")
1. 执行命令
  ```sh
  $ dotnet NodeWeb.dll
  ```
1. 打开网页查看是否已经顺利启动。默认地址：<http://localhost:5000/version>

### Docker中运行

基于镜像，运行容器

```sh
$ docker run -it --name demo -p 8912:80 uchaindb/uchaindb:latest
```

### 管理工具

服务器启动后，默认会启用本地的管理工具，使用服务器暴露的端口进行访问。

若未启用本地管理工具，可以访问优链数据库官方提供的管理工具 <http://app.uchaindb.com>  

