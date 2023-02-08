import pytest
from pytest_bdd import scenarios, when , then
import requests
import json

scenarios('../features/add_item.feature')

add_item_url = "http://127.0.0.1:5000/item"

item = {"item":"study","reminder":True}

@when('I add new item')
def add_item():
    pytest.api_response = requests.post(add_item_url , json = item)

@then('I should get item details that was added')
def check_the_item_returned():
    body = pytest.api_response.json()
    assert type(body) == dict

@then('The api status code should be 201')
def check_status_code():
    assert pytest.api_response.status_code == 201

@then('The api Response type should be json')
def check_content_type():
    assert pytest.api_response.headers['content-type'] == 'application/json'