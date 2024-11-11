variable "aws_region" {
	default = "us-east-1"
}

variable "ami_id" {
	description = "ami-073e3b46f8802d31b"
}

variable "instance_type" {
	default = "t2.micro"
}

variable "key_name" {
	description = "my-key-pair-projectMobEADUnyleya"
}

variable "admin_password" {
	description = "0177"
	sensitive = true
}
