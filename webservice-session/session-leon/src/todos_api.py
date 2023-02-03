
from flask import  request
import json

class Todos_api():
    def get_todos(index):
        res = request.get('https://jsonplaceholder.typicode.com/todos/?',(index,))
        #response = json.loads(res.text)
        print(res)
