#!/usr/bin/env bash

# Script for Setting the Database up.

# Default Postgres password used for authentication.
export PGPASSWORD=root
dropdb infome -h db_container -p 5432 -U postgres
createdb infome -h db_container -p 5432 -U postgres

# Deleting all migrations
ls -d1 /infome/infome/migrations/* | grep -v '__' | xargs -d "\n" rm

python3.6 /infome/manage.py makemigrations
python3.6 /infome/manage.py migrate
python3.6 /infome/manage.py shell < /infome/test_db.py

python3.6 /infome/manage.py createsuperuser

