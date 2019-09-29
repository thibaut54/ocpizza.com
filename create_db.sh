#!/bin/bash

DB="db_ocpizza"
POSTGRES_USER="admin_ocp"
CONTAINER_NAME="cont-ocpizza-db"
HOST_PATH_TO_FILE="/opt/ocpizza/db/"
PATH_TO_FILE="/opt/scripts/"
FILENAME1="create_db_ocpizza.sql"
FILENAME2="create_db_ocpizza_dev.sql"
FILENAME3="create_db_ocpizza_test.sql"

docker cp ${HOST_PATH_TO_FILE}${FILENAME1} ${CONTAINER_NAME}:${PATH_TO_FILE}${FILENAME1}
docker cp ${HOST_PATH_TO_FILE}${FILENAME1} ${CONTAINER_NAME}:${PATH_TO_FILE}${FILENAME2}
docker cp ${HOST_PATH_TO_FILE}${FILENAME1} ${CONTAINER_NAME}:${PATH_TO_FILE}${FILENAME3}

docker exec ${CONTAINER_NAME} psql -U ${POSTGRES_USER} -d ${DB} -f ${PATH_TO_FILE}${FILENAME1}
docker exec ${CONTAINER_NAME} psql -U ${POSTGRES_USER} -d ${DB} -f ${PATH_TO_FILE}${FILENAME2}
docker exec ${CONTAINER_NAME} psql -U ${POSTGRES_USER} -d ${DB} -f ${PATH_TO_FILE}${FILENAME3}
