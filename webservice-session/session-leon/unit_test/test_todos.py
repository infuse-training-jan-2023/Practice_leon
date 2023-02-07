from src.todos_api import Todos_api
import pytest

obj = Todos_api

def test_todo_below_start_index():   
    assert obj.get_todos(0) == "index out of range"

def test_todo_above_end_index():   
    assert obj.get_todos(201) == "index out of range"

def test_todo_valid():   
    assert obj.get_todos(100) 

def test_negative_index():   
    assert obj.get_todos(-5) == "index out of range"

def test_string_index():   
    assert obj.get_todos("-5") == "index out of range"

def test_empty_index():   
    assert obj.get_todos("") == "type error: not a int"