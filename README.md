> 自动化生成代码开发指引
- [get_started](get_started/README.md)

### 下载代码 
```
git clone https://github.com/kequandian/crud-sandbox.smallsaas.cn.git
```

### 一步启动容器编排进行前后端测试
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


### 通过定义数据库设计文件`schema.sql`直接构建`docker image`并启动
> 启动成功后, 直接访问`http://localhost:8080/swagger-ui.html`进行api测试
> 
```shell
sh scripts/apionly.sh
## or 
# docker-compose -f docker-compose.apionly.yml up
```


## 网络环境解决方案

### 配置本地镜像仓库
> 办公室本地局域网服务器IP为 `192.168.3.239`

```
# cat /c/Windows/System32/drivers/etc/hosts for windows
$ cat /etc/hosts  
192.168.3.239 registry.docker.internal
```

### 获取本地镜像
> 在本地获取 docker image 代替从 `https://hub.docker.com` 拉取
```
docker pull registry.docker.internal:5000/zeroelement:cache
docker tag registry.docker.internal:5000/zeroelement:cache zelejs/zeroelement:cache
```
