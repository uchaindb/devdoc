## 常见问题

### 优擎区块链数据库是做什么的？

优擎区块链数据库使用区块链技术使得数据库中的数据历史不可更改。

### 为何需要数据历史不可更改？

底层执行人员擅自修改数据库中数据导致非法事件的产生时有发生，为杜绝此类事件发生，最底层的数据库应具备数据历史不可更改的能力。

### 这与现有数据库的历史及审计功能有何区别？

现有数据库的历史及审计功能在权限足够的情况，仍然可以人为修改其历史及审计数据。应用区块链技术后，从根本上解决了历史数据可被修改的可能性。

### 优擎区块链数据库如何做到数据历史不可更改？

* 复制。将数据复制到多处不同的地方。
* 内部限制。任意节点均会监控内部数据变化确保没有非法变化产生。
* 外部监控。对具备可读权限的外部系统，可以通过持续的监控数据变化，确保数据变化均是合法和记录下来的，作用类似于审核员。
* 密码学签名。使用密码学签名技术对每一项数据修改历史进行签名，避免非法篡改发生的可能性。
* 强安全性。对于高安全性系统，管理员可通过使用强安全性技术避免数据侵害的可能性。
* 节点多样性。节点多样性可确保系统不会因为一处故障（自然灾害或系统故障）导致系统失效。