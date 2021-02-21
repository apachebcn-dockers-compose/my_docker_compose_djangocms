#!/usr/bin/env bash
cd ..
MY_VAR=$(grep CONTAINER_NAME= .env | xargs)
MY_VAR=${MY_VAR#*=}_djangocms
echo "Bash to $MY_VAR"
docker exec -u root -ti $MY_VAR bash
