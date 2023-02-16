# ./vms/variables.tf

variable "bucket_id" {}

variable "bucket_name" {
    description = "the name to give the bucket"
}
variable "principals" {
    default     = ""
    description = "list of IAM user/role ARNs with access to the bucket"
}
