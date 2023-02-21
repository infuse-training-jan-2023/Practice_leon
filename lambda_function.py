import json
import boto3
import datetime;

print('Loading function')


def lambda_handler(event, context):

    current_time = datetime.datetime.now()  
    s3 = boto3.resource('s3') 
    object = s3.Object(
        bucket_name='infuse-aws-bucket', 
        key=f'invoke_logs/{current_time.strftime("%c")}.txt'
    )
    
    object.put(Body=f'lab invoke timestamp at : {current_time.strftime("%c")}')

    return {
        "statusCode": 200,
        "headers": {
            "Content-Type": "application/json"
        },
        "body": json.dumps({
            "msg ": "timestamp recorded to s3 bucket"
        })
    }