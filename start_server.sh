#!/usr/bin/env bash

# ##############################################################
echo "Updating Python Packages"
python3.6 -m pip install -r /InfoMe/InfoMe/requirements.txt

echo "Updating InfoMe Database"
source /InfoMe/setup_db.sh

echo "Starting Django Development Server"
#python3.6 /InfoMe/InfoMe/manage.py runserver 0.0.0.0:8000
