#!/bin/bash

# usage
# ./restartContainers.sh [DB root password] [DB user password]
# use same passwords as when initially calling rebuildContainers.sh

# EG:
# ./restartContainers.sh 123 1234

clear; printf "\033[3J"
docker-compose stop
MYSQL_ROOT_PASSWORD=$1 MYSQL_PASSWORD=$2 docker-compose up --detach mysql
MYSQL_PASSWORD=$2 docker-compose up --detach lucee
