FROM openjdk:8-alpine
#FROM java:8-jdk-alpine
#RUN apt-get install default-jre -y
#RUN apt-get wget https://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
#RUN apt-get sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
RUN yum install -y apache-maven
RUN mvn –version
RUN mvn clean package
RUN mv ./target/OpenShiftDemo* openshift.jar
CMD java -jar openshift.jar
EXPOSE 8080
