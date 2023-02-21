Q1) Create an S3 bucket for storing logs 

    console
    open services and select amazon s3
    create bucket
    add bucket name,aws region, use default settings, create bucket

Q2)Create a Lambda function to log each invocation with the timestamp to the created S3 bucket.

    console
    open services and select amazon lambda
    create function, add function name, add python runtime, create function
    under code tab add the lambda code.
    create new test event and test lambda function
    for accessing s3 add permisions
    ->configuration-> permisions-> add execution role-> go to execution role-> add permision -> attach policies ->add required policy for s3.

Q3)Create an API in API Gateway and link it to the above created lambda, so that you can invoke the lambda function via curl command/postman or programmatically. 

    add api gateway trigger.
    use url in postman.