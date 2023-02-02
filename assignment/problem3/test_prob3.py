
from prob3 import SportsArray
import pytest

def test_skip_sports_out_of_range_negative_len():
    skip_sports= ['cricket' , 'TT' , 'Football' , 'hockey']   
    obj1=SportsArray()
    with pytest.raises(Exception) as e:
        obj1.skip_sports(skip_sports,-1) 

def test_skip_sports_out_of_range_positive_len():
    skip_sports= ['cricket' , 'TT' , 'Football' , 'hockey']     
    obj1=SportsArray()
    with pytest.raises(Exception) as e:
        obj1.skip_sports(skip_sports,9) 

def test_skip_sports_out_of_range_index_string():
    skip_sports= ['cricket' , 'TT' , 'Football' , 'hockey']     
    obj1=SportsArray()
    with pytest.raises(Exception) as e:
        obj1.skip_sports(skip_sports,"a") 

def test_skip_sports_valid():
    skip_sports= ['cricket' , 'TT' , 'Football' , 'hockey']  
    obj1=SportsArray()   
    assert  obj1.skip_sports(skip_sports,2) == ["Football", "hockey"]

def test_skip_sports_valid_end_point_index():
    skip_sports= ['cricket' , 'TT' , 'Football' , 'hockey']  
    obj1=SportsArray()   
    assert  obj1.skip_sports(skip_sports,4) == []

def test_skip_sports_valid_start_point_index():
    skip_sports= ['cricket' , 'TT' , 'Football' , 'hockey']  
    obj1=SportsArray()   
    assert  obj1.skip_sports(skip_sports,0) == ['cricket' , 'TT' , 'Football' , 'hockey'] 