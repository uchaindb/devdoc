## 影子方案

优擎区块链数据库影子解决方案，是在优擎区块链数据库的基础上提供的一种简单易行上链方案：

- 可以不用对现有系统进行内部改造；
- 优擎区块链数据库影子方案可以部署至同一台服务器或完全独立的服务器上；
- 所有数据及时上链，更改信息可追溯；
- 可选择公布信息，用户使用客户端查看公开信息；

### 系统架构

![Overview](images/01/shadowing-overview.png "Overview")  

* 现有系统：已经存在的一套正在运行的系统，数据库可能为多个子系统提供服务；
* 同步器：通过读取数据库中的信息将数据库当时状态的信息同步至优擎区块链数据库，进而同步至优擎区块链网络；
* 优擎网络：由一个或多个优擎区块链数据库组成的优擎区块链网络；
* 客户端：授权客户在接入指定授权网络后，可以访问优擎区块链数据库信息，查看和了解数据及区块信息；

### 架构限制

优擎区块链数据库的数据上限及处理速度尚未达到主流非区块链数据库的级别，
参考 [性能说明](?file=01-简介/4-性能说明 "性能说明")，
在选型时注意确认性能要求。

### 后续扩展

可以按照以下步骤逐步将传统数据库转换为区块链数据库。

* 第一步，**使用数据库快照的方式进行**，无须对现有系统进行改造，即可简单快捷的接入优擎区块链数据库。
* 第二步，**直接作为关系型数据库使用**，但功能比市面上已有的关系型数据库（如SqlServer或MySql）受到更多的限制，但也可以获得区块链独有的智能合约等功能，故原信息系统需要进行部分改造才能接入。

### 快速上手

#### 确保系统的依赖项已经安装

* [.Net core 2.0](https://www.microsoft.com/net/download/Windows/run)： 需要分别安装 `.NET Core Runtime` 和 `ASP.NET Core runtime`.

#### 安装及配置优擎区块链数据库

请参阅 [入门指引](?file=01-简介/1-入门指引 "入门指引") 完成优擎区块链数据库的安装及配置。

#### 安装及配置同步器

同步器源代码地址：<https://github.com/uchaindb/DbSynchronizer>

1. 请通过[执行文件发布页面](https://github.com/uchaindb/DbSynchronizer/releases)下载最新的压缩包
1. 确保dotnet core runtime已经安装
1. 将该压缩包解压至任意目录
1. 请参考后面的配置项说明进行配置
1. 通过执行`run.cmd`启动程序
1. 若需停止运行，可以通过`Ctrl+C`终止程序

##### 配置项说明

| 配置项                                                         | 类型       | 默认值 | 描述                                             |
| ---                                                            | ---        | ---    | ---                                              |
| AppSettings:SyncDelayInSeconds                                 | 数字       | 10     | 同步器全自动运行时，两次同步发生的间隔秒数       |
| AppSettings:SyncConfigurationDefault:Chain:Address             | 字符串     | 【空】 | 默认的优擎区块链数据库的运行地址                       |
| AppSettings:SyncConfigurationDefault:Chain:PrivateKey          | 字符串     | 【空】 | 默认的用于向优擎区块链数据库创建事务的私钥地址         |
| AppSettings:SyncConfigurationDefault:Chain:TableName           | 字符串     | 【空】 | 默认的优擎区块链数据库中的目标表名                     |
| AppSettings:SyncConfigurationDefault:Database:ConnectionString | 字符串     | 【空】 | 默认的连接现有数据库的链接字符串                 |
| AppSettings:SyncConfigurationDefault:Database:PkName           | 字符串     | "Id"   | 默认的主键名称                                   |
| AppSettings:SyncConfigurations[i]:Chain:Address                | 字符串     | 【空】 | 该条同步配置的优擎区块链数据库的运行地址               |
| AppSettings:SyncConfigurations[i]:Chain:PrivateKey             | 字符串     | 【空】 | 该条同步配置的用于向优擎区块链数据库创建事务的私钥地址 |
| AppSettings:SyncConfigurations[i]:Chain:TableName              | 字符串     | 【空】 | 该条同步配置的优擎区块链数据库中的目标表名             |
| AppSettings:SyncConfigurations[i]:Database:ConnectionString    | 字符串     | 【空】 | 该条同步配置的连接现有数据库的链接字符串         |
| AppSettings:SyncConfigurations[i]:Database:PkName              | 字符串     | "Id"   | 该条同步配置的主键名称                           |
| AppSettings:SyncConfigurations[i]:Database:SqlSelect           | 字符串数组 | 【空】 | 该条同步配置的数据查询语句                       |

同步器配置文件的样例：（appsettings.json文件中的核心部分）

```json
{
  "SyncDelayInSeconds": "10",
  "SyncConfigurationDefault": {
    "Chain": {
      "Address": "http://localhost:7847/api/rpc",
      "PrivateKey": "5aDSKJxc8KtJBdwtwtefqra34iSrEc8Wjk1csbsT9MNF"
    },
    "Database": {
      "ConnectionString": "Server=(localdb)\\MSSQLLocalDB;Database=Backend;Trusted_Connection=True;MultipleActiveResultSets=true",
      "PkName": "Id"
    }
  },
  "SyncConfigurations": [
    {
      "Chain": {
        "TableName": "捐赠记录"
      },
      "Database": {
        "SqlSelect": [
          "SELECT [Id] ,[Money] as [捐赠金额] ,[ParticipantId] as [捐赠者Id] ,[PostScript] as [附言] ,[ProjectId] as [项目Id] ,[DateCreated] as [时间]",
          "FROM [dbo].[AppDonationRecords]",
          "WHERE Status=1",
          "ORDER BY [DateCreated]"
        ]
      }
    },
    {
      "Chain": {
        "TableName": "项目"
      },
      "Database": {
        "SqlSelect": [
          "SELECT Id, TargetMoney as [目标金额], [Subject] as [项目名称], [Location] as [所在地], [Description] as [项目描述], DateCreated as [时间]",
          "FROM dbo.AppProjects",
          "WHERE [Status]=4 OR ([Status]>=6 AND [Status]<=11)",
          "ORDER BY [DateCreated]"
        ]
      }
    }
  ]
}
```
