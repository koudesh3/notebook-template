from utils.secrets import API_KEY
import logging

# Set up logging
logging.basicConfig(
    filename='app.log',
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)


# Example function
def example_function(string: str) -> str:
    logging.info("Running example function")
    variable: str = string
    logging.info(f"Variable: {variable}")
    logging.info(f"API Key from env: {API_KEY}")


# Main handler function
def handler() -> None:
    logging.info("Starting application")
    try:
        example_function("Hello, world!")
    except Exception as e:
        logging.error(f"An error occurred: {e}")
    logging.info("Application finished")


if __name__ == "__main__":
    handler()