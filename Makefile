
IMAGE=tensorflow
VERSION := $(shell git describe --tags --always --dirty)
REGISTRY := shvid
TAG := $(VERSION)
PWD := $(shell pwd)

all: build

version:
	@echo $(TAG)

build:
	docker build -t $(REGISTRY)/$(IMAGE):$(TAG) -f Dockerfile .

run: build
	docker run -it --rm --runtime=nvidia $(REGISTRY)/$(IMAGE):$(TAG) python3 -c "from tensorflow.python.client import device_lib; print(device_lib.list_local_devices())"

dump: build
	docker save $(REGISTRY)/$(IMAGE):$(TAG) | gzip > $(IMAGE).tar.gz

push: build
	docker push ${REGISTRY}/${IMAGE}:${TAG}

login:
	docker login docker.io

clean:
	docker ps -q -f 'status=exited' | xargs docker rm
	docker image list | grep \\-dirty | awk -F' ' '{print $3}' | xargs docker image rm
	echo "y" | docker system prune -a
