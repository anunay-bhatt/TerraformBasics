provider "google" {

	credentials = "${file("../account.json")}"
	project = "my-project-2-213400"
	region = "us-west1"
}

provider "aws"{

	region = "us-west-2"

}

provider "azure"{

	presription_id = "0"
	client_id = "1"
	client_secret = "2"
	tenant_id = "3"
}