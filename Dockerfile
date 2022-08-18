#This is a sample Image 
FROM ubuntu 
MAINTAINER jigyasu.mishra@volansys.com 

FROM ubuntu 
RUN apt update 
RUN apt install –y apache2 
RUN apt install –y apache2-utils 
RUN apt clean 
EXPOSE 80 CMD [“apache2ctl”, “-D”, “FOREGROUND”]
