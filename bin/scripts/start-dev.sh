#!/bin/bash

set -e

echo "*********************************"
echo "*********************************"
echo "*********************************"
echo "*********************************"
echo "*                               *"
echo "*     start.sh MODE DEV         *"
echo "*                               *"
echo "*********************************"
echo "*********************************"
echo "*********************************"
echo "*********************************"

MANAGE_DIR="/srv/project"
MANAGE_FILE="$MANAGE_DIR/manage.py"
if [ ! -f $MANAGE_FILE ]; then
    # django-admin startproject project /srv/project
    echo "Installing djangocms"
    cd /srv
    djangocms project
    echo "Installing requirements"
    pip3 install -r /srv/project/requirements.txt
    python3 $MANAGE_FILE cms check
fi
chown -R django:django /srv

/srv/scripts/start_db.sh

echo "==> Starting django server ..."
python3 /srv/project/manage.py runserver 0.0.0.0:8000

