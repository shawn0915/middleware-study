# Apache ZooKeeper

Apache ZooKeeper is an effort to develop and maintain an open-source server which enables highly reliable distributed coordination.

Zookeeper 作为一个分布式的服务框架，主要用来解决分布式集群中应用系统的一致性问题，它能提供基于类似于文件系统的目录节点树方式的数据存储，但是 Zookeeper 并不是用来专门存储数据的，它的作用主要是用来维护和监控你存储的数据的状态变化。通过监控这些数据状态的变化，从而可以达到基于数据的集群管理。

## ZK数据结构

Zookeeper 这种数据结构有如下这些特点：
每个子目录项如 NameService 都被称作为 znode，这个 znode 是被它所在的路径唯一标识，如 Server1 这个 znode 的标识为 /NameService/Server1
znode 可以有子节点目录，并且每个 znode 可以存储数据，注意 EPHEMERAL 类型的目录节点不能有子节点目录
znode 是有版本的，每个 znode 中存储的数据可以有多个版本，也就是一个访问路径中可以存储多份数据
znode 可以是临时节点，一旦创建这个 znode 的客户端与服务器失去联系，这个 znode 也将自动删除，Zookeeper 的客户端和服务器通信采用长连接方式，每个客户端和服务器通过心跳来保持连接，这个连接状态称为 session，如果 znode 是临时节点，这个 session 失效，znode 也就删除了
znode 的目录名可以自动编号，如 App1 已经存在，再创建的话，将会自动命名为 App2
znode 可以被监控，包括这个目录节点中存储的数据的修改，子节点目录的变化等，一旦变化可以通知设置监控的客户端，这个是 Zookeeper 的核心特性，Zookeeper 的很多功能都是基于这个特性实现的，后面在典型的应用场景中会有实例介绍。


- [Install](Install-zk.md)


## REF

### apache

- [zookeeper.apache.org](http://zookeeper.apache.org/)
- [doc-ZooKeeper-3.4.6](http://zookeeper.apache.org/doc/r3.4.6/)
- [download](http://www.apache.org/dist/zookeeper/)
- [wiki](https://cwiki.apache.org/confluence/display/ZOOKEEPER/Index)
- [zookeeperOver](http://zookeeper.apache.org/doc/trunk/zookeeperOver.html)

### other

- [ibm-opensource-zk](https://www.ibm.com/developerworks/cn/opensource/os-cn-zookeeper/)
- [ZooKeeper搭建](http://blog.csdn.net/shatelang/article/details/7596007)