import pytest
from pytest_bdd import scenarios, when , then
import requests

scenarios('../features/update_item.feature')

update_item_url = "http://127.0.0.1:5000/item"

item = { "id": 2 ,"item":"study","status": "in progress" ,"reminder":False}

@when('I update item')
def update_item():
    pytest.api_response = requests.put(update_item_url , json = item)

@then('I should get item updated confirmation message')
def check_the_msg_returned(): 
    body = pytest.api_response.json()
    assert type(body) == dict

@then('The api status code should be 201')
def check_status_code():
    assert pytest.api_response.status_code == 201

@then('The api Response type should be json')
def check_content_type():
    assert pytest.api_response.headers['content-type'] == 'application/json'