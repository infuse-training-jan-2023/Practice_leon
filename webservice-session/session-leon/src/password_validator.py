
import re

class InvalidPassword(Exception):
    pass

class PasswordValidator():
    def validate(password):
        Password_regex = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$"
        if re.search(Password_regex , password):
            return True
        return False
    


