#!/bin/bash

set -e

echo "*********************************"
echo "*********************************"
echo "*********************************"
echo "*********************************"
echo "*                               *"
echo "*     start.sh MODE PROD        *"
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

echo "==> Django setup, executing: collectstatic"
python3 /srv/project/manage.py collectstatic --noinput -v 3

/srv/scripts/start_db.sh

echo "==> Starting uWSGI ..."
/usr/local/bin/uwsgi --emperor /etc/uwsgi/django-uwsgi.ini
