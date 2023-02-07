import sqlite3

class ItemRepository:

    NOT_STARTED ="not started"

    def __init__(self) -> None:   
        self.db_path = './todo.db'
        self.connection = None

    def connect_db(self):
        if self.connection is None:
            self.connection =  sqlite3.connect(self.db_path, check_same_thread=False)

  
    def get_item(self, index):
        try:
            self.connect_db()
            cursor = self.connection.cursor()
            row =  cursor.execute('select * from items where id=?',(index,))
            return row
        except Exception as e:
            raise Exception('Error: ', e)
    
    def delete_item( self, id):
        try:
            conn = self.connect_db()
            cursor = self.connection.cursor()
            cursor.execute('DELETE FROM items where id=?',(id,))
            self.connection.commit()
            return {"msg":"deleted item"}
        except Exception as e:
            raise Exception('Error: ', e)
        

    def get_all_items(self):
        try:
            self.connect_db()
            cursor = self.connection.cursor()
            rows = cursor.execute('select * from items')
            return rows
        except Exception as e:
            raise Exception('Error: ', e)

    def add_item(self,item, reminder):
        try:
            self.connect_db()
            cursor = self.connection.cursor()
            insert_cursor = cursor.execute('insert into items(item, status, reminder) values(?,?,?)', (item, self.NOT_STARTED, reminder))
            self.connection.commit()
            return {
                'id':  insert_cursor.lastrowid,
                'item': item,
                'status': self.NOT_STARTED,
                'reminder': reminder
                }
        except Exception as e:
            raise Exception('Error: ', e)
    
    def update_item(self, id ,request_data):
        try:
            self.connect_db()
            cursor = self.connection.cursor()
            for key, value in request_data.items():
                print( f"{key} : {value}")
                cursor.execute(f'update items set {key} = ? where id = ? ', (value, id))
            self.connection.commit()
            return {
                'msg' : "item updated",
                }         
        except Exception as e:
            raise Exception('Error: ', e)

   
        