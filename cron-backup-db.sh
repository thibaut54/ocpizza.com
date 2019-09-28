#!/bin/bash

HOST="localhost"
DB="db_ocpizza"
USER="admin_ocp"
PGPASSWORD="admin"
DATE=`date +%Y%m%d`
FILENAME="/opt/db_backup/${DB}_${DATE}.sql"
# -E UTF-8
PGPASSWORD=${PGPASSWORD} pg_dump -Fc -U ${USER} -h ${HOST} ${DB} > ${FILENAME}
#gzip ${FILENAME}
