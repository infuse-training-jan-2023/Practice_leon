from item_repository import ItemRepository
from user_repository import UserRepository
import json
import csv

class ItemActions:
    def __init__(self) -> None:
        self.item_repo = ItemRepository()
        self.user_repo = UserRepository()

    def delete_item(self ,id):
        try:
            if( self.get_item(id)==None):
                return {"msg" : "item not found"}
            items = self.item_repo.delete_item(id)
            return items
        except Exception as e:
            print(e)
            return {}

    def get_item(self , index):
        try:
            items = self.item_repo.get_item(index)
            res = []
            for item in items:
                res.append({
                'id': item[0],
                'item': item[1],
                'status': item[2],
                'reminder': item[3],
                })
                return res
        except Exception as e:
            print(e)
            return {}

    def get_all_items(self):
        try:
            items = self.item_repo.get_all_items()
            res = []
            for item in items:
                res.append({
                'id': item[0],
                'item': item[1],
                'status': item[2],
                'reminder': item[3],
                })
            return res
        except Exception as e:
            print(e)
            return {}

    def add_item(self, item, reminder):
        try:
            item = self.item_repo.add_item(item, reminder)
            return item
        except Exception as e:
            print(e)
            return {}
        
    def update_item(self, id, request_data):
        try:
            if( self.get_item(id)==None):
                return {"msg" : "item not found"}
            data = self.item_repo.update_item(id ,request_data)
            return data
        except Exception as e:
            print(e)
            return {}
           
    def add_user(self, request_data):
        try:
            item = self.user_repo.add_user(request_data )
            return item
        except Exception as e:
            print(e)
            return {}
        
    def create_csv(self):
        try:
            rows = self.item_repo.get_all_items()

            data = []
            for item in rows:
                data.append({
                'id': item[0],
                'item': item[1],
                'status': item[2],
                'reminder': item[3],
                })
           
            with open("data_file.csv") as data_file:
            #data_file = open('data_file.csv', 'w')
                csv_writer = csv.writer(data_file)
                count = 0

                for item in data:
                    if count == 0:
                        header = item.keys()
                        csv_writer.writerow(header)
                        count += 1

                    csv_writer.writerow(item.values())

            #data_file.close()
            return "csv file created"
        except Exception as e:
            print(e)
            return {}
        
        
        
