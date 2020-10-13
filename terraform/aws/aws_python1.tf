variable "aws_access_key" {}
variable "aws_secret_key" {}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"

}

resource "aws_key_pair" "wraith2" {
  key_name = "wraith2"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDDPJ90uNYEr1wQetej1ov4PZkRC8VkPLlo+gO+Mp+tAM20a39+Ra95xTymh0Eyp6sr/2yumhUr3ZnVRMnp/7aidn14zA8BrPi5hfDXqK9CvpTj7VCJNXZvls3VciZ+ygi1npzicJ0hNFYjAqeo2VMjDymmLLT6QCwiwiQyRzCrnYxG53tcgnuBg3Qk22sBW0XHxLG8sUOFgQib0IcfSNyBZF/1sE5oALyZ68epuARmvcATln7VvwnXmqAeOp7aJmKHeWcUHN424chHVL46l6MLA7j6oEepSCH3xEF88yiGsbYXi8IjojD9Tp91ssQeUyC7ye9IloPVePstfLZnrpB1 evan@wraith2-ubuntu"
}

resource "aws_security_group_rule" "admin_rules" {
  type            = "ingress"
  from_port       = 22
  to_port         = 22
  protocol        = "tcp"
  # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
  cidr_blocks = '*sanitized*'# add a CIDR block here
 # prefix_list_ids = ["pl-12c4e678"]

  security_group_id = "sg-admin1"
}

resource "aws_instance" "example" {
  #centos
  #ami           = "ami-02eac2c0129f6376b"
  # Amazon Linux
  ami = "ami-0de53d8956e8dcf80"
  instance_type = "t2.micro"
  key_name = "wraith2"
}
