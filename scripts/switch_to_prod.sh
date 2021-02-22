#!/usr/bin/env bash

cd ..
rm -f ./docker-compose.yml
cp docker-compose-prod.yml docker-compose.yml

rm -f ./bin/scripts/start.sh
cp  ./bin/scripts/start-prod.sh ./bin/scripts/start.sh

rm -f ./MODE-DEV
touch ./MODE-PROD

docker-compose up --build -d
