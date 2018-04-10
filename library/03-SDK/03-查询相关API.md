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
```

返回正确响应示例：

```json
```

返回错误响应示例：

```json
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
```

返回正确响应示例：

```json
```

返回错误响应示例：

```json
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
```

返回正确响应示例：

```json
```

返回错误响应示例：

```json
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
```

返回正确响应示例：

```json
```

返回错误响应示例：

```json
```

### 备注说明
无

### 修改日志
- V0.1 创建该API

