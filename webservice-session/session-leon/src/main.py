from flask import Flask , Response , request
from item_actions import ItemActions
from email_validator import EmailValidator
from password_validator import PasswordValidator
from todos_api import Todos_api
import json

app = Flask(__name__)
item_actions = ItemActions()

@app.route('/',methods = ['GET'])
def welcome():
    return "welcome to Todos api"

@app.route('/items', methods = ['GET'])
def get_all_items():
  items = item_actions.get_all_items()
  print(items)
  return Response(json.dumps(items), mimetype='application/json', status=200)

@app.route('/item/<int:id>', methods = ['DELETE'])
def delete_item(id):
  item = item_actions.delete_item(id)
  return Response(item, mimetype='application/json', status=201)

@app.route('/items/<int:id>', methods = ['GET'])
def get_item(id):
  item = item_actions.get_item(id)
  return Response(json.dumps(item), mimetype='application/json', status=201)

# create an api to validate email
@app.route('/Email', methods = ['POST'])
def validate_email():
  email_validator =EmailValidator
  request_data = request.get_json()
  email = request_data['email']
  email_status = email_validator.validate(email)
  if email_status:
    return Response("valid", status=200)
  return Response("invalid", status=200)

# create an api to validate password
@app.route('/password', methods = ['POST'])
def validate_password():
  password_validator =PasswordValidator
  request_data = request.get_json()
  password = request_data['pass']
  password_status = password_validator.validate(password)
  if password_status:
    return Response("valid", status=200)
  return Response("invalid", status=200)

@app.route('/items',methods = ['PUT'])
def update_item():
    request_data = request.get_json()
    index = request_data["id"]
    item = request_data['item']
    status = request_data['status']
    reminder = request_data['reminder']
    added_item = item_actions.update_item(index, item, status ,reminder)
    return   added_item

# create an api to add a new item
@app.route('/additem', methods = ['POST'])
def add_new_item():
  request_data = request.get_json()
  item = request_data['item']
  reminder = request_data['reminder']

  added_item = item_actions.add_item(item, reminder)
  if added_item == {}:
    return Response("{'error': 'Erro addding the item'}", mimetype='application/json', status=500)
  return Response(json.dumps(added_item), mimetype='application/json', status=201)

@app.route('/user', methods = ['POST'])
def add_new_user():
  request_data = request.get_json()
  added_user = item_actions.add_user(request_data)
  if added_user == {}:
    return Response("{'error': 'Erro addding the user'}", mimetype='application/json', status=500)
  return Response(json.dumps(added_user), mimetype='application/json', status=201)

@app.route('/to_csv', methods = ['GET'])
def create_csv():
  msg = item_actions.create_csv()
  if msg == {}:
    return Response("{'error': 'Erro addding the item'}", mimetype='application/json', status=500)
  return Response(msg, mimetype='application/json', status=201)

@app.route('/todos/<id>', methods = ['GET'])
def get_todos(id):
  res = Todos_api.get_todos(id)
  return res

if __name__=='__main__':
    app.run(debug =True, port = 5000, host ='0.0.0.0')