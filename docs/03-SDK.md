# API说明

## 关于API文档

API文档主要描述服务器API的使用方法，以及设计思路。

属性、方法、参数及事件将在适用的时候在文档中详细列出。

## 稳定指数

<div class="api-stability api-stability-0">
<a href="?file=03-SDK/01-API说明#稳定指数">稳定指数：0</a> - 弃用
<br />该功能已知有问题，并可能会在未来进行修改。请勿依赖该接口，大版本更新时不会考虑该接口的向后兼容性。
</div>

<div class="api-stability api-stability-1">
<a href="?file=03-SDK/01-API说明#稳定指数">稳定指数：1</a> - 试验
<br />该功能仍旧处于活跃的开发状态，并不保证在未来版本的向后兼容性，甚至可能会被移除。
并不推荐在生产环境中使用该功能。
</div>

<div class="api-stability api-stability-2">
<a href="?file=03-SDK/01-API说明#稳定指数">稳定指数：2</a> - 稳定
<br />该功能已经证明符合设计要求，兼容性在升级时会被优先考虑。若非绝对必要，该功能将拥有长期兼容性。
</div>

## 基于Json Rpc的服务器API

服务器的API接口基于Json Rpc实现，所有请求均发送至以下地址：

```
/api/rpc
```

使用Json Rpc中的`Method`字段区分请求的API。

示例请求：

```json
{
    "id": 1,
    "jsonrpc": "2.0",
    "method": "Status",
    "params": []
}
```

示例响应：

```json
{
    "id": 1,
    "jsonrpc": "2.0",
    "result": {
        "Height": 19,
        "Tail": {
            "BookKeeper": "3fxFWBe8WsLF9LQ69k432y6FKWrX",
            "Hash": "GoZLYTpJwscZUppymg3nXvpvzoETqzL5JFrrT6nohC8t",
            "Height": 19,
            "PreviousBlockHash": "ENHPDaXo3KJvVJMdMEDeVwcDn6w7iPrjJ753NKBQ2UeJ",
            "Signature": "e8thyF8SQj5QhmUfksVa86AUqw1z771DsDjCGNT8faGCUapUfKKNUDqyGttQpD8qT4gVXZWyisKRLk9CmBcD4N1",
            "Time": 1521531941717,
            "Transactions": [
                {
                    "Actions": [
                        {
                            "Columns": [
                                {
                                    "Data": "6D0860E7-A762-4A75-8D1D-FD85D187A6EC",
                                    "Name": "Id"
                                },
                                {
                                    "Data": "1.00",
                                    "Name": "\u6350\u8d60\u91d1\u989d"
                                },
                                {
                                    "Data": "c84b5deb-289d-4d46-a4f8-da24b8c50e33",
                                    "Name": "\u6350\u8d60\u8005Id"
                                },
                                {
                                    "Data": "171",
                                    "Name": "\u9644\u8a00"
                                },
                                {
                                    "Data": "12e25d61-bd4d-421f-989e-f76ed19572a6",
                                    "Name": "\u9879\u76eeId"
                                },
                                {
                                    "Data": "2018-03-17 15:50:39",
                                    "Name": "\u65f6\u95f4"
                                }
                            ],
                            "SchemaName": "\u6350\u8d60\u8bb0\u5f55",
                            "Type": "InsertDataAction"
                        }
                        // ,{...}
                        // ,{...}
                        // ,{...}
                        // ,{...}
                    ],
                    "Block": "GoZLYTpJwscZUppymg3nXvpvzoETqzL5JFrrT6nohC8t",
                    "Hash": "8DAM4BwYC1T54Zr1aSMnQf7a5bamcFjcGKfTVUtd3XCL",
                    "Initiator": "2tacthqMim7QTU4JXg6iQtBzTA52",
                    "Signature": "4nYpWiatz1BQFzb2f1eHtV6vDiYVXZCUZEbu3DV5xyQKCzJf1XMYd2sZVXzZEZqPMB3s5T3AC5FzGQgZhSjoRnZd",
                    "Type": "DataTransaction",
                    "UnlockScripts": [
                        {
                            "Object": "3kC8X57GCS7jwjm4NQGaqgxgu9g4Fjvtv2Frgs1xmHNeHEpT6BQGdpcETSM2yhUxVZmjx6jq5N7HcumXVpMuQKz5",
                            "OpCode": "Object"
                        }
                    ],
                    "WitnessBlock": "JCDasMZGZNo4CfCLVs2mfL8A6Hh4Axt9Jj6pRWmQw6iy"
                }
                // ,{...}
            ],
            "Version": 1
        }
    }
}
```

