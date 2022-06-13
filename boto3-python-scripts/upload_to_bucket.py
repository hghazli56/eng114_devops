import boto3

s3 = boto3.client('s3')

s3.upload_file(
    Filename="test.txt",
    Bucket="eng114-hamza-bucket",
    Key="test.txt"
)
