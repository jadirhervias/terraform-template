// EC2 instance
resource "aws_instance" "auth_service_demo" {
  ami = var.ami_id
  # ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  tags          = var.instance_tags
  # For connect remotely to my AWS instances (key is store in my AWS account)
  # key_name        = var.key_name
  security_groups = ["${aws_security_group.allow_tls.name}"]
  user_data       = file(var.bootstrap)
}

// Security Group to connect via ssh by the 22 port
resource "aws_security_group" "allow_tls" {
  name        = var.sg_name
  description = var.sg_description
  # vpc_id      = aws_vpc.main.id
  tags = var.sg_tags
  // Resource for loop -> 'dynamic <Resource_Name>'
  dynamic "ingress" {
    for_each = var.sg_ingress_rules
    content {
      description = ingress.value.from_port
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
      # cidr_blocks = [aws_vpc.main.cidr_block]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "instance_ip" { value = aws_instance.auth_service_demo.*.public_ip }
