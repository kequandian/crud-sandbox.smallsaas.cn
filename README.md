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

#### 容器启动后获取源代码
> 新开窗口并进入下载目标代码目录获取容器内代码
> 
```shell
docker cp crud_sandbox_api_1:/usr/src/pom.xml .
docker cp -r crud_sandbox_api_1:/usr/src/src .
mvn -DskipStandalone=false package
```

### 如何生成前端代码
提供`schema.sql`数据库设计文件，进入`web`目录，配置`docker-compose.yml`
```yaml
services:
  web:
    build:
      context: .
      dockerfile: ./Dockerfile
      args:
        SCHEMA_SQL: ./cg-mysql-schema.sql  #本地数据库schema文件
        TABLE_NAME: cg_master_resource     #指定在数据库文件中要生成代码的表名
    volumes: 
      - ./out:/usr/src/web/src/pages  #配置输出目录./out
```
> 运行即在输出目录中生成代码, 并把生成的代码拷贝至前端主程序的`./src/pages`目录中
```shell
docker-compose up
```


## 网络环境解决方案
`compose web 出现crud_sandbox_web_1 | /usr/local/bin/entrypoint.sh: line 13: syntax error: unexpected end of file (expecting "then")错误`
把 `web/entrypoint.sh`文件格式在`vscode`编辑器中由`CLRF`改为`LF`

> 通新构建并通过以下方式重新检查是否正确
```shell
sh build.sh --no-cache web
winpty docker run --rm -it --entrypoint sh crud_sandbox_web_1
```

### 设置网络服务端
web/config/global

```
if (process.env.NODE_ENV === 'development') {
  setEndpoint('http://localhost:8080');
}
```


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
