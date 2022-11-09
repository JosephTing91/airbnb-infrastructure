resource "aws_instance" "web" {
    ami=    var.AMI_ID
    instance_type= var.instance_type
    tags= {
        Name="airbnb"
    }

}