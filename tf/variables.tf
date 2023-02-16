variable "admin_policies" {
  description = "Attach the following admin policies"
  type        = list(string)
  default     = [
    "arn:aws:iam::aws:policy/SecretsManagerReadWrite", 
    "arn:aws:iam::aws:policy/IAMFullAccess", 
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/AmazonRDSDataFullAccess",
    "arn:aws:iam::aws:policy/AmazonECS_FullAccess",
    "arn:aws:iam::aws:policy/AmazonVPCFullAccess",
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
    "arn:aws:iam::aws:policy/AdministratorAccess",
    ]
}

### Static Values DON'T TOUCH -------------------
### ---------------------------------------------
variable "app_name" {
  type = string
}

variable "region" {
  type = string
}

variable "environment" {
  type        = string
  description = "dev, stg, prd"
}
### ---------------------------------------------