#This is a sample Image 
FROM ubuntu 
MAINTAINER jigyasu.mishra@volansys.com 

FROM ubuntu 
RUN apt update 
RUN apt install apache2 -y 
RUN apt install apache2-utils -y
RUN apt clean 
EXPOSE 80 
CMD [“/bin/sh”, “-D”, “FOREGROUND”]
