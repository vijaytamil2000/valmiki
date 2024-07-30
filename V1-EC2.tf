provider "aws" {
    region ="us-east-2"
}

resource "aws_security_group" "demo_sg" {
    name = "demo_sg"
    description = "SSH Access"
    

    ingress {
        description ="SSH Access"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }

    egress {
        from_port=0
        to_port=0
        protocol="-1"
        cidr_blocks=["0.0.0.0/0"]

    }
    tags ={
        Name="ssh access"
    }
  
}

resource "aws_instance" "demo_server" {
    ami="ami-08be1e3e6c338b037"
    instance_type = "t2.large"
    key_name = "veeradpp"
    security_groups = [ "demo_sg" ]
    tags = {
        Name = "Veeratest"
    }
}


