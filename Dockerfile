FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y

RUN apt-get install apache2 -y

#COPY  /home/ubuntu/demoproj/JenkinsDemo/index.html  /var/www/html

CMD apachectl -D FOREGROUND


#FROM tomcat:8.0.20-jre8
#RUN sed -i '/<\/tomcat-users>/ i\<user username="admin" password="admin" roles="admin-gui,manager-gui"/>' /usr/local/tomcat/conf/tomcat-users.xml
#COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
#COPY maven-web-application.war /usr/local/tomcat/webapps/maven-web-application.war
