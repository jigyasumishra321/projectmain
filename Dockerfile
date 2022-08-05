#This is a sample Image 
FROM ubuntu:latest
MAINTAINER jigyasu.mishra@volansys.com 
RUN sudo apt update 
RUN sudo apt install apache2 -y  
EXPOSE 80 CMD [“apache2ctl”, “-D”, “FOREGROUND”]

