variable "linode_token" {}

provider "linode" {
  token = "${var.linode_token}"
}

data "linode_profile" "me" {}

resource "linode_instance" "backtest1" {
  label      = "backtest1"
  #group      = "foo"
  #tags = [ "foo" ]
  region     = "us-central"
  type       = "g6-nanode-1"
  #private_ip = true
  image = "linode/centos7"
  authorized_keys = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDDPJ90uNYEr1wQetej1ov4PZkRC8VkPLlo+gO+Mp+tAM20a39+Ra95xTymh0Eyp6sr/2yumhUr3ZnVRMnp/7aidn14zA8BrPi5hfDXqK9CvpTj7VCJNXZvls3VciZ+ygi1npzicJ0hNFYjAqeo2VMjDymmLLT6QCwiwiQyRzCrnYxG53tcgnuBg3Qk22sBW0XHxLG8sUOFgQib0IcfSNyBZF/1sE5oALyZ68epuARmvcATln7VvwnXmqAeOp7aJmKHeWcUHN424chHVL46l6MLA7j6oEepSCH3xEF88yiGsbYXi8IjojD9Tp91ssQeUyC7ye9IloPVePstfLZnrpB1"]
}

resource "linode_instance" "backtest2" {
  label      = "backtest2"
  #group      = "foo"
  #tags = [ "foo" ]
  region     = "us-central"
  type       = "g6-nanode-1"
  #private_ip = true
  image = "linode/centos7"
  authorized_keys = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDDPJ90uNYEr1wQetej1ov4PZkRC8VkPLlo+gO+Mp+tAM20a39+Ra95xTymh0Eyp6sr/2yumhUr3ZnVRMnp/7aidn14zA8BrPi5hfDXqK9CvpTj7VCJNXZvls3VciZ+ygi1npzicJ0hNFYjAqeo2VMjDymmLLT6QCwiwiQyRzCrnYxG53tcgnuBg3Qk22sBW0XHxLG8sUOFgQib0IcfSNyBZF/1sE5oALyZ68epuARmvcATln7VvwnXmqAeOp7aJmKHeWcUHN424chHVL46l6MLA7j6oEepSCH3xEF88yiGsbYXi8IjojD9Tp91ssQeUyC7ye9IloPVePstfLZnrpB1"]
}

resource "linode_instance" "backtest3" {
  label      = "backtest3"
  #group      = "foo"
  #tags = [ "foo" ]
  region     = "us-central"
  type       = "g6-nanode-1"
  #private_ip = true
  image = "linode/centos7"
  authorized_keys = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDDPJ90uNYEr1wQetej1ov4PZkRC8VkPLlo+gO+Mp+tAM20a39+Ra95xTymh0Eyp6sr/2yumhUr3ZnVRMnp/7aidn14zA8BrPi5hfDXqK9CvpTj7VCJNXZvls3VciZ+ygi1npzicJ0hNFYjAqeo2VMjDymmLLT6QCwiwiQyRzCrnYxG53tcgnuBg3Qk22sBW0XHxLG8sUOFgQib0IcfSNyBZF/1sE5oALyZ68epuARmvcATln7VvwnXmqAeOp7aJmKHeWcUHN424chHVL46l6MLA7j6oEepSCH3xEF88yiGsbYXi8IjojD9Tp91ssQeUyC7ye9IloPVePstfLZnrpB1"]
}

resource "linode_instance" "backtest4" {
  label      = "backtest4"
  #group      = "foo"
  #tags = [ "foo" ]
  region     = "us-central"
  type       = "g6-nanode-1"
  #private_ip = true
  image = "linode/centos7"
  authorized_keys = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDDPJ90uNYEr1wQetej1ov4PZkRC8VkPLlo+gO+Mp+tAM20a39+Ra95xTymh0Eyp6sr/2yumhUr3ZnVRMnp/7aidn14zA8BrPi5hfDXqK9CvpTj7VCJNXZvls3VciZ+ygi1npzicJ0hNFYjAqeo2VMjDymmLLT6QCwiwiQyRzCrnYxG53tcgnuBg3Qk22sBW0XHxLG8sUOFgQib0IcfSNyBZF/1sE5oALyZ68epuARmvcATln7VvwnXmqAeOp7aJmKHeWcUHN424chHVL46l6MLA7j6oEepSCH3xEF88yiGsbYXi8IjojD9Tp91ssQeUyC7ye9IloPVePstfLZnrpB1"]
}

resource "linode_instance" "backtest5" {
  label      = "backtest5"
  #group      = "foo"
  #tags = [ "foo" ]
  region     = "us-central"
  type       = "g6-nanode-1"
  #private_ip = true
  image = "linode/centos7"
  authorized_keys = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDDPJ90uNYEr1wQetej1ov4PZkRC8VkPLlo+gO+Mp+tAM20a39+Ra95xTymh0Eyp6sr/2yumhUr3ZnVRMnp/7aidn14zA8BrPi5hfDXqK9CvpTj7VCJNXZvls3VciZ+ygi1npzicJ0hNFYjAqeo2VMjDymmLLT6QCwiwiQyRzCrnYxG53tcgnuBg3Qk22sBW0XHxLG8sUOFgQib0IcfSNyBZF/1sE5oALyZ68epuARmvcATln7VvwnXmqAeOp7aJmKHeWcUHN424chHVL46l6MLA7j6oEepSCH3xEF88yiGsbYXi8IjojD9Tp91ssQeUyC7ye9IloPVePstfLZnrpB1"]
}

resource "linode_instance" "backtest6" {
  label      = "backtest6"
  #group      = "foo"
  #tags = [ "foo" ]
  region     = "us-central"
  type       = "g6-nanode-1"
  #private_ip = true
  image = "linode/centos7"
  authorized_keys = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDDPJ90uNYEr1wQetej1ov4PZkRC8VkPLlo+gO+Mp+tAM20a39+Ra95xTymh0Eyp6sr/2yumhUr3ZnVRMnp/7aidn14zA8BrPi5hfDXqK9CvpTj7VCJNXZvls3VciZ+ygi1npzicJ0hNFYjAqeo2VMjDymmLLT6QCwiwiQyRzCrnYxG53tcgnuBg3Qk22sBW0XHxLG8sUOFgQib0IcfSNyBZF/1sE5oALyZ68epuARmvcATln7VvwnXmqAeOp7aJmKHeWcUHN424chHVL46l6MLA7j6oEepSCH3xEF88yiGsbYXi8IjojD9Tp91ssQeUyC7ye9IloPVePstfLZnrpB1"]
}