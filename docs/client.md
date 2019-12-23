## 管理工具

优擎区块链数据库管理工具——AngularX版本，具备以下功能：

* 发现链库
* 查看数据库中数据的历史，甚至可以看到单元格的历史
* 监控数据库发生的分叉事件
* 监控数据表中的更改事件，甚至可以监控单元格的更改事件
* 查询数据在区块链上的信息
* 管理私钥

源代码开放在 [GitHub](https://github.com/uchaindb/UClient) 上，
您可以基于该客户端进行二次开发发布，该源代码使用MIT协议。

### 编译

#### 使用 webpack

```bash
$ cd src
$ npm install
$ npm run build
```

#### 使用 msbuild

```bash
$ cd src
$ dotnet build --configuration release
```

### 移动版编译(Cordova)

```bash
$ npm install -g cordova
$ cd cordova
$ npm run copy
$ cordova build ios
$ cordova build android
```

### 包含脚本

- `src` 目录下
  - `npm run serve`: 命令行方式启动webpack进行开发
  - `npm run build`: 编译生产用版本
  - `npm run extract`: 从源代码中提取待翻译的文本
  - `npm run test`: 用于测试（暂不工作）

- `cordova` 目录下
  - `npm run copy`: 将主目录中的webpack编译结果拷贝过来，以便进一步打包移动版

### 代码结构

以下为代码目录结构

```tree
+---.github                     # 存放github协作相关的文件 
+---cordova                     # 本项目使用Cordova来完成iOS和Android客户端的适配
|   +---hooks                   # Cordova的hook存放目录，暂无文件
|   +---model                   # 原始的客户端图标及启动页面资源文件
|   +---platforms               # 【生成目录】cordova用的平台相关文件
|   +---plugins                 # 【生成目录】cordova用的插件相关文件
|   +---res                     # 【生成目录】生成的客户端图标及启动页面资源文件
|   \---www                     # 【生成目录】从webpack打包后的程序从wwwroot目录拷贝过来的
\---src                         # 客户端源代码目录
    +---ClientApp               # 客户端前端源代码目录
    |   +---app                 # Angular主要源代码存放目录
    |   |   +---components      # 组件存放目录
    |   |   |   +---alarm       # 通知相关代码文件
    |   |   |   +---app         # 主程序相关代码文件
    |   |   |   +---controls    # 通用控件相关代码文件
    |   |   |   +---database    # 链库相关代码文件
    |   |   |   +---navmenu     # 导航相关代码文件
    |   |   |   \---user        # 用户相关代码文件
    |   |   +---directives      # 自定义指令源代码
    |   |   +---models          # 模型定义源代码
    |   |   +---pipe            # 自定义管道源代码
    |   |   \---services        # 系统服务源代码
    |   +---assets              # 其他文件
    |   |   \---locale          # 本地化文件
    |   +---dist                # 【生成目录】服务器渲染所使用的webpack打包后的程序集
    |   \---test                # 测试代码
    +---Controllers             # 驱动客户端的服务器代码
    +---Logs                    # 【生成目录】服务器代码执行中生成的日志文件存放目录
    +---Models                  # 服务器端的模型定义源文件
    +---Properties              # 服务器端的属性文件
    +---Views                   # 服务器端的页面驱动文件
    \---wwwroot                 # 站点文件目录
        +---dist                # 【生成目录】客户端所使用的webpack打包后的程序集
        \---images              # 站点的图片文件
```

### 协议

Licensed under the [MIT license](LICENSE).
