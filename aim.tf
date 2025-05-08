resource "aws_iam_role" "eks_ci_role" {
  name = "${local.name_prefix}-eks-ci-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy" "eks_ci_permissions" {
  name = "${local.name_prefix}-eks-ci-policy"
  role = aws_iam_role.eks_ci_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "EKSAndEC2LaunchTemplate",
        Effect = "Allow",
        Action = [
          "eks:CreateCluster",
          "eks:CreateNodegroup",
          "eks:DescribeNodegroup",
          "eks:UpdateNodegroupConfig",
          "eks:DeleteNodegroup",
          "eks:UpdateNodegroupVersion",
          "eks:DescribeCluster",
          "ec2:RunInstances",
          "ec2:DescribeInstances",
          "ec2:DescribeLaunchTemplateVersions",
          "ec2:CreateLaunchTemplate",
          "ec2:CreateLaunchTemplateVersion",
          "ec2:DeleteLaunchTemplate",
          "ec2:DeleteLaunchTemplateVersions",
          "iam:GetRole",
          "iam:PassRole"
        ],
        Resource = "*"
      }
    ]
  })
}
