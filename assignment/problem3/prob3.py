
class CustomError(Exception):
    pass

class SportsArray:

   def skip_sports(self ,sports_array , skipLen):
    if  skipLen <=len(sports_array) and skipLen >=0 :
        return sports_array[skipLen : len(sports_array)]  
    else:
        raise CustomError("index out of bounds or invalid")
    