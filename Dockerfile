FROM openjdk:8-alpine
#FROM java:8-jdk-alpine
#RUN apt-get install default-jre -y
#RUN apt-get wget https://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
#RUN apt-get sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
#RUN apk update
#RUN apk install -y apache-maven

ENV MAVEN_VERSION 3.5.4
ENV MAVEN_HOME /usr/lib/mvn
ENV PATH $MAVEN_HOME/bin:$PATH

RUN wget http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz && \
  tar -zxvf apache-maven-$MAVEN_VERSION-bin.tar.gz && \
  rm apache-maven-$MAVEN_VERSION-bin.tar.gz && \
  mv apache-maven-$MAVEN_VERSION /usr/lib/mvn

#RUN echo mvn –v
RUN mvn clean package
RUN ls

RUN mv ./target/OpenShiftDemo* openshift.jar
CMD java -jar openshift.jar
EXPOSE 8080
