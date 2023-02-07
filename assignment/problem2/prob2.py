
class OutOfBound(Exception):
    pass

class ArrayOperation:

    def validate_index(self , index , arr):
        return index in range(0 , len(arr))
       
    def element_at(self , arr , index=0):
        # if index >= 0 and index < len(list):
        if self.validate_index(index , arr):
            return arr[index]
        else:
            raise OutOfBound("index out of bounds or invalid")
   
    def inclusive_range(self, arr , start_pos ,end_pos):
        if self.validate_index(start_pos , arr) and self.validate_index(end_pos , arr):     
            return arr[start_pos : end_pos+1]
        else:
            raise OutOfBound("index out of bounds")
 
    def non_inclusive_range(self ,arr , start_pos ,end_pos):

        if self.validate_index(start_pos ,arr) and self.validate_index(end_pos, arr):     
            return arr[start_pos : end_pos]
        else:
            raise OutOfBound("index out of bounds")

    def start_and_length(self ,arr , start_pos , length):
        if self.validate_index(start_pos , arr):
            return arr[start_pos : start_pos+length]
        else:
            raise OutOfBound("index out of bounds")
  
    