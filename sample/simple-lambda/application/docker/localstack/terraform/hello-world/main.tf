provider "aws" {
  region     = "us-east-1"
  access_key = "local_access_key"
  secret_key = "local_secret_key"

  skip_credentials_validation = true
  skip_region_validation      = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true

  endpoints {
    lambda = "http://localhost:4566"
  }
}

resource "aws_lambda_function" "hello-world-lambda" {
  function_name = "HelloWorldFunction"
  filename      = "./zip/function.zip"
  role          = "arn:aws:iam::000000000000:role/lambda-role"
  runtime       = "nodejs20.x"
  handler       = "index.handler"
  timeout       = 60
  memory_size   = 128
}