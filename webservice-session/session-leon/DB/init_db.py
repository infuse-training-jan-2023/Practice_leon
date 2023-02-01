import sqlite3

connection = sqlite3.connect('todo.db')

with open('DB/schema.sql') as f:
    connection.executescript(f.read())

cursor = connection.cursor()

cursor.execute("INSERT INTO items (item, status, reminder) VALUES (?,?,?)",('Complete assignments', 'In Progress', True))

connection. commit ()
connection.close() 