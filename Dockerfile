# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Accept build argument for Jupyter token
ARG JUPYTER_TOKEN=jupyter-env

# Copy requirements.txt first to leverage Docker cache
COPY requirements.txt ./

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install Jupyter
RUN pip install --no-cache-dir jupyter jupyterlab

# Copy the current directory contents into the container
COPY . .

# Expose the Jupyter port
EXPOSE 8888

# Start Jupyter when the container launches, using the provided token
CMD ["sh", "-c", "jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token=${JUPYTER_TOKEN}"]