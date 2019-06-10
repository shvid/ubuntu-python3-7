#
#   Simple makefile for python project
#
#   Alex Shvid
#
#

IMAGE := ubuntu-python
VERSION := $(shell git describe --tags --always --dirty)
REGISTRY := shvid

all: build

version:
	@echo $(VERSION)

build:
	docker build -t $(REGISTRY)/$(IMAGE):$(VERSION) -f Dockerfile .

run: build
	docker run $(REGISTRY)/$(IMAGE):$(VERSION) node --version

push: build
	docker push ${REGISTRY}/${IMAGE}:${VERSION}
	docker tag ${REGISTRY}/${IMAGE}:${VERSION} ${REGISTRY}/${IMAGE}:latest
	docker push ${REGISTRY}/${IMAGE}:latest
