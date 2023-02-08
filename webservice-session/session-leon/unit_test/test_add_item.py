from src.item_repository import ItemRepository

item = {
        'id': 2,
        'item': "go shoping",
        'status': "NOT_STARTED",
        'reminder': False
        }

  

item_repo = ItemRepository()

def test_add_item_makes_db_call(mocker):
  mock = mocker.patch('src.item_repository.ItemRepository.add_item', return_value = [])
  _ = item_repo.add_item()
  assert mock.call_count == 1

def test_add_item(mocker):
    mock = mocker.patch('src.item_repository.ItemRepository.add_item', return_value = item)
    item_returned = item_repo.add_item()
    assert item == item_returned