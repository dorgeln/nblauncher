.ONESHELL:
SHELL := /bin/bash
USER := $(shell whoami)
UID := $(shell id -u)
NOTEBOOK_DIR := $(shell readlink -f notebooks)

devel:
	pip install jupyter-repo2docker

run:
	docker image rm --force repolauncher
	jupyter-repo2docker --debug  --user-name ${USER} --user-id ${UID} -P --volume ${NOTEBOOK_DIR}:./notebooks --volume /home/${USER}/.ssh:.ssh --image-name repolauncher .
