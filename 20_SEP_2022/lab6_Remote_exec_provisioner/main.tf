provider "aws"{
    region = "us-east-1"
}


resource "aws_instance" "myawsserver" {
  ami = "ami-05fa00d4c63e32376"
  instance_type = "t2.micro"
  key_name = "mohini-import"
  provisioner "remote-exec" {
    inline = [
      "touch /tmp/mohini",
      "sudo mkdir /root/mohini",
      "sudo yum install -y httpd"
     ]
   connection {
    type     = "ssh"
    user     = "ec2-user"
    insecure = "true"
    private_key = "${file("/home/ec2-user/.ssh/id_rsa")}"
    host     =  aws_instance.myawsserver.public_ip
   }
 }
}
