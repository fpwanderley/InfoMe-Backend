#!/bin/bash

# Script for Building Images.
# Usage: source build_images.sh -i (dev)
#                               -v (1.0, 2.0 ...)

PROJECT_NAME='infome';
DOCKERFILE='Dockerfile';
DEV='dev';
ENVS='envs';
SERVERS_CONFIG='servers_config';


function prune_none_images
{
    echo "Pruning Empty Images.";
    docker rmi -f $(docker images -f "dangling=true" -q);
}

function remove_dockerfile
{
    echo "Pruning Removing Dockerfile.";
    rm --force Dockerfile;
}

function build_image
{
    echo "Building $PROJECT_NAME-$image:$version docker image";

    eval "cp ""$dockerfile_image_prefix""Dockerfile-$image Dockerfile && chmod 666 Dockerfile"
    eval "docker build . -t $PROJECT_NAME-$image:$version"
    remove_dockerfile;
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

# Checking the image name.
dockerfile_image_prefix=""
case $image in
    $DEV )                   dockerfile_image_prefix="$SERVERS_CONFIG/"
                             ;;

    $ENVS )                   dockerfile_image_prefix="$SERVERS_CONFIG/"
                             ;;

    * )                      echo "Docker image not found."
                             exit 1
esac

# Building the image
prune_none_images
build_image
prune_none_images

