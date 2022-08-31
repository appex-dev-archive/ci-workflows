import sys
from google.cloud import storage

project = sys.argv[1]

bucket_name = f'eu.artifacts.{project}.appspot.com'
directory_name = 'containers/images/'
count = 0

client = storage.Client()
bucket = client.get_bucket(bucket_name)
blobs = bucket.list_blobs(prefix=directory_name)

try:
    for blob in blobs:
        count += 1
        blob.delete()
        print(f'{blob.name} deleted successfully')
except Exception as err:
    sys.exit(err)

if count == 0:
    print("No objects to delete")
else:
    print(f'{count} deleted successfully')