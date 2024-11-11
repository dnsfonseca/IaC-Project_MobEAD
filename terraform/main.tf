resource "aws_security_group" "sg" {
  name        = "allow_rdp_winrm"
  description = "Security group para RDP e WINRM"

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5986
    to_port     = 5986
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_rdp_winrm"
  }
}

resource "aws_instance" "windows_vm" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg.id]

  user_data = <<EOF
<powershell>
$adminPassword = ConvertTo-SecureString "${var.admin_password}" -AsPlainText -Force
$adminUser = [ADSI]"WinNT://./Administrator,User"
$adminUser.SetPassword($adminPassword)
</powershell>
EOF

  tags = {
    Name = "IaC-Windows-Server"
  }
}

