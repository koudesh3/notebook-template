import os
from dotenv import load_dotenv

# Load the environment variables from the .env file
load_dotenv()

# Define secret constants
API_KEY = os.getenv("API_KEY")