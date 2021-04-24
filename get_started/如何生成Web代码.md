### 如何生成前端代码
在根目录下提供`schema.sql`数据库设计文件，进入`web`目录，配置`docker-compose.yml`
```yaml
services:
  web:
    build:
      context: .
      dockerfile: ./Dockerfile
      args:
        SCHEMA_SQL: ./cg-mysql-schema.sql  #本地(根目录)数据库schema文件
        TABLE_NAME: cg_master_resource     #指定在数据库文件中要生成代码的表名
    volumes: 
      - ./out:/usr/src/web/src/pages  #配置输出目录./out
    ## 取消以下注释，可直接启动
    # ports:
    #   - 8000:8000
    # command: 
    #   - npm 
    #   - start      
```

> 先构建镜像 (注意日志输出是否构建成功)
```shell
docker-compose build --no-cache
```
>
> 启动镜像即可在本地目录中获取生成的前端代码 `./out/web/src/pages`
```shell
docker-compose up
```
