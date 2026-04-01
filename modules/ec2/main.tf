# Security Group for EC2
resource "aws_security_group" "ec2_sg" {
  name        = "ec2-sg"
  description = "Allow HTTP"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # In real prod, allow only ALB SG
    security_groups = [var.alb_sg_id] 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_launch_template" "app" {
   name_prefix = "app-"
   image_id = "ami-09e973f123c32cf86"
   instance_type = "t3.micro"

   user_data = base64encode(<<EOF
   #!/bin/bash
# Install Apache, PHP, MySQL client
   dnf install -y httpd php php-mysqlnd

# Start Apache
   systemctl start httpd
   systemctl enable httpd

# Download WordPress
   cd /var/www/html
   wget https://wordpress.org/latest.tar.gz
   tar -xzf latest.tar.gz
   mv wordpress/* .
   rm -rf wordpress latest.tar.gz

# Permissions
   chown -R apache:apache /var/www/html

# Create wp-config
   cp wp-config-sample.php wp-config.php

# Configure DB (replace with RDS endpoint)
   sed -i "s/database_name_here/ecommerce/g" wp-config.php
   sed -i "s/username_here/admin/g" wp-config.php
   sed -i "s/password_here/password123/g" wp-config.php
   sed -i "s/localhost/${var.db_endpoint}/g" wp-config.php

# Restart Apache
   systemctl restart httpd

   EOF
   )
}

resource "aws_autoscaling_group" "asg" {
  desired_capacity = 2
  max_size = 3
  min_size = 1
  vpc_zone_identifier = var.private_subnets

  launch_template {
    id = aws_launch_template.app.id
    version = "$Latest"
  }
  target_group_arns = [var.target_group_arn]

  health_check_type = "EC2"
}
