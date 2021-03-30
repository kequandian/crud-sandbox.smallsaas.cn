> 自动化生成代码开发指引
- [get_started](get_started/README.md)

### 下载代码 
```
git clone https://github.com/kequandian/crud-sandbox.smallsaas.cn.git
```

### 配置本地镜像仓库
> 办公室本地局域网服务器IP为 `192.168.3.239`

```
# cat /c/Windows/System32/drivers/etc/hosts for windows
$ cat /etc/hosts  
192.168.3.239 registry.docker.internal
```

### 启动容器编排
```shell
docker-compose up
```

> `web` 容器启动较慢，会导致`nginx`启动失败

> 打开新窗口查看`web`容器是否启动成功,确认成功后，重启`nginx`容器

> 然后再次确认容器`nginx`是否启动成功

```shell
docker-compose logs web
docker-compose restart nginx
docker-compose logs nginx
```


### 网络环境解决方案
> 在本地获取 docker image 代替从 `https://hub.docker.com` 拉取
```
docker pull registry.docker.internal:5000/zeroelement:cache
docker tag registry.docker.internal:5000/zeroelement:cache zelejs/zeroelement:cache
```
