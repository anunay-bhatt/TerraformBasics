provider "google" {

	credentials = "${file("../account.json")}"
	project = "my-project-2-213400"
	region = "us-west1"
}

provider "aws"{

	region = "us-west-2"

}