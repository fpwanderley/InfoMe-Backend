#!/bin/bash

# Script for Running Images.
# Usage: source run_images.sh -i (dev | review)

PROJECT_NAME='infome';
DOCKERFILE='Dockerfile';
DEV='dev';
ENVS='envs';

TYPE='type=bind';
PATH_NAME='InfoMe';
SOURCE='source=/home/felipe/Projetos/infome/InfoMe-Backend';
TARGET='target=/$PATH_NAME';

function run_image
{
    echo "Running $PROJECT_NAME-$image:$version docker image";
    eval "docker run -it -p 8000:8000 --mount $TYPE,$SOURCE,$TARGET $PROJECT_NAME-$image:$version";
}

# Getting the command arguments.
while [ "$1" != "" ]; do
    case $1 in
        -i | --image_name )     shift
                                image="$1"
                                ;;
        -v | --version )        shift
                                version="$1"
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
