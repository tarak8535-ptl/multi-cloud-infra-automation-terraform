resource "aws_cloudwatch_log_group" "vpc_flow_logs" {
  name              = "/aws/${var.resource_prefix}/vpc/flow-logs"
  retention_in_days = var.log_retention_days
  kms_key_id        = module.kms.key_id
  tags              = var.tags
}

resource "aws_iam_role" "vpc_flow_logs" {
  name = "${var.resource_prefix}-vpc-flow-logs-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "vpc-flow-logs.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
  tags = var.tags
}

resource "aws_iam_role_policy" "vpc_flow_logs" {
  name = "${var.resource_prefix}-vpc-flow-logs-policy"
  role = aws_iam_role.vpc_flow_logs.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams"
      ]
      Resource = "*"
    }]
  })
}

resource "aws_flow_log" "rejects" {
  log_destination_type = "cloud-watch-logs"
  log_destination      = aws_cloudwatch_log_group.vpc_flow_logs.arn
  iam_role_arn         = aws_iam_role.vpc_flow_logs.arn
  vpc_id               = module.vpc.vpc_id
  traffic_type         = "REJECT"
  tags                 = var.tags
}
