variable "name" {
  description = "The name of ecs task famliy name"
}

variable "task_role_arn" {
  default     = ""
  description = "The ARN of IAM role that allows your Amazon ECS container task to make calls to other AWS services. "
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

variable "network_mode" {
  default     = "awsvpc"
  description = "The Docker networking mode to use for the containers in the task"
}

variable "requires_compatibilities" {
  default     = ["EC2"]
  description = "A set of launch types required by the task. The valid values are EC2 and FARGATE."
}

variable "repository_name" {
  description = "The name of the ECR Repository."
}

variable "memory" {
  default     = "512"
  description = "Hard memory of the container"
}

variable "cpu" {
  default     = "0"
  description = "Hard limit for CPU for the container"
}

variable "container_port" {
  default     = "80"
  description = "Port your container listens (used in the placeholder task definition)"
}

variable "host_port" {
  default     = "80"
  description = "The port number on the container instance to reserve for your container."
}

variable "protocol" {
  default     = "tcp"
  description = "The protocol used for the port mapping."
}

variable "entry_point" {
  default     = null
  description = "The entry point that is passed to the container."
}

variable "command" {
  default     = null
  description = "A string array representing the command that the container runs to determine if it is healthy."
}

variable "cluster_name" {
  description = "Name of existing ECS Cluster to deploy this app to"
}

variable "cloudwatch_logs_export" {
  default     = false
  description = "Whether to mark the log group to export to an S3 bucket (needs terraform-aws-log-exporter to be deployed in the account/region)"
}

variable "cloudwatch_logs_retention" {
  default     = 120
  description = "Specifies the number of days you want to retain log events in the specified log group. Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1827, and 3653."
}

variable "log_group" {
  description = "Log group name"
}

variable "container_definitions" {
  description = "A list of valid [container definitions] provided as a single valid JSON document."
}