provider aws {
    region = var.region
}

resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
}

variable ami_id {
  type        = string
  description = "Provide ami id"
  default = ""
}

variable instance_type {
  type        = string
  description = "Provide insantce type"
  default = ""
}

variable region {
  type        = string
  default     = "us-east-2"
  description = ""
}

