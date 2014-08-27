# Oracle JDK 8 base image

FROM jmarin/supervisor
MAINTAINER Juan Marin Otero <juan.marin.otero@gmail.com>

WORKDIR /opt/
RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u20-b26/jdk-8u20-linux-x64.rpm" 
RUN rpm -Uvh jdk-8u20-linux-x64.rpm

## java ##
RUN alternatives --install /usr/bin/java java /usr/java/latest/jre/bin/java 200000
## javaws ##
RUN alternatives --install /usr/bin/javaws javaws /usr/java/latest/jre/bin/javaws 200000
 
## Install javac only if you installed JDK (Java Development Kit) package ##
RUN alternatives --install /usr/bin/javac javac /usr/java/latest/bin/javac 200000
RUN alternatives --install /usr/bin/jar jar /usr/java/latest/bin/jar 200000

ENV JAVA_HOME /usr/bin/java
