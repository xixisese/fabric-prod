#!/bin/bash

debug=false

while getopts ":d" optname
do
    case "$optname" in
      "d")
        debug=true
        ;;
      "?")
        echo "unknown option"
        exit 1
        ;;
      *)
        echo "Unknown error while processing options"
        exit 1
        ;;
    esac
done

normal()
{
    echo "Starting peer group..."
    set -x # trun echo on
    docker-compose -f peer1-orgA.yaml up -d
    docker-compose -f peer1-orgB.yaml up -d
    set +x # trun echo off
    docker ps|grep peer
    echo "Start finished"
    exit 0
}

debug()
{
    echo "Starting peer group..."
    set -x
    docker-compose -f peer1-orgA.yaml.dev up -d
    docker-compose -f peer1-orgB.yaml.dev up -d
    set +x
    docker ps|grep peer
    echo "Start finished"
    exit 0
}

if [[ $debug == true ]]; then
    echo "DEBUG mode"
    debug
else
    echo "Normal mode"
    normal
fi

