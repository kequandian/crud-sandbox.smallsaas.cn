> 自动化生成代码开发指引
- [get_started](get_started/README.md)

## 一步启动容器编排进行前后端测试
> 需要在 windows 10 安装好 docker desktop

#### 下载代码 
```
git clone https://github.com/kequandian/crud-sandbox.smallsaas.cn.git
```

#### 构建所有依赖镜像
```shell
sh build.sh --no-cache
## or
COMPOSE_DOCKER_CLI_BUILD=1 docker-compose -f docker-compose.build.yml build --no-cache
```
>
> 如果`schema.sql`数据库文件有变更，仅需构建`api`以及`web`镜像
>
```shell
sh rebuild.sh --no-cache
## or
COMPOSE_DOCKER_CLI_BUILD=1 docker-compose build --no-cache
```


#### 启动容器编排
> 可以单独启动`web`用于测试
```shell
docker-compose run --service-ports web
## or
sh start.sh web
```
>
> 一步启动
```
docker-comopse up
```
> `web` 容器启动较慢，会导致`nginx`启动失败
>
> 打开新窗口查看`web`容器是否启动成功,确认成功后，重启`nginx`容器
>
> 然后再次确认容器`nginx`是否启动成功

```shell
docker-compose logs web
docker-compose restart nginx
docker-compose logs nginx
```

#### 在浏览器中访问 
`http://localhost:8080`
> 
同时也可以访问API说明文档
>
`http://localhost:8080/swagger-ui.html`


#### 容器启动后获取源代码
> 可以在容器中获取生成的源代码
> 
```shell
docker cp crud_sandbox_api_1:/usr/src/pom.xml .
docker cp -r crud_sandbox_api_1:/usr/src/src .
# build the package base on the srce
mvn -DskipStandalone=false package
```

## 遇到的问题
`compose web 出现crud_sandbox_web_1 | /usr/local/bin/entrypoint.sh: line 13: syntax error: unexpected end of file (expecting "then")错误`

#### CRLF 换行编码问题
以下文件格式在`vscode`编辑器中由`CLRF`改为`LF`
- `web/entrypoint.sh` 
- `tags/crudlesscli/entrypoint.sh` 
>
或全局设置`git`的提交配置
```
git config --global core.autocrlf false
```


> 通新构建并通过以下方式重新检查是否正确
```shell
sh build.sh --no-cache web
winpty docker run --rm -it --entrypoint sh crud_sandbox_web_1
```

#### 设置网络服务端
web/config/global

```
if (process.env.NODE_ENV === 'development') {
  setEndpoint('http://localhost:8080');
}
```


#### 配置本地镜像仓库
> 办公室本地局域网服务器IP为 `192.168.3.239`

```
# cat /c/Windows/System32/drivers/etc/hosts for windows
$ cat /etc/hosts  
192.168.3.239 registry.docker.internal
```

#### 获取本地镜像
> 在本地获取 docker image 代替从 `https://hub.docker.com` 拉取
```
docker pull registry.docker.internal:5000/zeroelement:cache
docker tag registry.docker.internal:5000/zeroelement:cache zelejs/zeroelement:cache
```

