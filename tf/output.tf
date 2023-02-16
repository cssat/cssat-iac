# Copy this into the AWS_ACCOUNT_ID env var
output "aws_account_id" {
  value = data.aws_caller_identity.this.account_id
}

output "roles" {
  value = [
    "arn:aws:iam::${data.aws_caller_identity.this.account_id}:role/${aws_iam_role.uw_readonly.name},arn:aws:iam::${data.aws_caller_identity.this.account_id}:saml-provider/${aws_iam_saml_provider.this.name}",
    "arn:aws:iam::${data.aws_caller_identity.this.account_id}:role/${aws_iam_role.uw_poweruser.name},arn:aws:iam::${data.aws_caller_identity.this.account_id}:saml-provider/${aws_iam_saml_provider.this.name}",
  ]
}
