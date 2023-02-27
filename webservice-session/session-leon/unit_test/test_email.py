from src.email_validator import EmailValidator
import pytest

obj= EmailValidator

def test_email_api_case1():
    assert obj.validate("user") == False

def test_email_api_case2():
    assert obj.validate("user.com") == False

def test_email_api_case3():
    assert obj.validate("user@com") == False

def test_email_api_case4():
    assert obj.validate("user@gmailcom") == False

def test_email_api_case5():
    assert obj.validate("usergmail.com") == False

def test_email_api_case6():
    assert obj.validate("user@gmail.com") == True
