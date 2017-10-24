# Install ZooKeeper

## ENV

- rhel 7.2
- jdk 8
- TimeZone (Asia/Shanghai)
- /etc/hosts


## 单机

- conf/zoo.cfg


## 集群

三台server，一主两从

- data/myid


- conf/zoo.cfg

```yaml
server.1=zk-1.shawnyan.com:2888:3888
server.2=zk-2.shawnyan.com:2889:3889
server.3=zk-3.shawnyan.com:2890:3890
```

引用方式
```yaml
zookeeper://zk-1.shawnyan.com:2181?backup= zk-2.shawnyan.com:2181, zk-3.shawnyan.com:2181
```
