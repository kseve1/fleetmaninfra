#
# EKS Cluster Resources
#  * IAM Role to allow EKS service to manage other AWS services
#  * EC2 Security Group to allow networking traffic with EKS cluster
#  * EKS Cluster
#

resource "aws_iam_role" "Blue-team-PROD-terraform-eks-cluster" {
  name = "Blue-team-PROD-terraform-eks-cluster"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "Blue-team-PROD-terraform-eks-cluster-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = "${aws_iam_role.Blue-team-PROD-terraform-eks-cluster.name}"
}

resource "aws_iam_role_policy_attachment" "Blue-team-PROD-terraform-eks-cluster-AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = "${aws_iam_role.Blue-team-PROD-terraform-eks-cluster.name}"
}

resource "aws_security_group" "Blue-team-PROD-terraform-eks-cluster-sg" {
  name        = "Blue-team-PROD-terraform-eks-cluster"
  description = "Cluster communication with worker nodes"
  vpc_id      = "${aws_vpc.eks-vpc.id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Blue-team-PROD-terraform-eks-cluster"
  }
}

resource "aws_security_group_rule" "Blue-team-PROD-terraform-eks-cluster-ingress-node-https" {
  description              = "Allow pods to communicate with the cluster API Server"
  from_port                = 443
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.Blue-team-PROD-terraform-eks-cluster-sg.id}"
  source_security_group_id = "${aws_security_group.Blue-team-PROD-terraform-eks-node-sg.id}"
  to_port                  = 443
  type                     = "ingress"
}

resource "aws_security_group_rule" "Blue-team-PROD-terraform-eks-cluster-ingress-workstation-https" {
  #cidr_blocks       = ["${local.workstation-external-cidr}"]
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allow workstation to communicate with the cluster API Server"
  from_port         = 443
  protocol          = "tcp"
  security_group_id = "${aws_security_group.Blue-team-PROD-terraform-eks-cluster-sg.id}"
  to_port           = 443
  type              = "ingress"
}

resource "aws_eks_cluster" "Blue-team-PROD-terraform-eks-cluster" {
  name     = "${var.cluster-name}"
  role_arn = "${aws_iam_role.Blue-team-PROD-terraform-eks-cluster.arn}"

  vpc_config {
    security_group_ids = ["${aws_security_group.Blue-team-PROD-terraform-eks-cluster-sg.id}"]
    subnet_ids         = "${aws_subnet.eks-vpc-subnet[*].id}"
  }

  depends_on = [
    "aws_iam_role_policy_attachment.Blue-team-PROD-terraform-eks-cluster-AmazonEKSClusterPolicy",
    "aws_iam_role_policy_attachment.Blue-team-PROD-terraform-eks-cluster-AmazonEKSServicePolicy",
  ]
}
