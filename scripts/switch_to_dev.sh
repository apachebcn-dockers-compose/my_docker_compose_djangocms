#!/usr/bin/env bash

cd ..
rm -r ./docker-compose.yml
cp docker-compose-dev.yml docker-compose.yml

rm -f ./bin/scripts/start.sh
cp  ./bin/scripts/start-dev.sh ./bin/scripts/start.sh

rm -f ./MODE-PROD
touch ./MODE-DEV

docker-compose up --build -d
