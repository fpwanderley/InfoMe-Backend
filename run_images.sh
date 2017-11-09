#!/bin/bash

# Script for Running Images.
# Usage: source run_images.sh -i (dev | review)

# Example: docker run -it -p 8000:8000 --mount --link=postgres type=bind,source=/home/felipe/Projetos/infome/InfoMe-Backend,target=/InfoMe infome-envs:$version /bin/bash

# https://hub.docker.com/_/postgres/
# How to connect to db_container through Application Container:
#   psql -h db_container -U postgres
# The Postgres Docker Image exposes the port 5432.

# Remove all non-executing containers:
#   docker rm $(docker ps -a -q)

# Allowing all files permissions to all users in container:
#   chmod -R 777 $TARGET

PROJECT_NAME='infome';
DOCKERFILE='Dockerfile';
DEV='dev';
ENVS='envs';

TYPE='type=bind';
PATH_NAME='infome';
SOURCE='source=/home/felipe/Projetos/infome/InfoMe-Backend';
TARGET='target=/$PATH_NAME';

function remove_database_container
{
    eval "docker kill db_container";
    eval "docker rm db_container";
}

function run_database_container
{
    eval "docker run --name db_container -p 5432:5432 -e POSTGRES_PASSWORD=root -d postgres";
}

function run_image
{
    echo "Running $PROJECT_NAME-$image:$version docker image";
    remove_database_container;
    run_database_container;
    eval "docker run -it --link=db_container -p 8000:8000 --mount $TYPE,$SOURCE,$TARGET $PROJECT_NAME-$image:$version $command";
}

command=""

# Getting the command arguments.
while [ "$1" != "" ]; do
    case $1 in
        -i | --image_name )     shift
                                image="$1"
                                ;;
        -v | --version )        shift
                                version="$1"
                                ;;
        -c | --command )        shift
                                command="$1"
                                ;;
        * )                     usage
                                exit 1
    esac
    shift
done

# Building the Docker Images
case $image in
    $DEV )                      run_image
                                ;;
    $ENVS )                     run_image
                                ;;
    * )                        echo "Docker image not found."
esac
