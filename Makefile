CHIRUN_REPO=https://github.com/chirun-ncl/chirun.git
VERSION=$(shell git ls-remote $(CHIRUN_REPO) | grep refs/heads/master | cut -f 1)

build:
	docker build . --build-arg VERSION=$(VERSION)
