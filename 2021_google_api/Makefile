include set_env.mk

GIT_MASTER_HEAD_SHA:=$(shell git rev-parse --short=12 --verify HEAD)

## build-image                                 : Build the docker image for notebooks
build-image: Dockerfile
	docker build -t agbiome/2021_google_api . \
	&& touch $@

## run-notebook                                : Run the notebook server
.PHONY: run-notebook
run-notebook: build-image stop-notebook
	DATA_DIR=$(DATA_DIR) S3_DIR=$(S3_DIR) ./jupyter-lab.sh

## stop-notebook                               : Stop the notebook server
.PHONY: stop-notebook
stop-notebook:
	docker stop 2021_google_api_$(HOSTNAME)_$(UID) || echo "already stopped"
	sleep 1

## get-url                                     : Get the URL of the notebook server
.PHONY: get-url
get-url:
	@docker exec --user jovyan -it 2021_google_api_$(HOSTNAME)_$(UID) jupyter notebook list | sed -E "s/(0.0.0.0|localhost)/$(HOSTNAME)/"
