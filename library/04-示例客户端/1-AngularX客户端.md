# AngularX客户端

优擎客户端——AngularX版本，具备以下功能：

* 发现链库
* 查看数据库中数据的历史，甚至可以看到单元格的历史
* 监控数据库发生的分叉事件
* 监控数据表中的更改事件，甚至可以监控单元格的更改事件
* 查询数据在区块链上的信息
* 管理私钥

源代码开放在 [GitHub](https://github.com/uchaindb/UClient) 上，
您可以基于该客户端进行二次开发发布，该源代码使用MIT协议。

## 编译

### 使用 webpack

```bash
$ cd src
$ npm install
$ npm run build
```

### 使用 msbuild

```bash
$ cd src
$ dotnet build --configuration release
```

## 移动版编译(Cordova)

```bash
$ npm install -g cordova
$ cd cordova
$ npm run copy
$ cordova build ios
$ cordova build android
```

## 使用方法

TBD

## 包含脚本

- `src` 目录下
  - `npm run serve`: 命令行方式启动webpack进行开发
  - `npm run build`: 编译生产用版本
  - `npm run extract`: 从源代码中提取待翻译的文本
  - `npm run test`: 用于测试（暂不工作）

- `cordova` 目录下
  - `npm run copy`: 将主目录中的webpack编译结果拷贝过来，以便进一步打包移动版

## 协议

Licensed under the [MIT license](LICENSE).
