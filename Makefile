WORKDIR := $(shell pwd)
CONTAINER_NAME := "stm32-dev"

all: fedora

build_macOS:
	docker build -t $(CONTAINER_NAME) -f Dockerfile

run_macOS: build_macOS
	container run --rm -it \
		-v $(WORKDIR):/workspace \
		--device /dev/cu.usbmodem21103 \
		$(CONTAINER_NAME) \
		/bin/bash

build_fedora:
	docker buildx build -t $(CONTAINER_NAME) -f Dockerfile .

run_fedora: build_fedora
	docker run --rm -it --privileged \
		-v $(WORKDIR):/workspace \
		--device /dev/bus/usb/001/021 \
		$(CONTAINER_NAME) \
		/bin/bash


