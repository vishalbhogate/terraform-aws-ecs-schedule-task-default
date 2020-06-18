module "ecs-schdule-task" {
  source                = "../"
  cluster_arn           = data.aws_ecs_cluster.ecs_cluster.arn
  name                  = local.workspace["task_family_name"]
  private_subnets       = data.aws_subnet_ids.private.ids
  schedule_expression   = local.workspace["schedule_expression"]
  task_definition_arn   = local.workspace["task_definition_arn"]
  security_groups       = [data.aws_security_group.security_group.id]
  task_count            = local.workspace["task_count"]
  container_definitions = file("${path.module}/test.json")
  task_role_arn         = local.workspace["task_role_arn"]
}


