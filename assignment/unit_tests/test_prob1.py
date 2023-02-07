
from problem1.prob1 import SerialAvg
import pytest

obj1 = SerialAvg()

def test_invalid_serial_no_case1():
    serial_no="0s2-10.00-20.00"
    with pytest.raises(Exception) as e:
        obj1.get_serial_avg(serial_no)

def test_invalid_serial_no_case2():
    serial_no="002-F0.00-20.00"
    with pytest.raises(Exception) as e:
        obj1.get_serial_avg(serial_no)

def test_invalid_serial_no_case3():
    serial_no="0s2-10.00-J0.00"
    with pytest.raises(Exception) as e:
        obj1.get_serial_avg(serial_no)  

def test_invalid_serial_no():
    serial_no="0s2-10.000-20.0000"
    with pytest.raises(Exception) as e:
        obj1.get_serial_avg(serial_no)

def test_invalid_serial_no_case5():
    serial_no="-02-10.00-20.-0"
    with pytest.raises(Exception) as e:
        obj1.get_serial_avg(serial_no)

def test_invalid_serial_no_case4():
    serial_no="0s2-10.000-20.0000"
    with pytest.raises(Exception) as e:
        obj1.get_serial_avg(serial_no)
    
def test_valid_serial_no_case1():
    serial_no="002-10.00-20.00"
    assert obj1.get_serial_avg(serial_no)== "002-15.00"

def test_valid_serial_no_case2():
    serial_no="002-10.00-08.00"
    assert obj1.get_serial_avg(serial_no)== "002-09.00"

def test_valid_serial_no_case3():
    serial_no="002-00.00-00.00"
    assert obj1.get_serial_avg(serial_no)== "002-00.00"