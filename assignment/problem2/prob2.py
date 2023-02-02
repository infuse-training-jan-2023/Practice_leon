
class CustomError(Exception):
    pass

class ArrayOperation:
    # def __init__(self, list):
    #     self.list= list

    
    def element_at(self , list , index=0):
        print(len(list))
        if index >= 0 and index < len(list):
            return list[index]
        else:
            raise CustomError("index out of bounds or invalid")
   
    def inclusive_range(self, arr , start_pos ,end_pos):

        if start_pos>= 0 and start_pos < len(arr) and end_pos>= 0 and end_pos < len(arr):     
            return arr[start_pos : end_pos+1]
        else:
            raise CustomError("index out of bounds")
 


    def non_inclusive_range(self ,arr , start_pos ,end_pos):

        if start_pos>= 0 and start_pos < len(arr) and end_pos>= 0 and end_pos < len(arr):     
            return arr[start_pos : end_pos]
        else:
            raise CustomError("index out of bounds")

    def start_and_length(seld ,arr , start_pos , length):
        if start_pos>= 0 and start_pos < len(arr):
            return arr[start_pos : start_pos+length]
        else:
            raise CustomError("index out of bounds")
    

            
# arr = [9, 5, 1, 2, 3, 4, 0, -1]

# obj= ArrayOperation()

# # print(obj.element_at(arr, 1))

# print(obj.non_inclusive_range(arr, 0 , 7 ))