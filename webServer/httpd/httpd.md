# Apache HTTP Server

[![httpd](../../svg/httpd-2.4.x-brightgreen.svg)]()


## Release

- Apache httpd 2.4.x
- Apache httpd 2.2.34 Released End-of-Life

## Install

- Source
- Binaries
- yum

Example.
- [Install-httpd_2.2.34-rhel7.2-root](install/Install-httpd_2.2.34-rhel7.2-root.sh)
- [Install-httpd-2.4.28-rhel7.2-root](install/Install-httpd_2.4.28-rhel_7.2-root.md)

## Command

- Start/Stop

```bash
cd apache2/bin
./apachectl start
./apachectl restart
./apachectl stop
```

## LogFormat

关联模块：

- [log_config_module modules/mod_log_config.so](http://httpd.apache.org/docs/2.4/mod/mod_log_config.html#logformat)
- [logio_module modules/mod_logio.so](http://httpd.apache.org/docs/2.4/mod/mod_logio.html)

### common

```httpd.conf
LogFormat "%h %l %u %t \"%r\" %>s %b" common
CustomLog logs/access_log common
```

```access_log
127.0.0.1 - frank [10/Oct/2000:13:55:36 -0700] "GET /apache_pb.gif HTTP/1.0" 200 2326
127.0.0.1 - - [23/Oct/2017:09:25:57 +0800] "GET /server-status?auto= HTTP/1.1" 200 1020
```

### combined

```httpd.conf
LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"" combined
CustomLog log/access_log combined
```

```access_log
127.0.0.1 - frank [10/Oct/2000:13:55:36 -0700] "GET /apache_pb.gif HTTP/1.0" 200 2326 "http://www.example.com/start.html" "Mozilla/4.08 [en] (Win98; I ;Nav)"
192.168.52.101 - - [23/Oct/2017:10:15:27 +0800] "GET /server-status HTTP/1.1" 200 5916 "-" "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36"
```

### combinedio

```httpd.conf
    <IfModule logio_module>
      # You need to enable mod_logio.c to use %I and %O
      LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\" %I %O" combinedio
    </IfModule>
CustomLog "logs/access_log" combinedio
```

```access_log
192.168.52.101 - - [23/Oct/2017:10:50:59 +0800] "GET / HTTP/1.1" 304 - "-" "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36" 481 177
192.168.52.101 - - [23/Oct/2017:10:46:53 +0800] "GET /server-status HTTP/1.1" 200 6133 "-" "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36" 409 6341
```

### Piped Logs(rotatelogs)

```httpd.conf
CustomLog "|bin/rotatelogs /var/log/logfile 86400" common
CustomLog "|bin/rotatelogs -l /var/log/logfile.%Y.%m.%d 86400" common
CustomLog "|bin/rotatelogs /var/log/logfile 5M" common
ErrorLog "|bin/rotatelogs /var/log/errorlog.%Y-%m-%d-%H_%M_%S 5M"
CustomLog "|bin/rotatelogs -t /var/log/logfile 86400" common

#
CustomLog "| /usr/local/apache2/bin/rotatelogs -l /usr/local/apache2/logs/access_%Y-%m-%d_%H-%M-%S.log 86400 50M" combinedio
```

### EX.

```yaml
LoadModule log_config_module modules/mod_log_config.so

<IfModule log_config_module>
    LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"" combined
    LogFormat "%h %l %u %t \"%r\" %>s %b" common
    CustomLog "| /usr/local/apache2/bin/rotatelogs -l /usr/local/apache2/logs/access_%Y-%m-%d_%H-%M-%S.log 86400 50M" combined
</IfModule>

```

## REF

- [httpd.apache.org](http://httpd.apache.org/httpd.md)
- [the HTTP specification](https://www.w3.org/Protocols/rfc2616/rfc2616.txt)
- [logs-2.4](http://httpd.apache.org/docs/2.4/logs.html)
- [rotatelogs](http://httpd.apache.org/docs/2.4/programs/rotatelogs.html)