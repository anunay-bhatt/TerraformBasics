resource "google_compute_network" "my_network"{
	name = "dev"
	auto_create_subnetworks = "false"
}

resource "aws_vpc" "example2"{

	cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet1"{
	cidr_block = "${cidrsubnet(aws_vpc.example2.cidr_block,3,1)}"
	vpc_id = "${aws_vpc.example2.id}"
	availability_zone = "us-west-2a"
}

resource "aws_subnet" "subnet2"{
	cidr_block = "${cidrsubnet(aws_vpc.example2.cidr_block,2,2)}"
	vpc_id = "${aws_vpc.example2.id}"
	availability_zone = "us-west-2b"
}

resource "aws_security_group" "subnet_security"{
	vpc_id = "${aws_vpc.example2.id}"
	
	ingress {
	cidr_blocks =[
		"${aws_vpc.example2.cidr_block}"
	]
	from_port = 95
	to_port = 109
	protocol = "tcp"
	}
}

resource "azurerm_resource_group" "az_network"{
	location = "West US"
	name = "dev"
}

resource "azurerm_virtual_network" "az_vnet"{
	address_space = ["10.0.0.0/16"]
	location = "West US"
	name = "dev"
	resource_group_name = "${azurerm_resource_group.az_network.name}"
	
	subnet = {
		name = "subnet1"
		address_prefix = "10.0.1.0/24"
	}

	subnet = {
		name = "subnet2"
		address_prefix = "10.0.2.0/24"
	}	
}


