#HTTPS配置

***

##单项认证

    <Connector port="443" protocol="org.apache.coyote.http11.Http11Protocol" SSLEnabled="true"
               maxThreads="150" scheme="https" secure="true"
               clientAuth="false" sslProtocol="TLS"
               keystoreFile="/data/ssl_certs/.keystore"
               keystorePass="password"
               keystoreType="pkcs12"
	/>
 

**Protocol**


HTTP/1.1

org.apache.coyote.http11.Http11NioProtocol

org.apache.coyote.http11.Http11Protocol

##双向认证

    <Connector port="443" protocol="HTTP/1.1" SSLEnabled="true"
               maxThreads="150" scheme="https" secure="true"
               clientAuth="true" sslProtocol="TLS"
               keystoreFile="/data/ssl_certs/.keystore"
               keystorePass="password"
               keystoreType="pkcs12"
               truststoreFile="/data/ssl_certs/ca-trust.keystore"
               truststorePass="password"
               truststoreType="jks"
	/>

浏览器需要导入keystore文件。


ciphers="password"