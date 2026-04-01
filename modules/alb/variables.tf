variable "public_subnets" {
  description = "Public subnets for ALB"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}
