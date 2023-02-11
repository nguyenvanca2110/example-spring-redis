#base image
FROM centos:7
#Label information
LABEL author=lsy
#Set the variable and refer to it directly later
ENV path=/usr/soft
#Create directory
RUN mkdir ${path}
#Set working directory
WORKDIR ${path}
#Put the jdk installation package into the directory in the container, and this command will automatically decompress
ADD jdk-8u191-linux-x64.tar.gz ${path}
#Setting up container java environment
ENV JAVA_HOME=${path}/jdk1.8.0_191
ENV CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV PATH=$JAVA_HOME/bin:$PATH
#Copy the web application jar package to the directory
COPY k8s_demo-1.0.jar ${path}
#Exposed port 8080
EXPOSE 8080
#Run the command when the container is just started
CMD  java -jar -DredisIp=10.109.56.243 k8s_demo-1.0.jar