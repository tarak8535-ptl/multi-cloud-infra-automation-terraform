resource "aws_dynamodb_table" "terraform_locks" {
  name         = "${var.prefix}-terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = var.tags

  point_in_time_recovery {
    enabled = true
  }
}