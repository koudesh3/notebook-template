# test_main.py
import pytest
from unittest.mock import patch
from main import example_function, handler
import logging

@pytest.fixture(autouse=True)
def setup_logging(caplog):
    caplog.set_level(logging.INFO)


def test_example_function(caplog):
    example_function("Test String")
    
    assert "Running example function" in caplog.text
    assert "Variable: Test String" in caplog.text


def test_main_success(caplog):
    with patch('main.example_function') as mock_example_function:
        handler()
        mock_example_function.assert_called_once_with("Hello, world!")
        
    assert "Starting application" in caplog.text
    assert "Application finished" in caplog.text
    assert "ERROR" not in caplog.text


def test_main_exception(caplog):
    with patch('main.example_function', side_effect=Exception("Test Error")):
        handler()
        
    assert "ERROR" in caplog.text