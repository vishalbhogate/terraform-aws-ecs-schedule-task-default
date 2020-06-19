
data aws_ecs_cluster "ecs_cluster" {
  cluster_name = local.workspace["cluster_name"]
}

data aws_vpc "selected" {
  filter {
    name   = "tag:Name"
    values = ["${local.workspace["name"]}-VPC"]
  }
}

data aws_subnet_ids "private" {
  vpc_id = data.aws_vpc.selected.id

  filter {
    name   = "tag:Scheme"
    values = ["private"]
  }
}

data aws_security_group "security_group" {
  vpc_id = data.aws_vpc.selected.id
  name   = local.workspace["security_group_name"]
}

data aws_ecr_repository "selected" {
  name = local.workspace["repository_name"]
}

data "aws_cloudwatch_log_group" "selected" {
  name = local.workspace["awslogs_group"]
}