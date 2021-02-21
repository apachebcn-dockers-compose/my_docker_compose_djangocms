#!/bin/bash

MANAGE_DIR="/srv/project"
MANAGE_FILE="$MANAGE_DIR/manage.py"

#####
# Postgres: wait until container is created
#####
until python3 /srv/config/database-check-psql.py; do
    sleep 5; echo "*** Waiting for postgres container ..."
done

# Django: migrate
#
# Django will see that the tables for the initial migrations already exist
# and mark them as applied without running them. (Django won’t check that the
# table schema match your models, just that the right table names exist).
echo "==> Django setup, executing: migrate"
python3 $MANAGE_FILE migrate --fake-initial
