resource "aws_iam_user" "kuber_user" {
  name = "-robot-eks-user"
  path = "/"

  tags = {
    Managed = "Terraform"
  }
}

resource "aws_iam_access_key" "kuber_user" {
  user    = aws_iam_user.kuber_user.name
  #pgp_key = "keybase:some_person_that_exists"
}

output "access_id" {
  description = "kuber_user.id"
  value = aws_iam_access_key.kuber_user.id
  sensitive = true
}
output "access_secret" {
  description = "kuber_user.secret"
  value = aws_iam_access_key.kuber_user.secret
  sensitive = true
}

output "aws_iam_smtp_password_v4" {
  description = "ault_user.ses_smtp_password_v4"
  value = aws_iam_access_key.kuber_user.ses_smtp_password_v4
  sensitive = true
}
