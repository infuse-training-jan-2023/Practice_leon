from src.password_validator import PasswordValidator
import pytest


obj= PasswordValidator

def test_password_api_case1():
    assert obj.validate("") == False

def test_password_api_case2():
    with pytest.raises(Exception) as e:
        assert obj.validate(123)
    
def test_password_api_case3():
    assert obj.validate("user") == False

def test_password_api_case4():
    assert obj.validate("user1") == False

def test_password_api_case5():
    assert obj.validate("User1") == False

def test_password_api_case6():
    assert obj.validate("User1@") == False

def test_password_api_case6():
    assert obj.validate("User1@12") == True