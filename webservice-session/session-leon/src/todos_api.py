
import requests

class InvalidIndex(Exception):
    pass

class Todos_api():
    def get_todos(index):
        try:
          index = int(index)
          if index in range(1 ,201):
            res = requests.get(f"https://jsonplaceholder.typicode.com/todos/{index}")
          else:
           raise InvalidIndex("index out of range")
          return res.text
        except:
          raise TypeError("type error: not a int")
          
