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
```

示例响应：

```json
```

