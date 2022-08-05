#This is a sample Image 
FROM ubuntu:latest
MAINTAINER jigyasu.mishra@volansys.com 
RUN apt update && apt install apache2 -y 
EXPOSE 80 CMD [“/usr/bin/apache2ctl”, “-D”, “FOREGROUND”]

