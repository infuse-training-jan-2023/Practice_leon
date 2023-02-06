from src.todos_api import Todos_api
import pytest

obj = Todos_api

def test_todo_out_of_range_case1():   
    with pytest.raises(Exception) as e:
        assert obj.get_todos(0) 

def test_todo_out_of_range_case2():   
    with pytest.raises(Exception) as e:
        assert obj.get_todos(201) 

def test_todo_valid():   
    assert obj.get_todos(100) 

def test_todo_out_of_range_case3():   
    with pytest.raises(Exception) as e:
        assert obj.get_todos(-5) 

def test_todo_string():   
    with pytest.raises(Exception) as e:
        assert obj.get_todos("-5") 

def test_todo_empty():   
    with pytest.raises(Exception) as e:
        assert obj.get_todos("")