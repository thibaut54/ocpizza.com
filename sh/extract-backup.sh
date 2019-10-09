#!/bin/bash

DB="db_wtc"
DATE=`date +%Y%m%d`
CONT_PATH="/opt/db_backup/${DB}_${DATE}.tar"
CONT_NAME="cont-db-wtc"
DESTINATION="/opt/wtc/${DB}_${DATE}.tar"
# -E UTF-8
docker cp ${CONT_NAME}:${CONT_PATH} ${DESTINATION}