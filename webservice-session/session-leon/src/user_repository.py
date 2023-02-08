import sqlite3

class UserRepository:
     DBPATH = './todo.db'


     def __init__(self) -> None:   
        self.db_path = './todo.db'
        self.connection = None

     def connect_db(self):
        if self.connection is None:
            self.connection =  sqlite3.connect(self.db_path, check_same_thread=False)

     def add_user(self, request_data):
        try:
            self.connect_db()
            cursor = self.connection.cursor()
            name = request_data['name']
            address = request_data['address']
            phone = request_data['phone']
            insert_cursor = cursor.execute('insert into user(name, address, phone) values(?,?,?)', (name, address, phone))
            self.connection.commit()
            return {
                'id': insert_cursor.lastrowid,
                'name': name,
                'address': address,
                'phone': phone
                }
        except Exception as e:
            raise Exception('Error: ', e)