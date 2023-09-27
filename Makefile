CHIRUN_REPO=https://github.com/chirun-ncl/chirun.git
VERSION=$(shell git ls-remote $(CHIRUN_REPO) | grep refs/heads/master | cut -f 1)
DOCKER_TAG=coursebuilder/chirun-docker:dev

build:
	docker build . --build-arg VERSION=$(VERSION) -t $(DOCKER_TAG)

push: build
	docker push $(DOCKER_TAG)
