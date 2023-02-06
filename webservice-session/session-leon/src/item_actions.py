from item_repository import ItemRepository
import json
import csv

class ItemActions:
    def __init__(self) -> None:
        self.item_repo = ItemRepository()


    def delete_item(self ,index):
        try:
            items = self.item_repo.delete_item(index)
            return items
        except Exception as e:
            print(e)
            return {}


    def get_item(self , index):
        try:
            items = self.item_repo.get_item(index)
            print(items)
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
        

    def update_item(self, index ,item , status , reminder):
        try:
            data = self.item_repo.update_item(index ,item,status, reminder)
            return data
        except Exception as e:
            print(e)
            return {}
        

    
    def add_user(self, request_data):
        try:
            item = self.item_repo.add_user(request_data )
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
           
            data_file = open('data_file.csv', 'w')
            csv_writer = csv.writer(data_file)
            count = 0

            for item in data:
                if count == 0:
                    header = item.keys()
                    csv_writer.writerow(header)
                    count += 1

                csv_writer.writerow(item.values())

            data_file.close()
            return "csv file created"
        except Exception as e:
            print(e)
            return {}
        
        
        
