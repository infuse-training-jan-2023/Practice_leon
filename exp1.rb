
def serial_average_calculator(serialNo)
    serialNoArray = serialNo.split('-')
   
    average = (serialNoArray[1].to_f + serialNoArray[2].to_f)/2
   
    return serialNoArray[0]+"-"+"%05.2f"%average
    
    
end


serialNo = "002-10.00-08.00"

puts "INPUT = " + serialNo

puts serial_average_calculator(serialNo)