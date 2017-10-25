
$ tar zxvf apache-activemq-5.13.3-bin.tar.gz -C /home/admin/
$ export $JAVA_HOME=/home/admin/jdk1.8.0_91/
$ cd /home/admin/apache-activemq-5.13.3/bin
$ ./activemq start
http://ip:8161/admin/

http://192.168.15.151:8161/admin/


***** 单机 *****

2.2	ActiveMQ安装

2.2.1	解压二进制包

$ sudo tar zxvf apache-activemq-5.13.3-bin.tar.gz -C /usr/local/

2.2.2	配置变更

1、修改host地址
$ cd /usr/local/apache-activemq-5.13.3/conf
$ vi jetty.xml
// line:114
<property name="host" value="activemq.shawnyan.com"/>

2.2.3	启动ActiveMQ
#$ export $JAVA_HOME=/home/admin/cgbmall_install/pkg/jdk1.8.0_91/
$ cd /usr/local/apache-activemq-5.13.3/bin
$ sudo ./activemq start

2.2.4	校验安装

$ netstat -an|grep 61616

2.3	ActiveMQ监控

ActiveMQ监控台
http://activemq.shawnyan.com:8161/admin/
