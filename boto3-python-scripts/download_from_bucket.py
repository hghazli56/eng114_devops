import boto3

s3 = boto3.client('s3')

s3.download_file(
    Bucket="eng114-hamza-bucket", Key="test.txt", Filename="test.txt"
)
