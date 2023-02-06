import sqlite3

class ItemRepository:

    DBPATH = './todo.db'
    NOT_STARTED ="not started"

    @staticmethod
    def connect_db():
        return sqlite3.connect(ItemRepository.DBPATH)

    @staticmethod
    def get_item(index):
        try:
            conn = ItemRepository.connect_db()
            c = conn.cursor()
            row = c.execute('select * from items where id=?',(index,))
            return row
        except Exception as e:
            raise Exception('Error: ', e)
        
    @staticmethod
    def delete_item(index):
        try:
            conn = ItemRepository.connect_db()
            c = conn.cursor()
            c.execute('DELETE FROM items where id=?',(index,))
            conn.commit()
            return {"msg":"deleted item"}
        except Exception as e:
            raise Exception('Error: ', e)

    @staticmethod
    def get_all_items():
        try:
            conn = ItemRepository.connect_db()
            c = conn.cursor()
            rows = c.execute('select * from items')
            return rows
        except Exception as e:
            raise Exception('Error: ', e)
    
    @staticmethod
    def add_item(item, reminder):
        try:
            conn = ItemRepository.connect_db()
            c = conn.cursor()
            insert_cursor = c.execute('insert into items(item, status, reminder) values(?,?,?)', (item, ItemRepository.NOT_STARTED, reminder))
            conn.commit()
            return {
                'id':  insert_cursor.lastrowid,
                'item': item,
                'status': ItemRepository.NOT_STARTED,
                'reminder': reminder
                }
        except Exception as e:
            raise Exception('Error: ', e)
        
    @staticmethod
    def update_item(index ,item,status, reminder):
        try:
            conn = ItemRepository.connect_db()
            c = conn.cursor()
            c.execute('update items set item=?, status=?, reminder=? where id=?', (item, status, reminder , index))
            conn.commit()
            return {
                'msg' : "updated",
                }         
        except Exception as e:
            raise Exception('Error: ', e)
    
    @staticmethod
    def add_user(request_data):
        try:
            conn = ItemRepository.connect_db()
            c = conn.cursor()
            name = request_data['name']
            address = request_data['address']
            phone = request_data['phone']
            insert_cursor = c.execute('insert into user(name, address, phone) values(?,?,?)', (name, address, phone))
            conn.commit()
            return {
                'id': insert_cursor.lastrowid,
                'name': name,
                'address': address,
                'phone': phone
                }
        except Exception as e:
            raise Exception('Error: ', e)
        