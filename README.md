# Koude's Python Project Template 🐍
This is my project template for Python scripts. Used to prevent having to manage venvs and python installations. Use this to spin up a quick python script that works on anyone's machine in the same way <3

## ✨ Features ✨
* **Test framework**: `pytest` with configurable minimum threshold for test coverage
* **Logging**: app.log stores logs of the application
* **Local secret management**: Add secrets to a .env file in the repo and access them from `src/utils/secrets.py`

## Prerequisites
* Docker desktop 🐳

## Setup
1. Add any dependencies to `requirements.txt`
2. Add secrets to a `.env` file in the repo. Define secret constants in `src/utils/secrets.py` to access from the rest of the app.
3. Change `IMAGE_NAME` in the Makefile to your app's name

## Usage
`make build`: Build the app

`make test`: Run unit tests using pytest

`make run`: Run the app

`make clean`: Clean the docker image

`make all`: Run build, test, run, clean in sequence
