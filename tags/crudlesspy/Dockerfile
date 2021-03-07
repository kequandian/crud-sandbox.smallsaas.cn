FROM python:3.9 as crudless

#python dependency
RUN pip --default-timeout=1000 --trusted-host mirrors.aliyun.com install -i http://mirrors.aliyun.com/pypi/simple/ \
    pymysql pyyaml mysql.connector


WORKDIR /usr/local/bin

ADD ./cli ./cli
ADD ./entrypoint.sh ./entrypoint.sh

# gen crudless.yml via entrypoint 
#RUN python /usr/local/bin/cli/cli.py --table cg_master_resource --savepath /var/output/crudless.yml
ENTRYPOINT ["sh", "entrypoint.sh"]
CMD ["/cg-mysql-schema.sql", "cg_master_resource"]
