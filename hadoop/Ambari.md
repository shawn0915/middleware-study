# Apahce Ambari


## Hortonworks Ambari 2.4.1.0

### Env

- RHEL 7.2
- Memory
- `ulimit -n 10000`
- JDK 8
- scp, curl, unzip, tar, and wget
- OpenSSL (v1.01, build 16 or later)
- Python 2.7.*

### Install

```bash
yum install ambari-server
ambari-server setup
y
y
root
3
/opt/jdk1.8.0_91
```


## REF

- [ambari.apache.org](http://ambari.apache.org/)
- [hortonworks-Ambari-2.4.1.0](https://docs.hortonworks.com/HDPDocuments/Ambari/Ambari-2.4.1.0/index.html)