resource aws_ecs_task_definition "ecs" {
  family                = var.name
  execution_role_arn    = aws_iam_role.ecs.arn
  task_role_arn         = try(var.task_role_arn, null)
  container_definitions = var.container_definitions
}
