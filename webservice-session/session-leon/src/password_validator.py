
import re

class InvalidPassword(Exception):
    pass

class PasswordValidator():
    def validate(password):
        Password_regex = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$"
        try:
            if re.search(Password_regex , password):
                return True
            else:
                return False
        except:
            raise InvalidPassword("password has to be a string")


