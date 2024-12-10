CHIRUN_REPO=https://github.com/chirun-ncl/chirun.git
VERSION=$(shell git ls-remote $(CHIRUN_REPO) | grep refs/heads/master | cut -f 1)
TAG=dev
BASE_REPO=coursebuilder/chirun-base:$(TAG)
DOCKER_REPO=coursebuilder/chirun-docker:$(TAG)

build: build_base
	docker build . --build-arg VERSION=$(VERSION) -t $(DOCKER_REPO)

build_base:
	docker build . -f chirun-base.Dockerfile -t $(BASE_REPO)

push: build
	docker push $(BASE_REPO)
	docker push $(DOCKER_REPO)
	ssh chirun docker pull $(DOCKER_REPO)
