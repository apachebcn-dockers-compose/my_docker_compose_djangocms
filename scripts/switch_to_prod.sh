#!/usr/bin/env bash

rm -r ../.env
cp ../.env-prod ../.env

rm -f ../docker-compose.yml
cp ../docker-compose-prod.yml ../docker-compose.yml

rm -f ../bin/scripts/start.sh
cp  ../bin/scripts/start-prod.sh ../bin/scripts/start.sh

rm -f ../IS-IN-MODE-DEV
touch ../IS-IN-MODE-PROD

cd ..
docker-compose build
