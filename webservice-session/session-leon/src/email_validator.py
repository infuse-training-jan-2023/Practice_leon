
import re

class EmailValidator():
    def validate(email):
        #email_regex = "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$"
        email_regex = r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,7}\b'
        if re.search(email_regex , email):
            return True
        else:
            return False


