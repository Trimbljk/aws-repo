#!/usr/bin/env bash

while :
do
        PORT="`shuf -i 8888-9999 -n 1`"
        ss -lpn | grep -q ":$PORT " || break
done

while getopts 'p:' opt
    do
        case $opt in
            p) PORT=$OPTARG;;
        esac
done

docker run \
    -e "NB_UID=$UID" --user root \
    -e "GRANT_SUDO=yes" \
    -e DATA_DIR \
    -e SHEET_ID='1bQhbfuhZRPLpifaoJQWNZR0a11UegSGTyMpxksnO5cE' \
    --name 2021_google_api_$(hostname)_$(id -u) \
    -w $PWD \
    -v $PWD:$PWD \
    -p $PORT:$PORT  -d --rm \
    -v $HOME/.aws:/home/jovyan/.aws \
    agbiome/2021_google_api start.sh jupyter lab --allow-root --port $PORT
