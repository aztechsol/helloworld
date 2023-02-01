variable "ecr_name" {
  description = "The list of ecr names to create"
  type        = list(string)
  default     = null
}
variable "tags" {
  description = "The key-value maps for tagging"
  type        = map(string)
  default     = {}
}

variable "image_tag_mutability" {
  description = "Provide image tag mutability"
  type        = string
  default     = "MUTABLE"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}
