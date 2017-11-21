######## VARIABLES#######

variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "private_key_path" {}
variable "key_name" {
  default = "collinsefe"
}

###### PROVIDERS#####

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "eu-west-1"
}

##### RESOURCES####

resource "aws_elastic_beanstalk_application" "myapp" {
  name        = "Tutorial_App"
  description = "Test of beanstalk deployment"
}

resource "aws_elastic_beanstalk_environment" "collins_green" {
  name                = "Tutorial-App-env1-green"
  application         = "${aws_elastic_beanstalk_application.myapp.name}"
  cname_prefix        = "agstechtutorialapp1green"

  solution_stack_name = "64bit Amazon Linux 2017.09 v2.7.1 running Tomcat 8 Java 8"

#64bit Amazon Linux 2017.03 v2.6.5 running Tomcat 8 Java 8"

}


resource "aws_elastic_beanstalk_environment" "collins_blue" {
  name                = "Tutorial-App-env1-blue"
  application         = "${aws_elastic_beanstalk_application.myapp.name}"
  cname_prefix        = "agstechtutorialapp1blue"

 solution_stack_name = "64bit Amazon Linux 2017.03 v2.6.5 running Tomcat 8 Java 8"

}

###### OUTPUT #####

output "cname-green" {
  value = "${aws_elastic_beanstalk_environment.collins_green.cname}"
}

output "cname-blue" {
  value = "${aws_elastic_beanstalk_environment.collins_blue.cname}"
}
