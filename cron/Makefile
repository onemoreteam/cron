.PHONY: build release

IMAGE := onemoreteam/cron
VERSION := $(shell cat VERSION)
IMAGE_VERSION := $(IMAGE):$(VERSION)

all: build

build:
	@echo "Start building at $$(date)"
	docker build -t $(IMAGE) .
	docker tag $(IMAGE) $(IMAGE_VERSION)

release: build
	@echo "Start releasing at $$(date)"
	@docker push $(IMAGE):latest
	@docker push $(IMAGE_VERSION)

