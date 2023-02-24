from src.item_repository import ItemRepository

message = {"msg" : "item deleted"}

  

item_repo = ItemRepository()

def test_delete_item_makes_db_call(mocker):
  mock = mocker.patch('src.item_repository.ItemRepository.delete_item', return_value = [])
  _ = item_repo.delete_item()
  assert mock.call_count == 1

def test_delete_item(mocker):
    mock = mocker.patch('src.item_repository.ItemRepository.delete_item', return_value = message)
    msg_returned = item_repo.delete_item()
    assert message == msg_returned