示例错误响应：

```json
{
    "id": 1,
    "jsonrpc": "2.0",
    "error": { 
        "code": -32601,
        "message": "Method not found"
    }
}
```

# 创建事务相关API

>1. [增删改表结构](#增删改表结构 "增删改表结构")
1. [增删改表数据](#增删改表数据 "增删改表数据")
1. [锁定、解锁](#锁定、解锁 "锁定、解锁")

## 增删改表结构

对数据库中的数据表的结构进行增删改操作。

<div class="api-stability api-stability-1">
<a href="?file=03-SDK/01-API说明#稳定指数">稳定指数：1</a> - 试验
</div>

> 引入版本：V0.1

### 请求

请求方法：CreateSchemaTransaction

| 参数名        | 类型       | 必填  | 描述                   |
| ---           | ---        | :---: | ---                    |
| Initiator     | Address    | 是    | 发起者地址             |
| Signature     | Signature  | 是    | 发起者对本次请求的签名 |
| WitnessBlock  | UInt256    | 是    | 见证区块ID             |
| UnlockScripts | Text       | 否    | 解锁脚本               |
| Actions       | 结构动作[] | 是    | 执行的表结构增删改操作 |

结构动作：

| 参数名             | 类型     | 必填  | 描述                                                                             |
| ---                | ---      | :---: | ---                                                                              |
| Name               | Text     | 是    | 进行增删改的对象表名称                                                           |
| Type               | Text     | 是    | 动作类型：<br>"CreateSchemaAction"<br>"ModifySchemaAction"<br>"DropSchemaAction" |
| Columns            | 列定义[] | 否    | 新增表时的必填项，表中的列信息                                                   |
| AddOrModifyColumns | 列定义[] | 否    | 修改表时的必填项，添加或修改的列信息                                             |
| DropColumns        | String[] | 否    | 修改表时的必填项，需要删除的表名称                                               |

<div class="info">

> 其中，在AddOrModifyColumns字段中，若列名称与当前表格已存在的列名称相同，则为修改，否则为添加。
</div>

列定义：

| 参数名     | 类型    | 必填  | 描述                                               |
| ---        | ---     | :---: | ---                                                |
| Name       | Text    | 是    | 列名称                                             |
| Type       | Text    | 是    | 列类型，可用值：<br>"String"<br>"Number"<br>"Blob" |
| PrimaryKey | Boolean | 否    | 该列是否为主键                                     |


### 示例

请求示例：
```json
{
    "id": 1,
    "jsonrpc": "2.0",
    "method": "CreateSchemaTransaction",
    "params": [
        "9E7zCw6Rez2t5FzzdALVSzd3X3h",
        "285MHeQuCs47yWqT6ezGghtoWz8SzJTcDjRkkvPEhcg7FR93i4m7KV9U6UZqvcZosPfHebyMRhz1hGJN34vEe7bQ",
        "GoZLYTpJwscZUppymg3nXvpvzoETqzL5JFrrT6nohC8t",
        null,
        "{\"Type\":\"CreateSchemaAction\",\"Name\":\"\u6350\u8d60\u8bb0\u5f55\",\"Columns\":[{\"Type\":\"String\",\"Name\":\"Id\",\"PrimaryKey\":true},{\"Type\":\"String\",\"Name\":\"\u6350\u8d60\u91d1\u989d\",\"PrimaryKey\":false},{\"Type\":\"String\",\"Name\":\"\u6350\u8d60\u8005Id\",\"PrimaryKey\":false},{\"Type\":\"String\",\"Name\":\"\u9644\u8a00\",\"PrimaryKey\":false},{\"Type\":\"String\",\"Name\":\"\u9879\u76eeId\",\"PrimaryKey\":false},{\"Type\":\"String\",\"Name\":\"\u65f6\u95f4\",\"PrimaryKey\":false}],\"AddOrModifyColumns\":null,\"DropColumns\":null}",
        "{\"Type\":\"CreateSchemaAction\",\"Name\":\"\u9879\u76ee\",\"Columns\":[{\"Type\":\"String\",\"Name\":\"Id\",\"PrimaryKey\":true},{\"Type\":\"Number\",\"Name\":\"\u76ee\u6807\u91d1\u989d\",\"PrimaryKey\":false},{\"Type\":\"String\",\"Name\":\"\u9879\u76ee\u540d\u79f0\",\"PrimaryKey\":false},{\"Type\":\"String\",\"Name\":\"\u9879\u76ee\u63cf\u8ff0\",\"PrimaryKey\":false},{\"Type\":\"String\",\"Name\":\"\u6240\u5728\u5730\",\"PrimaryKey\":false},{\"Type\":\"String\",\"Name\":\"\u65f6\u95f4\",\"PrimaryKey\":false}],\"AddOrModifyColumns\":null,\"DropColumns\":null}"
    ]
}
```

返回正确响应示例：

```json
{
    "id": 1,
    "jsonrpc": "2.0",
    "result": {
        "TransactionId": "gqGQAfdeFqugvzsQox4Qp2m2P4YJnhAu8pR1tdNfTJW"
    }
}
```

### 备注说明
无

### 修改日志
- V0.1 创建该API



## 增删改表数据

对数据库中的数据表中的数据进行增删改操作。

<div class="api-stability api-stability-1">
<a href="?file=03-SDK/01-API说明#稳定指数">稳定指数：1</a> - 试验
</div>

> 引入版本：V0.1

### 请求

请求方法：CreateDataTransaction

| 参数名        | 类型       | 必填  | 描述                   |
| ---           | ---        | :---: | ---                    |
| Initiator     | Address    | 是    | 发起者地址             |
| Signature     | Signature  | 是    | 发起者对本次请求的签名 |
| WitnessBlock  | UInt256    | 是    | 见证区块ID             |
| UnlockScripts | Text       | 否    | 解锁脚本               |
| Actions       | 数据动作[] | 是    | 执行的表数据增删改操作 |

数据动作：

| 参数名          | 类型     | 必填  | 描述                                                                     |
| ---             | ---      | :---: | ---                                                                      |
| SchemaName      | Text     | 是    | 进行增删改的对象表名称                                                   |
| Type            | Text     | 是    | 动作类型："InsertDataAction"<br>"UpdateDataAction"<br>"DeleteDataAction" |
| PrimaryKeyValue | Text     | 否    | 进行增删改的对象行的主键值                                                   |
| Columns         | 列数据[] | 否    | 新增或修改表数据时的必填项，行中的列数据信息                             |

列数据：

| 参数名 | 类型 | 必填  | 描述   |
| ---    | ---  | :---: | ---    |
| Name   | Text | 是    | 列名称 |
| Data   | Text | 是    | 列数据 |


### 示例

请求示例：
```json
{
    "id": 1,
    "jsonrpc": "2.0",
    "method": "CreateDataTransaction",
    "params": [
        "9E7zCw6Rez2t5FzzdALVSzd3X3h",
        "4UAs1UsQhsV58N3s9HWkrcRR3WQ9ZsT7kckg1DhVt6fhWCDFGWXueHfeZN1KDyDbUz31jFxBJHsKedCAf2deqDLC",
        "GoZLYTpJwscZUppymg3nXvpvzoETqzL5JFrrT6nohC8t",
        null,
        "{\"Type\":\"InsertDataAction\",\"SchemaName\":\"\u6350\u8d60\u8bb0\u5f55\",\"Columns\":[{\"Name\":\"Id\",\"Data\":\"1\"},{\"Name\":\"\u6350\u8d60\u91d1\u989d\",\"Data\":\"2\"},{\"Name\":\"\u6350\u8d60\u8005Id\",\"Data\":\"3\"},{\"Name\":\"\u9644\u8a00\",\"Data\":\"4\"},{\"Name\":\"\u9879\u76eeId\",\"Data\":\"5\"},{\"Name\":\"\u65f6\u95f4\",\"Data\":\"6\"}],\"PrimaryKeyValue\":null}"
    ]
}
```

返回正确响应示例：

```json
{
    "id": 1,
    "jsonrpc": "2.0",
    "result": {
        "TransactionId": "5hoA22FaJKoBgQuhHNnD1RGVRqHWs8knQRMBLLA1hGiQ"
    }
}
```

### 备注说明
无

### 修改日志
- V0.1 创建该API

## 锁定、解锁

对数据库或数据表的结构或数据进行锁定及解锁操作，以保证数据库受到权限的管理。

<div class="api-stability api-stability-1">
<a href="?file=03-SDK/01-API说明#稳定指数">稳定指数：1</a> - 试验
</div>

> 引入版本：V0.1

### 请求

请求方法：CreateLockTransaction

| 参数名        | 类型       | 必填  | 描述                       |
| ---           | ---        | :---: | ---                        |
| Initiator     | Address    | 是    | 发起者地址                 |
| Signature     | Signature  | 是    | 发起者对本次请求的签名     |
| WitnessBlock  | UInt256    | 是    | 见证区块ID                 |
| UnlockScripts | Text       | 否    | 解锁脚本                   |
| LockScripts   | Text       | 是    | 锁定脚本                   |
| Targets       | 锁定对象[] | 是    | 使用锁定脚本进行锁定的对象 |

锁定对象：

| 参数名           | 类型     | 必填  | 描述                 |
| ---              | ---      | :---: | ---                  |
| TargetType       | 对象类型 | 是    | 锁定对象，说明见表后 |
| PublicPermission | 开放权限 | 是    | 开放权限，说明见表后 |
| TableName        | Text     | 否    | 进行锁定的表名称     |
| PrimaryKey       | Text     | 否    | 进行锁定的主键值     |
| ColumnName       | Text     | 否    | 进行锁定的列名       |

<div class="info">

> 对象类型：
> * None：无对象
> * Database：整个数据库的数据及结构变化
> * TableSchema：整个数据表的数据及结构变化
> * TableRowData：数据表中整行数据变化
> * TableCellData：数据表中具体单元格数据变化
> * TableColumnData：数据表中整列数据及结构变化
> 
> 开放权限：
> * None：未开放任意权限
> * ReadOnly：向公众开放只读权限
> * Insert：向公众开放插入权限
> * Update：向公众开放更新权限
> * Delete：向公众开放删除权限
> * AlterSchema：向公众开放修改表结构的权限
> * AlterLock：向公众开放锁定修改的权限
</div>

<div class="warning">

> 在开放权限中，None及ReadOnly权限与其他权限不可同时选中。
</div>

### 示例

请求示例：
```json
{
    "id": 1,
    "jsonrpc": "2.0",
    "method": "CreateLockTransaction",
    "params": [
        "9E7zCw6Rez2t5FzzdALVSzd3X3h",
        "2i6GnuU5NTfXSGQxyEF4PEBchn2F2cbuBGZKzw1WMLru4tEKvgGMSgzAeJPZ3NaW6D1peZFuAonTTYigHrYipTcB",
        "GoZLYTpJwscZUppymg3nXvpvzoETqzL5JFrrT6nohC8t",
        null,
        "29uQFTkaBQr745QK8DwMov31FzCyfBcaxetGmSLExEqFu\nOC_CheckSignature",
        "{\"TargetType\":\"TableSchema\",\"PublicPermission\":[\"ReadOnly\"],\"TableName\":\"\u6350\u8d60\u8bb0\u5f55\"}",
        "{\"TargetType\":\"TableSchema\",\"PublicPermission\":[\"ReadOnly\"],\"TableName\":\"\u9879\u76ee\"}"
    ]
}
```

返回正确响应示例：

```json
{
    "id": 1,
    "jsonrpc": "2.0",
    "result": {
        "TransactionId": "3ukVPgPG1gL5pzrMezESUPS2YYPW9wSGg2wrUe5J9n2r"
    }
}
```

### 备注说明
无

### 修改日志
- V0.1 创建该API
# 查询相关API

>1. [查询表](#查询表 "查询表")
1. [查询表数据](#查询表数据 "查询表数据")
1. [查询链数据](#查询链数据 "查询链数据")
1. [查询表单元数据](#查询表单元数据 "查询表单元数据")

## 查询表

列出数据库中所有的数据表。

<div class="api-stability api-stability-1">
<a href="?file=03-SDK/01-API说明#稳定指数">稳定指数：1</a> - 试验
</div>

> 引入版本：V0.1

### 请求

请求方法：ListTables

无请求参数

### 示例

请求示例：
```json
{
    "id": 1,
    "jsonrpc": "2.0",
    "method": "ListTables",
    "params": []
}
```

返回正确响应示例：

```json
{
    "id": 1,
    "jsonrpc": "2.0",
    "result": {
        "Tables": [
            {
                "Headers": [
                    "Id",
                    "\u6350\u8d60\u91d1\u989d",
                    "\u6350\u8d60\u8005Id",
                    "\u9644\u8a00",
                    "\u9879\u76eeId",
                    "\u65f6\u95f4"
                ],
                "History": {
                    "HistoryLength": 215,
                    "TransactionHash": "9bkUGcN6p8e2qrTV3o14TkaD3CZ9p5S37n9CKYXCyWYM"
                },
                "Name": "\u6350\u8d60\u8bb0\u5f55",
                "RecordCount": 214
            },
            {
                "Headers": [
                    "Id",
                    "\u76ee\u6807\u91d1\u989d",
                    "\u9879\u76ee\u540d\u79f0",
                    "\u9879\u76ee\u63cf\u8ff0",
                    "\u6240\u5728\u5730",
                    "\u65f6\u95f4"
                ],
                "History": {
                    "HistoryLength": 15,
                    "TransactionHash": "BHhZzoXqDB2siwxFcSv5yqn7u49A24WfnetwSW8FsEq3"
                },
                "Name": "\u9879\u76ee",
                "RecordCount": 14
            }
        ]
    }
}
```

### 备注说明
无

### 修改日志
- V0.1 创建该API

## 查询表数据

对数据库中数据表进行查询操作。

<div class="api-stability api-stability-1">
<a href="?file=03-SDK/01-API说明#稳定指数">稳定指数：1</a> - 试验
</div>

> 引入版本：V0.1

### 请求

请求方法：QueryData 

| 参数名    | 类型    | 必填  | 描述                       |
| ---       | ---     | :---: | ---                        |
| TableName | Text    | 是    | 查询的数据表名称           |
| Start     | Integer | 是    | 查询数据结果中分页起始位置 |
| Count     | Integer | 是    | 单页返回数据量             |

### 示例

请求示例：
```json
{
    "id": 1,
    "jsonrpc": "2.0",
    "method": "QueryData",
    "params": [
        "\u6350\u8d60\u8bb0\u5f55",
        0,
        10
    ]
}
```

返回正确响应示例：

```json
{
    "id": 1,
    "jsonrpc": "2.0",
    "result": {
        "Data": [
            "4649e090-0c0a-4d37-9640-15890764c75a",
            "20.00",
            "c802ccba-04bc-4228-a4bf-5649e3b78bbc",
            "",
            "df173118-b500-4647-ad7d-485f6612b1c1",
            "2017-12-04 17:46:46",
            "8b690e00-0561-442e-9b11-368fd38e61fc",
            "20.00",
            "c802ccba-04bc-4228-a4bf-5649e3b78bbc",
            "",
            "df173118-b500-4647-ad7d-485f6612b1c1",
            "2017-12-04 17:47:54",
            "ea49277f-ff0f-477a-b622-4ab6b5eeefe3",
            "50.00",
            "c802ccba-04bc-4228-a4bf-5649e3b78bbc",
            "",
            "df173118-b500-4647-ad7d-485f6612b1c1",
            "2017-12-04 17:50:18",
            "2454d790-91c5-482f-920f-93e37200158f",
            "20.00",
            "c802ccba-04bc-4228-a4bf-5649e3b78bbc",
            "",
            "df173118-b500-4647-ad7d-485f6612b1c1",
            "2017-12-04 18:18:59",
            "26066009-dc57-434d-b3dd-1ff934a5c90c",
            "20.00",
            "c802ccba-04bc-4228-a4bf-5649e3b78bbc",
            "",
            "df173118-b500-4647-ad7d-485f6612b1c1",
            "2017-12-04 18:21:40",
            "b02b5661-80f5-42e6-9629-3bd63593d9fc",
            "20.00",
            "c802ccba-04bc-4228-a4bf-5649e3b78bbc",
            "",
            "df173118-b500-4647-ad7d-485f6612b1c1",
            "2017-12-04 18:22:36",
            "6d912fd3-5493-4aea-8364-295576107ea7",
            "20.00",
            "c802ccba-04bc-4228-a4bf-5649e3b78bbc",
            "",
            "df173118-b500-4647-ad7d-485f6612b1c1",
            "2017-12-04 18:28:45",
            "a3d3b53c-e451-49e0-a406-d493e82ddc10",
            "20.00",
            "c802ccba-04bc-4228-a4bf-5649e3b78bbc",
            "",
            "df173118-b500-4647-ad7d-485f6612b1c1",
            "2017-12-04 18:50:33",
            "662af17b-3296-466c-861a-da1acf90b800",
            "20.00",
            "c802ccba-04bc-4228-a4bf-5649e3b78bbc",
            "",
            "df173118-b500-4647-ad7d-485f6612b1c1",
            "2017-12-04 18:52:08",
            "e27a10fe-6d1a-4791-b55b-9c7df5ef277b",
            "20.00",
            "c84b5deb-289d-4d46-a4f8-da24b8c50e33",
            "",
            "2cd7b183-1fad-4335-b428-94d4ddb875b1",
            "2017-12-10 16:29:40"
        ],
        "DataHistories": [
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            }
        ],
        "HeaderHistories": [
            {
                "HistoryLength": 1,
                "TransactionHash": "5pGp7tENQXJ1fDzcSFXec4WnTvGRv14eiJhy7AD1FoVa"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "5pGp7tENQXJ1fDzcSFXec4WnTvGRv14eiJhy7AD1FoVa"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "5pGp7tENQXJ1fDzcSFXec4WnTvGRv14eiJhy7AD1FoVa"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "5pGp7tENQXJ1fDzcSFXec4WnTvGRv14eiJhy7AD1FoVa"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "5pGp7tENQXJ1fDzcSFXec4WnTvGRv14eiJhy7AD1FoVa"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "5pGp7tENQXJ1fDzcSFXec4WnTvGRv14eiJhy7AD1FoVa"
            }
        ],
        "Headers": [
            "Id",
            "\u6350\u8d60\u91d1\u989d",
            "\u6350\u8d60\u8005Id",
            "\u9644\u8a00",
            "\u9879\u76eeId",
            "\u65f6\u95f4"
        ],
        "PrimaryKeyName": "Id"
    }
}
```

### 备注说明
无

### 修改日志
- V0.1 创建该API

## 查询链数据

对区块链上的信息进行查询操作。

<div class="api-stability api-stability-1">
<a href="?file=03-SDK/01-API说明#稳定指数">稳定指数：1</a> - 试验
</div>

> 引入版本：V0.1

### 请求

请求方法：QueryChain

| 参数名 | 类型    | 必填  | 描述                             |
| ---    | ---     | :---: | ---                              |
| Hash   | Text    | 否    | 查询该Hash值对应的区块或事务信息 |
| Height | Integer | 否    | 查询该高度对应的区块信息         |

<div class="warning">

> Hash字段和Height字段不可同时为空
</div>

### 示例

请求示例：
```json
{
    "id": 1,
    "jsonrpc": "2.0",
    "method": "QueryChain",
    "params": [
        "3"
    ]
}
```

返回正确响应示例：

```json
{
    "id": 1,
    "jsonrpc": "2.0",
    "result": {
        "Block": {
            "BookKeeper": "3fxFWBe8WsLF9LQ69k432y6FKWrX",
            "Hash": "JCDasMZGZNo4CfCLVs2mfL8A6Hh4Axt9Jj6pRWmQw6iy",
            "Height": 3,
            "PreviousBlockHash": "5bDQUYSa1TYvStgwf1Nn5dE2WdtVtF1dpmMgvwzXdsjP",
            "Signature": "rW41F61SpWyTgp1qs6ynFKN7mEsqZMmeN3kb16Vq1y8V5KYnKjXMMtWPx4RoFvNTs7HfxeL36kmxdPNL2QTfsDX",
            "Time": 1521531901362,
            "Transactions": [
                {
                    "Block": "JCDasMZGZNo4CfCLVs2mfL8A6Hh4Axt9Jj6pRWmQw6iy",
                    "Hash": "5XBXDpSWbrbuSk7WgTeoamLrrjrygAGL2PMKroq5ChVm",
                    "Initiator": "8YBYJdDx5hfXni2RCHefwX6Boty",
                    "LockScripts": [
                        {
                            "Object": "n4RCfjWfSCmQ22QMUEoTPxiH6yf6j5qqSckcobrkN1Ar",
                            "OpCode": "Object"
                        },
                        {
                            "Object": "sWaUUV2536jfaZ4ybo5rP5ZdACu3Q9BoKsVu8SXishtr",
                            "OpCode": "Object"
                        },
                        {
                            "Object": "2",
                            "OpCode": "Object"
                        },
                        {
                            "Object": null,
                            "OpCode": "CheckOneOfMultiSignature"
                        }
                    ],
                    "LockTargets": [
                        {
                            "ColumnName": null,
                            "PrimaryKey": null,
                            "PublicPermission": [
                                "ReadOnly"
                            ],
                            "TableName": "\u6350\u8d60\u8bb0\u5f55",
                            "TargetType": "TableSchema"
                        },
                        {
                            "ColumnName": null,
                            "PrimaryKey": null,
                            "PublicPermission": [
                                "ReadOnly"
                            ],
                            "TableName": "\u9879\u76ee",
                            "TargetType": "TableSchema"
                        }
                    ],
                    "Signature": "3FqCrMQrsoAP3m2khjXBEACJoHrg4KvGBehDzX4KdtJ1uYMa17vUTmNzgsKgssNrDwz4sTFtZ1Gz5LsBwSxemP5D",
                    "Type": "LockTransaction",
                    "UnlockScripts": null,
                    "WitnessBlock": "5bDQUYSa1TYvStgwf1Nn5dE2WdtVtF1dpmMgvwzXdsjP"
                }
            ],
            "Version": 1
        },
        "Transaction": null
    }
}
```

### 备注说明
无

### 修改日志
- V0.1 创建该API

## 查询表单元数据

对数据库中数据表中的数据单元进行查询操作。

<div class="api-stability api-stability-1">
<a href="?file=03-SDK/01-API说明#稳定指数">稳定指数：1</a> - 试验
</div>

> 引入版本：V0.1

### 请求

请求方法：QueryCell 

| 参数名          | 类型   | 必填  | 描述                                                   |
| ---             | ---    | :---: | ---                                                    |
| TableName       | Text   | 是    | 进行查询的对象表名称                                   |
| PrimaryKeyValue | Text   | 是    | 进行增删改的对象行的主键值                             |
| ColumnName      | Text   | 是    | 进行增删改的对象列的名称                               |
| Columns         | Text[] | 否    | 返回信息时，只返回指定列的信息，忽略该字段将返回所有列 |

### 示例

请求示例：
```json
{
    "id": 1,
    "jsonrpc": "2.0",
    "method": "QueryCell",
    "params": [
        "\u6350\u8d60\u8bb0\u5f55",
        "2454d790-91c5-482f-920f-93e37200158f",
        "\u6350\u8d60\u91d1\u989d"
    ]
}
```

返回正确响应示例：

```json
{
    "id": 1,
    "jsonrpc": "2.0",
    "result": {
        "Headers": [
            "Id",
            "\u6350\u8d60\u91d1\u989d",
            "\u6350\u8d60\u8005Id",
            "\u9644\u8a00",
            "\u9879\u76eeId",
            "\u65f6\u95f4"
        ],
        "PrimaryKeyName": "Id",
        "Row": [
            "2454d790-91c5-482f-920f-93e37200158f",
            "20.00",
            "c802ccba-04bc-4228-a4bf-5649e3b78bbc",
            "",
            "df173118-b500-4647-ad7d-485f6612b1c1",
            "2017-12-04 18:18:59"
        ],
        "RowHistories": [
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            },
            {
                "HistoryLength": 1,
                "TransactionHash": "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
            }
        ],
        "Transactions": [
            "77B1169BigajErf4fBYvDuK4hZrusKeJ197oxmguWL3p"
        ]
    }
}
```

### 备注说明
无

### 修改日志
- V0.1 创建该API

# nuget程序包

## 协议基础库

[
![NuGet](https://img.shields.io/nuget/v/UChainDB.ChainContracts.svg)
![NuGet](https://img.shields.io/nuget/dt/UChainDB.ChainContracts.svg)
](https://www.nuget.org/packages/UChainDB.ChainContracts)

程序集名称：UChainDB.ChainContracts


## 加密算法库

[
![NuGet](https://img.shields.io/nuget/v/UChainDB.ChainEngine.Cryptography.svg)
![NuGet](https://img.shields.io/nuget/dt/UChainDB.ChainEngine.Cryptography.svg)
](https://www.nuget.org/packages/UChainDB.ChainEngine.Cryptography)

程序集名称：UChainDB.ChainEngine.Cryptography

## JsonRpc库

[
![NuGet](https://img.shields.io/nuget/v/UChainDB.JsonRpc.svg)
![NuGet](https://img.shields.io/nuget/dt/UChainDB.JsonRpc.svg)
](https://www.nuget.org/packages/UChainDB.JsonRpc)

程序集名称：UChainDB.JsonRpc


## WebClient客户端

[
![NuGet](https://img.shields.io/nuget/v/UChainDB.Network.WebClient.svg)
![NuGet](https://img.shields.io/nuget/dt/UChainDB.Network.WebClient.svg)
](https://www.nuget.org/packages/UChainDB.Network.WebClient)

程序集名称：UChainDB.Network.WebClient



# npm程序包

开发中，尚未发布。
