resource aws_iam_role "ecs" {
  name               = "ecs-cw-rule-${var.cluster_name}-${data.aws_region.current.name}"
  assume_role_policy = data.aws_iam_policy_document.ecs_assume.json

  lifecycle {
    create_before_destroy = true
  }
}

resource aws_iam_role_policy_attachment "ecs_policy" {
  role       = aws_iam_role.ecs.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceEventsRole"
}