#!/usr/bin/env bash

cd ..
rm ./docker-compose.yml
cp docker-compose-dev.yml docker-compose.yml

rm ./bin/scripts/start.sh
cp  ./bin/scripts/start-dev.sh ./bin/scripts/start.sh

touch ./MODE-DEV

docker-compose up --build -d
