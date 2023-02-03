from item_repository import ItemRepository

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
        

    def update_item(self, item , status , reminder):
        try:
            data = self.item_repo.add_item(item,status, reminder)
            return data
        except Exception as e:
            print(e)
            return {}
        
