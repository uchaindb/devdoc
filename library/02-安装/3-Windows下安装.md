# Windows下安装

> 前置条件:
> * [.Net core 2.0](https://www.microsoft.com/net/download/Windows/run)，其中包含 `.NET Core Runtime` 和 `ASP.NET Core runtime`.

1. 从 <https://github.com/uchaindb/Binary/releases> 下载程序包
1. 将程序包解压至任意目录
1. 对文件appsettings.json进行[配置](?file=02-安装/2-配置 "配置")
1. 执行命令
  ```
  $ dotnet NodeWeb.dll
  ```
1. 打开网页查看是否已经顺利启动。默认地址：<http://localhost:5000/version>

## 升级

1. 下载新的程序包
2. 解压至同一目录

**注意**：请自行备份配置文件

## 卸载

将解压出来的文件删除即可完成卸载。
