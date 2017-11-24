# Nginx

[![nginx](../../svg/Nginx-1.9.15-brightgreen.svg)]()


## Install

- tarball
- [package](http://nginx.org/en/linux_packages.html#stable)

## Conf

- [nginx-ex.conf](conf/nginx-ex.conf)
- [nginx-web.conf](conf/nginx-web.conf)
- [ssl](conf/ssl.conf)

全站https在http的server里增加
```yaml
rewrite ^(.*) https://$host$1 permanent;
```

- [nginx_init](conf/nginx_init.sh)
- [gzip](conf/gzip.txt)
- [log_format](conf/log_format.conf)


## module

- ngx_cache_purge
- [fair_balancer](https://www.nginx.com/resources/wiki/modules/fair_balancer/)

## Testing

### easyABC
easyABC是公司内部开发的性能测试工具，采用epool模型实现，简单易上手，可以模拟GET/POST请求，极限情况下可以提供上万的压力，在公司内部得到了广泛的使用。由于被测试对象为反向代理服务器，因此需要在其后端搭建桩服务器，这里用nginx作为桩webserver，提供最基本的静态文件服务。

### polygraph
polygraph是一款免费的性能测试工具，以对缓存服务、代理、交换机等方面的测试见长。它有规范的配置语言PGL（Polygraph Language），为软件提供了强大的灵活性。其工作原理如下图所示：

polygraph提供client端和server端，将测试目标nginx放在二者之间，三者之间的网络交互均走http协议，只需配置ip+port即可。client端可以配置虚拟robot的个数以及每个robot发请求的速率，并向代理服务器发起随机的静态文件请求，server端将按照请求的url生成随机大小的静态文件做响应。这也是选用这个测试软件的一个主要原因：可以产生随机的url作为nginx各种hash策略的key。
另外，polygraph还提供了日志分析工具，功能比较丰富，感兴趣的同学可以参考附录中的相关材料。



## Reference

- [nginx.org](http://nginx.org/)
- [nginx-wiki](https://www.nginx.com/resources/wiki/)

### tools

- [drupal-with-nginx](https://github.com/perusio/drupal-with-nginx)
- [nana](https://github.com/aqingsao/nana)

### ngx_cache_purge

- [FRiCKLE/ngx_cache_purge](https://github.com/FRiCKLE/ngx_cache_purge)
- [ngx_cache_purge模块](https://www.aliyun.com/zixun/content/3_12_518236.html)

### Share

- [Nginx + Keepalived 实现站点高可用](https://mp.weixin.qq.com/s/ygECvoz0qi-wj9vtCjkJPw)