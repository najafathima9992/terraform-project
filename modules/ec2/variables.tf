variable "private_subnets" {
  description = "Private subnets for EC2"
  type        = list(string)
}

variable "db_endpoint" {
  description = "RDS endpoint"
  type        = string
}

variable "target_group_arn" {
  description = "ALB target group ARN"
  type        = string
}
variable "vpc_id" {
  description = "VPC ID"
  type        = string
}
variable "alb_sg_id" {
  type = string
}
