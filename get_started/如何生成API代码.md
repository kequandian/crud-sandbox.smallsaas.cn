## 如何生成API后台代码
> 复制以下配置文件内容保存为 `docker-compose.yml`
```
docker-compose up
# or docker-compose -f ./docker-compose.yml up
```

### 生成单表代码
在本地提供`schema.sql`数据库设计文件, 并指定输出代码的路径 (e.g. `./out`)

- 参数说明
> cg  -- 代码模块名称

> schema.sql -- 数据库设计文件

> cg_master_resource   -- 数据库文件内`schema.sql`的表名


```yml
version: '3.4'
# docker-compose run --rm zelejs/zerocodegenerator cg /cg-mysql-schema.sql cg_master_resource /var/out
services:
  zerocodegenerator:
    image: zelejs/zerocodegenerator:latest
    volumes:
      - ./cg-mysql-schema.sql:/schema.sql #input
      - ./one.crud.json:/crud.json
      - ./out:/var/out  #output
    entrypoint:
      - bash
      - /usr/local/bin/cli.sh
    command:
      - cg
      - /schema.sql
      - /crud.json
      - /var/out
```

### 生成多表关联代码
- 参数说明
> 参考上文
>
> [多表关联代码生成指引](https://github.com/zelejs/cg-api-cli/blob/master/crud.json-guide.md)
> 
```yml
version: '3.4'
# docker-compose run --rm zelejs/zerocodegenerator cg /cg-mysql-schema.sql cg_master_resource /var/out
services:
  zerocodegenerator:
    image: zelejs/zerocodegenerator:latest
    volumes:
      - ./cg-mysql-schema.sql:/schema.sql #input
      - ./onemany.crud.json:/crud.json
      - ./out:/var/out  #output
    entrypoint:
      - bash
      - /usr/local/bin/cli.sh
    command:
      - cg
      - /schema.sql
      - /crud.json
      - /var/out
```


### 基于生成的代码直接运行测试
> 进入生成的代码目录, 目录结构如下
```
+ docker
+ src
- pom.xml
```

> 进入`docker`目录，进行镜像构建
> 
> 构建成功后，可启动，可访问 `http://localhost:8080/swagger-ui.html`进行`API`测试 
```shell
COMPOSE_DOCKER_CLI_BUILD=1 docker-compose build
docker-compose up
```
