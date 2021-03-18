#!/usr/bin/env bash

rm -r ../.env
cp ../.env-dev ../.env

rm -r ../docker-compose.yml
cp ../docker-compose-dev.yml ../docker-compose.yml

rm -f ../bin/scripts/start.sh
cp  ../bin/scripts/start-dev.sh ../bin/scripts/start.sh

rm -f ../IS-IN-MODE-PROD
touch ../IS-IN-MODE-DEV

cd ..
docker-compose build
