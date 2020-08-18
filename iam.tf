resource aws_iam_role "ecs" {
  name               = "ecs-schedule-task-role-${var.name}"
  assume_role_policy = data.aws_iam_policy_document.ecs_assume.json

  lifecycle {
    create_before_destroy = true
  }
}

resource aws_iam_role_policy_attachment "ecs_policy" {
  role       = aws_iam_role.ecs.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceEventsRole"
}

resource aws_iam_role "ecs_task_excution" {
  name               = "ecs-task-role-${var.name}"
  assume_role_policy = data.aws_iam_policy_document.ecs_task_assume.json
}

resource aws_iam_role_policy_attachment "ecs_task_policy" {
  role       = aws_iam_role.ecs_task_excution.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource aws_iam_role_policy_attachment "ecs_task_policy_ssm" {
  role       = aws_iam_role.ecs_task_excution.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMReadOnlyAccess"
}