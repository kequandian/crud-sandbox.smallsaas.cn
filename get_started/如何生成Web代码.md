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
