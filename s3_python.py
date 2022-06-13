import boto3

s3 = boto3.client('s3')

s3.create_bucket(Bucket='eng114-hamza-bucket', CreateBucketConfiguration={
    'LocationConstraint': 'eu-west-1'})

s3.upload_file(
    Filename="files/test2.txt",
    Bucket="eng114-hamza-bucket",
    Key="test2.txt"
)

s3.download_file(
    Bucket="eng114-hamza-bucket", Key="test.txt", Filename="test.txt"
)

# Use boto3.resource for this
s3.Object('eng114-hamza-bucket', 'test.txt').delete()


s3 = boto3.resource('s3')
bucket = s3.Bucket('eng114-hamza-bucket')
bucket.delete()






