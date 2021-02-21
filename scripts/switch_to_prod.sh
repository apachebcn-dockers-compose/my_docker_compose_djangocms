#!/usr/bin/env bash

cd ..
rm ./docker-compose.yml
cp docker-compose-prod.yml docker-compose.yml

rm ./bin/scripts/start.sh
cp  ./bin/scripts/start-prod.sh ./bin/scripts/start.sh

touch ./MODE-PROD

docker-compose up --build -d
