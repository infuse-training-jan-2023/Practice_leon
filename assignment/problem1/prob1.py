
import re

class InvalidSerialNo(Exception):
    pass

class SerialAvg:
    # def __init__(self, serial_no):
    #     self.serial_no= serial_no

    def get_serial_avg(self , serial_no):
        data = serial_no.split("-")  
        if not(re.search("[0-9]{3}-[0-9]{2}.[0-9]{2}-[0-9]{2}.[0-9]{2}", serial_no)):
            raise InvalidSerialNo("verify serial no")
        else:
            return f"{data[0]}-{(float(data[1])+float(data[2]))/2:05.2f}"
       