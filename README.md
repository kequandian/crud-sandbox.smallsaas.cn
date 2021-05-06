> 自动化生成代码开发指引
- [get_started](get_started/README.md)

#### 准备Windows10 或 Windows Server 2016 服务平台
安装Docker Desktop for Windows环境 |
[下载页面](https://hub.docker.com/editions/community/docker-ce-desktop-windows) | 
[下载链接](https://desktop.docker.com/win/stable/amd64/Docker%20Desktop%20Installer.exe)


#### 下载代码 
```
git clone https://github.com/kequandian/crud-sandbox.smallsaas.cn.git
```

#### 预构建依赖镜像
```shell
sh build.sh --no-cache
## or
COMPOSE_DOCKER_CLI_BUILD=1 docker-compose -f docker-compose.build.yml build --no-cache
```

#### 准备自定义 `schema.sql`
放置在根目录,并在`docker-compose.yml`中配置
```yaml
version: '3.8'
services:
  api:
    build:
      context: .
      dockerfile: ./api/Dockerfile
      args:
        SCHEMA_SQL: ./cg-mysql-schema.sql  ## schema.sql文件位置(这里是根目录下)
        SCHEMA_DESC: ./one.crud.json       ## 单表或多表关系描述
        MODULE_NAME: cg                    ## 模块名称
```

#### 启动容器编排
```
COMPOSE_DOCKER_CLI_BUILD=1 docker-compose -f docker-compose.yml up --build --remove-orphans
```
> 或
>
> `powershell`双击执行
>
> 进入目录, 选择`startup.ps1`文件，右键选择`powershell`执行
> 
>
#### 在浏览器中访问 
`http://localhost:8080`
> 
同时也可以访问API说明文档
>
`http://localhost:8080/swagger-ui.html`


#### 如何中止服务
在`powershell`输入终端键盘快捷键 `Ctrl+C` 中止
> 请不要直接关闭窗口终端


## 遇到的问题

#### 单独启动容器
> 可以单独启动`web`用于测试
```shell
docker-compose run --service-ports web
```

#### CRLF 换行编码问题
`compose web 出现crud_sandbox_web_1 | /usr/local/bin/entrypoint.sh: line 13: syntax error: unexpected end of file (expecting "then")错误`
>
以下文件格式在`vscode`编辑器中由`CLRF`改为`LF`
- `web/entrypoint.sh` 
- `tags/crudlesscli/entrypoint.sh` 
>
或全局设置`git`的提交配置
```
git config --global core.autocrlf false
```
>
> 通新构建并通过以下方式重新检查是否正确
```shell
sh build.sh --no-cache web
winpty docker run --rm -it --entrypoint sh crud_sandbox_web_1
```

#### 设置前端服务
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

