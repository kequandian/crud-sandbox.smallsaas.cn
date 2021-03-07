#!/bin/sh

server=crudlessdb
port=3306
database=crudlessdb
table=''
username=root
password=root

usage() {
  echo 'usage: cli [OPTION]'
  echo 'OPTIONS:'
  echo '  -s  server'
  echo '  -P  port'
  echo '  -d  database'
  echo '  -t  table'
  echo '  -u  username'
  echo '  -p  password'
  exit
}

while getopts "s:P:d:t:u:p:" arg; do
    case "${arg}" in
        s)
            server=${OPTARG}
            ;;
        P)
            port=${OPTARG}
            ;;
        d)
            database=${OPTARG}
            ;;
        t)
            table=${OPTARG}
            ;;
        u)
            username=${OPTARG}
            ;;            
        p)
            password=${OPTARG}
            ;;            
        *)
            usage
            ;;
    esac
done


crudless='/var/output/crudless.yml'
if [ ! -d /var/output ];then
  mkdir /var/output
fi
if [ -f $crudless ];then
  rm -f $crudless
fi

# import sql -> no action
#echo python /usr/local/bin/cli/cli.py -h crudlessdb -d crudlessdb  -r $sql
#python /usr/local/bin/cli/cli.py -h crudlessdb -d crudlessdb -r $sql

# convert to crudless.yml
echo python /usr/local/bin/cli/cli.py -s $server -p $port -d $database -t $table -o $crudless
python /usr/local/bin/cli/cli.py -s $server -p $port -d $database -t $table -o $crudless

if [ -f $crudless ];then
  echo cat $crudless
  cat $crudless
fi
