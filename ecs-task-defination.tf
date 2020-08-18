resource aws_ecs_task_definition "ecs" {
  family                   = var.name
  execution_role_arn       = aws_iam_role.ecs_task_excution.arn
  task_role_arn            = try(var.task_role_arn, null)
  network_mode             = var.network_mode
  cpu                      = var.cpu
  memory                   = var.memory
  requires_compatibilities = var.requires_compatibilities
  container_definitions    = var.container_definitions
}
