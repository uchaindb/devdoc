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

