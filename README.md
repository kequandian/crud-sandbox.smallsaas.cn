### 下载代码 
```
git -c --http.sslVerify=false clone https://github.com/kequandian/crud-sandbox.smallsaas.cn.git
```

### 创建外部网络 `mysqlserver_network`
> 非必要，为了保持一致性，也可以在`docker-compose.yml `中注释掉`mysqlserver_network`的依赖

```
docker network create mysqlserver_network
```

### 配置本地镜像仓库
> 办公室本地局域网服务器IP为 `192.168.3.239`

```
# cat /c/Windows/System32/drivers/etc/hosts for windows
$ cat /etc/hosts  
192.168.3.239 registry.docker.internal
```

### 启动容器编排
```
docker-compose up
```

### 网络环境解决方案
> 在本地获取 docker image 代替从 `https://hub.docker.com` 拉取
```
docker pull registry.docker.internal:5000/zeroelement:cache
docker tag registry.docker.internal:5000/zeroelement:cache zelejs/zeroelement:cache
```
