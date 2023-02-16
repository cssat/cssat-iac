data "aws_caller_identity" "this" {}

# This will be the assume role policy for all SSO roles
data "aws_iam_policy_document" "this" {
  statement {
    actions = ["sts:AssumeRoleWithSAML"]
    principals {
      type        = "Federated"
      identifiers = [aws_iam_saml_provider.this.arn]
    }
    condition {
      test     = "StringEquals"
      variable = "SAML:aud"
      values   = ["https://signin.aws.amazon.com/saml"]
    }
  }
}

# The SAML provider for the account needs the IdP's metadata
# This only contains the public key and is OK to check in
resource "aws_iam_saml_provider" "this" {
  name                   = "UW"
  saml_metadata_document = file("${path.module}/idp-metadata.xml")
}

# Role definitions

resource "aws_iam_role" "cssat-data-engineer" {
  name               = "cssat-data-engineer"
  assume_role_policy = data.aws_iam_policy_document.this.json
}

resource "aws_iam_role_policy_attachment" "cssat-data-engineer" {
  role       = aws_iam_role.cssat-data-engineer.name
  policy_arn = "arn:aws:iam::aws:policy/cssat-data-engineer-policy"
}

resource "aws_iam_role" "cssat-aws-admin" {
  name               = "cssat-aws-admin"
  assume_role_policy = data.aws_iam_policy_document.this.json
}

resource "aws_iam_role_policy_attachment" "cssat-aws-admin" {
  role       = aws_iam_role.cssat-aws-admin.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSFullAccess"
}

resource "aws_iam_role_policy_attachment" "cssat-aws-admin" {
  role       = aws_iam_role.cssat-aws-admin.name
  policy_arn = "arn:aws:iam::aws:policy/SecretsManagerReadWrite"
}

resource "aws_iam_role_policy_attachment" "cssat-aws-admin" {
  role       = aws_iam_role.cssat-aws-admin.name
  policy_arn = "arn:aws:iam::aws:policy/IAMFullAccess"
}

resource "aws_iam_role_policy_attachment" "cssat-aws-admin" {
  role       = aws_iam_role.cssat-aws-admin.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_role_policy_attachment" "cssat-aws-admin" {
  role       = aws_iam_role.cssat-aws-admin.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_role_policy_attachment" "cssat-aws-admin" {
  role       = aws_iam_role.cssat-aws-admin.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSDataFullAccess"
}

resource "aws_iam_role_policy_attachment" "cssat-aws-admin" {
  role       = aws_iam_role.cssat-aws-admin.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonECS_FullAccess"
}

resource "aws_iam_role_policy_attachment" "cssat-aws-admin" {
  role       = aws_iam_role.cssat-aws-admin.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
}
