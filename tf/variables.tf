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