#!/usr/bin/env bash

# Script for Setting the Database up.

# Default Postgres password used for authentication.
export PGPASSWORD=root
dropdb infome -h db_container -p 5432 -U postgres
createdb infome -h db_container -p 5432 -U postgres

# Deleting all migrations
ls -d1 /InfoMe/InfoMe/infome/migrations/* | grep -v '__' | xargs -d "\n" rm

python3.6 /InfoMe/InfoMe/manage.py makemigrations
python3.6 /InfoMe/InfoMe/manage.py migrate
