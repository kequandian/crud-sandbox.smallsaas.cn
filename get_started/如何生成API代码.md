## 如何生成API后台代码

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
      - ./cg-mysql-schema.sql:./schema.sql #input
      - ./out:/var/out  #output
    entrypoint:
      - bash
      - /usr/local/bin/cli.sh
    command:
      - cg
      - ./schema.sql
      - cg_master_resource
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
      - ./cg-mysql-schema.sql:./schema.sql #input
      - ./onemany.crud.json:./crud.json
      - ./out:/var/out  #output
    entrypoint:
      - bash
      - /usr/local/bin/cli.sh
    command:
      - cg
      - ./schema.sql
      - ./crud.json
      - /var/out
```


### 启动代码生成
```shell
docker-compose up
```