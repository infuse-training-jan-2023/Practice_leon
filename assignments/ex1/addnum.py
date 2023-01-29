import sys,os
 
# total argumentsos.getenv('arg1')
#n = len()
print("Total arguments passed:", os.getenv('arg1'))
 
# Arguments passed
print("\nName of Python script:", sys.argv[0])
sum= int(os.getenv('arg1'))+int(os.getenv('arg2'))
# Addition of 2 numbers
print("\n\nResult:",sum )