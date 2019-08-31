## 直接运行

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

### 升级

1. 下载新的程序包
2. 解压至同一目录

**注意**：请自行备份配置文件

### 卸载

将解压出来的文件删除即可完成卸载。

## Docker

### 准备 Docker 环境

具体步骤可以参考[官网安装步骤(英文)](https://docs.docker.com/install/)
或者 [Docker安装指南(国内中文)](https://yeasy.gitbooks.io/docker_practice/content/install/)，
通过以下命令测试是否成功安装

```
$ docker -v
```

### 运行容器

基于镜像，运行容器

```
$ docker run -it --name demo -p 8912:80 uchaindb/uchaindb:latest
```

### 快速在线Demo

使用Play with Docker的服务，可以快速方便的在网上架设一个临时的demo环境，使用步骤：

* 步骤 1: [单击这里](https://labs.play-with-docker.com/?stack=https://raw.githubusercontent.com/uchaindb/Binary/master/stack.yml) 开始

* 步骤 2: 首次使用时需要登录你的Docker账号. 如果还没有账号，需要在 <https://hub.docker.com> 注册一个

  ![play with docker first page](images/02/pwd-step1.png)
  ![login with docker id](images/02/pwd-step2.png)

* 步骤 3: 进入页面后便会开始初始化临时虚拟环境，并下载镜像文件到这个虚拟环境中去。
  这个临时虚拟环境是在云端的，并不会在你的电脑中留下任何东西。
  初始化完成后点击`CLOSE`关闭窗口继续。

  ![initializing](images/02/pwd-step3.png)

* 步骤 4: 优链数据库会在后台自动进行初始化，如果想要看到整个过程的日志，输入
  `docker logs -f pwd`**&lt;按tab键自动完成输入&gt;**.

  ![monitor process](images/02/pwd-step4.png)

* 步骤 5: 点击页面上部的数字 `8912` 以打开刚才启动的优链数据库实例

  ![find port](images/02/pwd-step5.png)
  ![main ui](images/02/db-step1.png)

这个临时虚拟环境可以最长运行4小时，你可以随时点击 `CLOSE SESSION` 停止和关闭这个虚拟环境，所有的云端资料也会被抹除。

### 简单操作

初始化完成后，你就获得了一个全功能的演示环境

* 步骤 1: 点击 `添加链库` 以进一步连接已启动的实例

  ![main ui](images/02/db-step1.png)

* 步骤 2: 在这个页面中，点击 `手动添加链库` 按钮

  ![](images/02/db-step2.png)

* 步骤 3: 在网络地址字段，填入当前地址加上 `/api/rpc`, 例如在图中的实例就是 `http://ip172-18-0-51-bl8hakhht4r000d37n2g-8912.direct.labs.play-with-docker.com/api/rpc`

  ![](images/02/db-step3.png)

* 步骤 4: 最终你成功的连接上了优链数据库

  ![](images/02/db-step4.png)
