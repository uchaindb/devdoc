<h2 align="center"><img src="https://github.com/uchaindb/devdoc/blob/master/_media/logo.png?raw=true" height="128"><br>优擎区块链数据库</h2>
<p align="center"><strong>开发文档</strong></p>

优擎区块链数据库使用区块链技术使得数据库中的数据历史不可更改。

访问这里查看文档：<http://doc.uchaindb.com>

# 入门指引

优擎区块链数据库使用区块链技术使得数据库中的数据历史不可更改。

![Overview](docs/images/01/server-client-overview.png "Overview")  

在本入门指引中分成服务器部分和客户端部分分别讲述：

- [服务器](#服务器)
- [客户端](#客户端)

优擎区块链数据库[影子解决方案](?file=docs/shadowdb "影子方案")，
是在优擎区块链数据库的基础上提供的一种简单易行上链方案：

- 可以不用对现有系统进行内部改造；
- 优擎区块链数据库影子方案可以部署至同一台服务器或完全独立的服务器上；
- 所有数据及时上链，更改信息可追溯；
- 可选择公布信息，用户使用客户端查看公开信息；

可至 [案例分析](#案例分析) 部分查看相关案例。

## 服务器

优擎区块链数据库使用C#开发，采用.NET Core跨平台框架，支持以下操作系统：

* Windows x64/x86
* Linux x64
* Docker
* Mac（理论支持，尚未测试）

### 安装

我们提供多种安装方式，

- [Windows下安装](/docs/installation "Windows下安装")
  对于同时是Windows下的应用，可以使用该方式，或者在使用Windows作为开发平台时的情况。
- [Docker下安装](/docs/installation "Docker下安装")
  对于部署到Linux下的应用，或者使用Linux作为开发平台的情况。

### 配置

参见 [配置](/docs/config "配置") 部分

### 在线测试服务器

在线演示： http://app.uchaindb.com  
或者扫描二维码在手机端查看：

![qr](_media/appqr.png "qr")  

## 客户端

在服务器正常运行后，你需要通过以下客户端库来与服务器通讯。

- [nuget程序包](?file=docs/sdk "nuget程序包")
- [npm程序包](?file=docs/sdk "npm程序包")

### 示例程序

您可以直接在以下示例程序的基础上进行修改，以适应您的业务需求：

- [AngularX客户端](?file=07-示例客户端/1-AngularX客户端 "AngularX客户端")

## 案例分析

- [公益数据库](?file=docs/cases "公益数据库")
