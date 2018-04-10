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
