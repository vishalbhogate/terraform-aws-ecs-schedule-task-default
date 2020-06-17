variable "name" {
  description = "The name of ecs task famliy name"
}

variable "schedule_expression" {
  description = "The scheduling expression.For example, `cron(0 20 * * ? *)` or `rate(5 minutes)`."
}

variable "cluster_arn" {
  description = "ARN of an ECS cluster."
}

variable "task_definition_arn" {
  description = "The ARN of the task definition to use if the event target is an Amazon ECS cluster."
}

variable "private_subnets" {
  description = "The subnets associated with the task or service."
}

variable "task_count" {
  default     = 1
  description = "The number of tasks to create based on the TaskDefinition."
}

variable "assign_public_ip" {
  default     = false
  description = "Assign a public IP address to the ENI (Fargate launch type only)."
}

variable "security_groups" {
  default     = [""]
  type        = list(string)
  description = "The security groups associated with the task or service."
}

variable "ecs_events_role_arn" {
  default     = ""
  type        = string
  description = "The ARN of the CloudWatch Events IAM Role."
}

variable "launch_type" {
  default     = "EC2"
  type        = string
  description = "A set of launch types required by the task. The valid values are EC2 and FARGATE."
}