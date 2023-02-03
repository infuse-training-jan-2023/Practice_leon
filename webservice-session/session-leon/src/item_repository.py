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
            return "deleted item"
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
                'id': insert_cursor.lastrowid,
                'item': item,
                'status': ItemRepository.NOT_STARTED,
                'reminder': reminder
                }
        except Exception as e:
            raise Exception('Error: ', e)