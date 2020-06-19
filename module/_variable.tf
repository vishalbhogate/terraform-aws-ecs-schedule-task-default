locals {
  env = {
    default = {
      cluster_name        = "microservices-cluster"
      name                = "uat"
      task_family_name    = "ms-crm-queue"
      security_group_name = "ms-crm-sg"
      schedule_expression = "cron(0/3 * * * ? *)"
      task_count          = "1"
      task_definition_arn = "arn:aws:ecs:ap-southeast-2:904761875964:task-definition/ms-crm-queue"
      aws_account_id      = 904761875964
      aws_role            = "AdminRoleForOrganizations"
      task_role_arn       = "arn:aws:iam::904761875964:role/ECSTaskSQSRole"
      repository_name     = "services/crm"
      entry_point         = "php"
      command             = "/var/www/html/bin/scheduler.php"
      awslogs_group       = "/ecs/services/crm"
    }
  }

  workspace = local.env[terraform.workspace]
}