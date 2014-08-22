S3DirectUpload.config do |c|
  c.access_key_id = "AKIAJSN4ID3STTVA3DBA"       # your access key id
  c.secret_access_key = "qhMeqoQjlP+cMf/QLB6qgv7d7lNfXneG0uttxsxa"   # your secret access key
  c.bucket = "sflforms"              # your bucket name
  c.region = "s3-website-eu-west-1.amazonaws.com"             # region prefix of your bucket url. This is _required_ for the non-default AWS region, eg. "s3-eu-west-1"
  c.url = nil                # S3 API endpoint (optional), eg. "https://#{c.bucket}.s3.amazonaws.com/"
end