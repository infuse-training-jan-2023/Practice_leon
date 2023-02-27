import pytest
from pytest_bdd import scenarios, when , then
import requests

scenarios('../features/get_item.feature')

get_item_url = "http://127.0.0.1:5000/item/3"

@when('I search for a item')
def get_item():
    pytest.api_response = requests.get(get_item_url)

@then('I should get he item')
def check_the_item_returned():
    body = pytest.api_response.json()
    for item in body:
        assert type(item) == dict

@then('The api status code should be 200')
def check_status_code():
    assert pytest.api_response.status_code == 200

@then('The api Response type should be json')
def check_content_type():
    assert pytest.api_response.headers['content-type'] == 'application/json'