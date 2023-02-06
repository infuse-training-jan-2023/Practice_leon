import pytest
from pytest_bdd import scenarios, when , then
import requests

scenarios('../features/delete_item.feature')

delete_item_url = "http://127.0.0.1:5000/item/1"

@when('I delete item')
def delete_item():
    pytest.api_response = requests.delete(delete_item_url)

@then('I should get item deleted confirmation message')
def check_the_msg_returned(): 
    body = pytest.api_response.json()
    assert type(body) == dict

@then('The api status code should be 200')
def check_status_code():
    assert pytest.api_response.status_code == 200

@then('The api Response type should be json')
def check_content_type():
    assert pytest.api_response.headers['content-type'] == 'application/json'