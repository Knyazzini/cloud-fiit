#!bin/sh

DB_PATH="/ru-central1/b1gq2dh478qo9gbuasre/etnjj25aoskf7uuvjpll"
DB_ENDPOINT="grpcs://ydb.serverless.yandexcloud.net:2135"

python3 main.py -d $DB_PATH -e $DB_ENDPOINT -c key-ydb-fiit.json
