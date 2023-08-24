#1/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl enable httpd
sudo systemctl start httpd
cat "<h1> MEOW MEOW </h3> " > /var/www/html/index.html
