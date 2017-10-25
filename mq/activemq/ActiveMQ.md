# Apache ActiveMQ
v5.13.3


## Install

- [Install](install/activemq_install.md)
- [conf-leveldb](install/activemq-leveldb-replicating.xml)

## Master-Slave

### 基于共享文件系统的Master-Slave架构

[Shared File System Master Slave](http://activemq.apache.org/shared-file-system-master-slave.html)

### 基于共享数据库的Master-Slave架构

[JDBC Master Slave](http://activemq.apache.org/jdbc-master-slave.html)

### 基于zookeeper的Master-Slave架构

[Replicated LevelDB Store](http://activemq.apache.org/replicated-leveldb-store.html)

```yaml
        <persistenceAdapter>
            <replicatedLevelDB
                    directory="${activemq.data}"
                    replicas="3"
                    bind="tcp://0.0.0.0:61619"
                    zkAddress="zk-1.shawnyan.com:2181,zk-2.shawnyan.com:2181,zk-3.shawnyan.com:2181"
                    zkPassword=" "
                    zkPath="/activemq/leveldb-stores"
                    />
        </persistenceAdapter>

客户端连接使用failover方案： 

failover:(tcp://broker1:61616,tcp://broker2:61616,tcp://broker3:61616)

```

## REF

- [activemq.apache.org](http://activemq.apache.org/)
- [download](http://activemq.apache.org/download.html)
- [Install](http://activemq.apache.org/version-5-getting-started.html#Version5GettingStarted-Pre-InstallationRequirements)
- [masterslave](http://activemq.apache.org/masterslave.html)
- [unix-shell-script](http://activemq.apache.org/unix-shell-script.html)

