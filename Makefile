WORKDIR := $(shell pwd)
CONTAINER_NAME := "stm32-dev"

macOS:
	container run --rm -it -v $(WORKDIR):/workspace $(CONTAINER_NAME) /bin/bash

