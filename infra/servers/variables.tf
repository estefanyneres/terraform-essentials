variable "image_id"{
  default     = "ami-123456789"
  type        = string
  description = "value of the AMI ID to use for the EC2 instance"

  validation {
    condition     = length(var.image_id) > 4 && substr(var.image_id, 0, 4) == "ami-"
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  }
}

variable "availability_zone_names" {
  default     = ["us-east-1a", "us-west-1c"]
  type        = list(string)
  description = "List of availability zone names to use for the EC2 instance"
}

variable "servers" {
}