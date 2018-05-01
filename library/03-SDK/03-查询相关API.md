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

