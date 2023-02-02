
from prob1 import SerialAvg
import pytest


def test_invalid_serial_no_case1():
    serial_no="0s2-10.00-20.00"
    obj1 = SerialAvg(serial_no)
    with pytest.raises(Exception) as e:
        obj1.get_serial_avg()

def test_invalid_serial_no_case2():
    serial_no="002-F0.00-20.00"
    obj1 = SerialAvg(serial_no)
    with pytest.raises(Exception) as e:
        obj1.get_serial_avg()

def test_invalid_serial_no_case3():
    serial_no="0s2-10.00-J0.00"
    obj1 = SerialAvg(serial_no)
    with pytest.raises(Exception) as e:
        obj1.get_serial_avg()  

def test_invalid_serial_no():
    serial_no="0s2-10.000-20.0000"
    obj1 = SerialAvg(serial_no)
    with pytest.raises(Exception) as e:
        obj1.get_serial_avg()

def test_invalid_serial_no_case5():
    serial_no="-02-10.00-20.-0"
    obj1 = SerialAvg(serial_no)
    with pytest.raises(Exception) as e:
        obj1.get_serial_avg()

def test_invalid_serial_no_case4():
    serial_no="0s2-10.000-20.0000"
    obj1 = SerialAvg(serial_no)
    
    with pytest.raises(Exception) as e:
        obj1.get_serial_avg()
    
def test_valid_serial_no_case1():
    serial_no="002-10.00-20.00"
    obj1 = SerialAvg(serial_no)
    assert obj1.get_serial_avg()== "002-15.00"

def test_valid_serial_no_case2():
    serial_no="002-10.00-08.00"
    obj1 = SerialAvg(serial_no)
    assert obj1.get_serial_avg()== "002-09.00"

def test_valid_serial_no_case3():
    serial_no="002-00.00-00.00"
    obj1 = SerialAvg(serial_no)
    assert obj1.get_serial_avg()== "002-00.00"