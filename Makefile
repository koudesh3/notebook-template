# Define the Docker image name as a variable
IMAGE_NAME := tomato
TOKEN := $(IMAGE_NAME)

# Define phony targets
.PHONY: build run stop clean

# Build the Docker image
build:
	docker build -t $(IMAGE_NAME) --build-arg JUPYTER_TOKEN=$(TOKEN) .

# Run the Docker container with volume mapping
run:
	docker run --rm -d --name jupyter-container -p 8888:8888 -v $(PWD):/usr/src/app $(IMAGE_NAME)
	@echo "Jupyter Lab is running at http://localhost:8888?token=$(TOKEN)"

# Stop the container
stop:
	docker stop jupyter-container || true

# Clean up Docker resources
clean: stop
	docker rmi $(IMAGE_NAME) || true