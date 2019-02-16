resource "google_compute_network" "my_network"{
	name = "dev"
	auto_create_subnetworks = "true"

}

resource "aws_vpc" "example2"{
	
	cidr_block = "10.0.0.0/16"

}

resource "aws_vpc" "example3"{
	
	cidr_block = "10.0.0.0/16"

}