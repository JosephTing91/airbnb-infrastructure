resource "aws_instance" "web" {
    ami=    var.AMI_ID
    instance_type= var.instance_type
    monitoring= true
    root_block_device {
    encrypted     = true
    }
     metadata_options {
       http_endpoint = "enabled"
       http_tokens   = "required"
    }
    tags= {
        Name="airbnb-poo"
    }

}