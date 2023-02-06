from src.item_repository import ItemRepository

message = {"msg" : "item updated"}

  

item_repo = ItemRepository()

def test_update_item_makes_db_call(mocker):
  mock = mocker.patch('src.item_repository.ItemRepository.update_item', return_value = [])
  _ = item_repo.update_item()
  assert mock.call_count == 1

def test_update_item(mocker):
    mock = mocker.patch('src.item_repository.ItemRepository.update_item', return_value = message)
    msg_returned = item_repo.update_item()
    assert message == msg_returned