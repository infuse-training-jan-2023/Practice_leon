import sys,os,json

print("Total arguments passed:", os.getenv('arg1'))
 
# Arguments passed
print("\nName of Python script:", sys.argv[0])
sum= int(os.getenv('arg1'))+int(os.getenv('arg2'))
# Addition of 2 numbers
print("\n\nResult:",sum )


x =  '{ "name":"John", "age":30, "city":"New York"}'

y = json.loads(x)

print(y["age"])
