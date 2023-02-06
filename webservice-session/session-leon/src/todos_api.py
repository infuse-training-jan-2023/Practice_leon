
import requests

class Todos_api():
    def get_todos(index):
        try:
          index = int(index)
          if index in range(1 ,201):
            res = requests.get(f"https://jsonplaceholder.typicode.com/todos/{index}")
          else:
            return "index out of range"
          return res.text
        except:
          return "type error: not a int"
          
