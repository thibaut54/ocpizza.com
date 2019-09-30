#!/bin/bash

DB="db_wtc"
DATE=`date +%Y%m%d`
CONT_PATH="/opt/db_backup/${DB}_${DATE}.sql"
CONT_NAME="cont-db-wtc"
DESTINATION="/opt/wtc/${DB}_${DATE}.sql"
# -E UTF-8
docker cp ${CONT_NAME}:${CONT_PATH} ${DESTINATION}