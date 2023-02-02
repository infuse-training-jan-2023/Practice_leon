
import re

class CustomError(Exception):
    pass

class SerialAvg:
    def __init__(self, serial_no):
        self.serial_no= serial_no

    def get_serial_avg(self):
        data = self.serial_no.split("-")  
        if not(re.search("[0-9]{3}-[0-9]{2}.[0-9]{2}-[0-9]{2}.[0-9]{2}", self.serial_no)):
            raise CustomError("verify serial no")
        else:
            return f"{data[0]}-{(float(data[1])+float(data[2]))/2:05.2f}"
       
            
# serial="002-10.00-20.00"

# obj= SerialAvg(serial)

# print(obj.get_serial_avg())