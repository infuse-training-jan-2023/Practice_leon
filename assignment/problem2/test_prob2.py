
from prob2 import ArrayOperation
import pytest


def test_element_of_invalid_index_out_of_bound_case1():
    arr=[9, 5, 1, 2, 3, 4, 0, -1]
    obj1 = ArrayOperation()
    with pytest.raises(Exception) as e:
        obj1.element_at(arr , -1)

def test_element_of_invalid_index_out_of_bound_case2():
    arr=[9, 5, 1, 2, 3, 4, 0, -1]
    obj1 = ArrayOperation()
    with pytest.raises(Exception) as e:
        obj1.element_at(arr ,9)

def test_element_of_invalid_index_string():
    arr=[9, 5, 1, 2, 3, 4, 0, -1]
    obj1 = ArrayOperation()
    with pytest.raises(Exception) as e:
        obj1.element_at(arr ,"a")

def test_element_of_invalid_index_char():
    arr=[9, 5, 1, 2, 3, 4, 0, -1]
    obj1 = ArrayOperation()
    with pytest.raises(Exception) as e:
        obj1.element_at(arr , 'a')

def test_element_of_valid_index_0():
    arr=[9, 5, 1, 2, 3, 4, 0, -1]
    obj1 = ArrayOperation()
    assert obj1.element_at(arr , 0) == 9

def test_element_of_valid_index_4():
    arr=[9, 5, 1, 2, 3, 4, 0, -1]
    obj1 = ArrayOperation()
    assert obj1.element_at(arr , 4) == 3


def test_element_of_valid_index_7():
    arr=[9, 5, 1, 2, 3, 4, 0, -1]
    obj1 = ArrayOperation()
    assert obj1.element_at(arr , 7) == -1

#############################################################################

def test_inclusive_range_invalid():
    arr=[9, 5, 1, 2, 3, 4, 0, -1]
    obj1 = ArrayOperation()
    with pytest.raises(Exception) as e:
        obj1.inclusive_range(arr , -1 , 9)

def test_inclusive_range_invalid_Str():
    arr=[9, 5, 1, 2, 3, 4, 0, -1]
    obj1 = ArrayOperation()
    with pytest.raises(Exception) as e:
        obj1.inclusive_range(arr , "one" , "seven")

def test_inclusive_range_valid():
    arr=[9, 5, 1, 2, 3, 4, 0, -1]
    obj1= ArrayOperation()
    assert obj1.inclusive_range(arr , 0 ,7) == [9, 5, 1, 2, 3, 4, 0, -1]

def test_inclusive_range_valid_case2():
    arr=[9, 5, 1, 2, 3, 4, 0, -1]
    obj1= ArrayOperation()
    assert obj1.inclusive_range(arr , 6 ,7) == [0, -1]

def test_inclusive_range_valid_case3():
    arr=[9, 5, 1, 2, 3, 4, 0, -1]
    obj1= ArrayOperation()
    assert obj1.inclusive_range(arr , 7 ,7) == [-1]

def test_inclusive_range_valid_case4():
    arr=[9, 5, 1, 2, 3, 4, 0, -1]
    obj1= ArrayOperation()
    assert obj1.inclusive_range(arr , 7 ,0) == []

##########################################################

def test_non_inclusive_range_invalid():
    arr=[9, 5, 1, 2, 3, 4, 0, -1]
    obj1 = ArrayOperation()
    with pytest.raises(Exception) as e:
        obj1.non_inclusive_range(arr , -1 , 9)

def test_non_inclusive_range_invalid_Str():
    arr=[9, 5, 1, 2, 3, 4, 0, -1]
    obj1 = ArrayOperation()
    with pytest.raises(Exception) as e:
        obj1.non_inclusive_range(arr , "one" , "seven")

def test_non_inclusive_range_valid():
    arr=[9, 5, 1, 2, 3, 4, 0, -1]
    obj1= ArrayOperation()
    assert obj1.non_inclusive_range(arr , 0 ,7) == [9, 5, 1, 2, 3, 4, 0]

def test_non_inclusive_range_valid_case2():
    arr=[9, 5, 1, 2, 3, 4, 0, -1]
    obj1= ArrayOperation()
    assert obj1.non_inclusive_range(arr , 6 ,7) == [0]

def test_non_inclusive_range_valid_case3():
    arr=[9, 5, 1, 2, 3, 4, 0, -1]
    obj1= ArrayOperation()
    assert obj1.non_inclusive_range(arr , 7 ,7) == []

def test_non_inclusive_range_valid_case4():
    arr=[9, 5, 1, 2, 3, 4, 0, -1]
    obj1= ArrayOperation()
    assert obj1.non_inclusive_range(arr , 7 ,0) == []

###########################################################

def test_start_and_length_outofBounds():
    arr = [9,5,1,2,3,4,0,-1]          
    obj1= ArrayOperation()   
    with pytest.raises(Exception) as e:
        obj1.start_and_length(arr , -1 , 9)
   
def test_start_and_length_outofBounds_string():
    arr = [9,5,1,2,3,4,0,-1]             
    obj1= ArrayOperation()   
    with pytest.raises(Exception) as e:
        obj1.start_and_length(arr , "a" , "a")
 
def test_start_and_length_range_larger_then_size():
    arr = [9,5,1,2,3,4,0,-1]  
    obj1= ArrayOperation()            
    assert obj1.start_and_length(arr , 6 , 7) == [0,-1]

def test_start_and_length_valid_input():
    arr = [9,5,1,2,3,4,0,-1]  
    obj1= ArrayOperation()    
    assert obj1.start_and_length(arr , 0 , 3) == [9,5,1]




