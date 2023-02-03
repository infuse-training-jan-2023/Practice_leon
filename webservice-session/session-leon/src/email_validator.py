
import re

class EmailValidator():
    def validate(email):
        email_regex = "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$"
        if re.search(email_regex , email):
            return True
        else:
            return False


