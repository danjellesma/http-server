# include env_make
NS = danjellz
VERSION ?= latest

REPO = http-server
NAME = http-server
PORTS = -p 8080:8080
VOLUMES = -v ${PWD}:/public
BUILD_ARGS=--build-arg VCS_REF=`git rev-parse --short HEAD` \
--build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"`

.PHONY: build push shell run start stop rm release

build:
	docker build -t $(NS)/$(REPO):$(VERSION) $(BUILD_ARGS) $(ARGS) .

push:
	docker push $(NS)/$(REPO):$(VERSION)

shell:
	docker run -it --rm --name $(NAME) $(PORTS) $(VOLUMES) $(ENV) $(NS)/$(REPO):$(VERSION) sh

run:
	docker run -it --rm --name $(NAME) $(PORTS) $(VOLUMES) $(ENV) $(NS)/$(REPO):$(VERSION)

start:
	docker run -d --name $(NAME) $(VOLUMES) $(ENV) $(NS)/$(REPO):$(VERSION)

stop:
	docker stop $(NAME)

rm:
	docker rm $(NAME)

release: build
	make push -e VERSION=$(VERSION)

default: build
