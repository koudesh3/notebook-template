# Define the Docker image name as a variable
IMAGE_NAME := test-app
MIN_COVERAGE := 80

# Define phony targets
.PHONY: build run test clean all

# Build the Docker image
build:
	docker build -t $(IMAGE_NAME) .


# Run the Docker container with volume mapping and interaction
run:
	docker run --rm -it -v $(PWD):/usr/src/app $(IMAGE_NAME)


# Run pytest tests in the Docker container
define run_tests
	pytest -v src && \
	pytest --cov=src --cov-report=term-missing --cov-fail-under=$(MIN_COVERAGE) src
endef

test:
	docker run --rm -v $(PWD):/usr/src/app $(IMAGE_NAME) /bin/sh -c "$(run_tests)"


# Clean up Docker resources
clean:
	docker container prune -f
	docker image prune -f
	docker rmi $(IMAGE_NAME)


# Combine build and run
all: build test run clean

