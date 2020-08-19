resource aws_cloudwatch_event_rule "ecs" {
  name                = "ecs-schedule-task-${var.name}"
  description         = "ECS Schedule Task"
  schedule_expression = var.schedule_expression
  is_enabled          = true

  lifecycle {
    create_before_destroy = true
  }
}

resource aws_cloudwatch_event_target "ecs" {
  target_id = "ecs-scheduled-id-${var.name}"
  arn       = var.cluster_arn
  rule      = aws_cloudwatch_event_rule.ecs.name
  role_arn  = var.ecs_events_role_arn != "" ? join(",", var.ecs_events_role_arn, aws_iam_role.ecs.arn) : aws_iam_role.ecs.arn

  ecs_target {
    launch_type         = var.launch_type
    task_count          = tonumber("${var.task_count}")
    task_definition_arn = var.task_definition_arn

    network_configuration {
      subnets          = var.subnet_ids
      security_groups  = var.security_groups
      assign_public_ip = var.assign_public_ip
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}