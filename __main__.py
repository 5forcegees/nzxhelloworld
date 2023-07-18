"""An AWS Python Pulumi program"""

import pulumi
from pulumi_aws import s3

# Create an AWS resource (S3 Bucket)
bucket = s3.Bucket('my-bucket')

# Export the name of the bucket
pulumi.export('bucket_name', bucket.id)

from infrakit.utils import makevars


# --
# Using 'makevars' as a decorator will resolve each variable
# from the makefile.
@makevars
class Make:
    PROJECT = None
    AWS_REGION = None
    AWS_ACCOUNT = None
    ENVIRONMENT = None

print(Make.PROJECT)
print(Make.AWS_REGION)
print(Make.AWS_ACCOUNT)
print(Make.ENVIRONMENT)

# EOF
