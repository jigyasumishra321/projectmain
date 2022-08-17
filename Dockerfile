FROM centos

MAINTAINER jigyasu.mishra@volansys.com

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -OL https://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.40/bin/apache-tomcat-8.5.40.tar.gz
RUN tar zxf apache*.tar.gz
RUN mv apache-tomcat-8.5.40/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

WORKDIR /opt/tomcat/webapps
RUN curl -O -L https://github.com/jigyasumishra321/projectmain.git

EXPOSE 8080



CMD ["/opt/tomcat/bin/catalina.sh", "run"]

