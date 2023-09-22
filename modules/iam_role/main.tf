// IAM Policy
data "aws_iam_policy" "ssm-role" {
  arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
}

// Create an IAM Role
resource "aws_iam_role" "ec2_role" {
  name = "${var.env}-EC2-role-for-SSM"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "RoleForEC2"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}


resource "aws_iam_policy_attachment" "policy-attach" {
  name       = "${var.env}-policy-attachment"
  roles      = [aws_iam_role.ec2_role.name]
  policy_arn = data.aws_iam_policy.ssm-role.arn

}

resource "aws_iam_instance_profile" "dg-instance-profile" {
  name = "${var.env}-instance-profile"
  role = aws_iam_role.ec2_role.name
}


output "instance_profile" {
  value = aws_iam_instance_profile.dg-instance-profile.name
}

output "instance_profile_arn" {
  value = aws_iam_instance_profile.dg-instance-profile.arn
}
