FROM centos:7
MAINTAINER migle <longforfreedom@gmail.com>

# install oracle jdk 8
RUN curl -LO --insecure --junk-session-cookies --location --remote-name --silent \
    --header "Cookie: oraclelicense=accept-securebackup-cookie" \
        http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm && \ 
        yum localinstall -y jdk-8u131-linux-x64.rpm && \
        yum clean all && \
        rm jdk-8u131-linux-x64.rpm

ENV JAVA_HOME /usr/java/default





#todo:download from spark website
COPY ./spark-1.6.3-bin-hadoop2.6.tgz /opt

WORKDIR /opt
RUN tar xfvz /opt/spark-1.6.3-bin-hadoop2.6.tgz
RUN rm -r /opt/spark-1.6.3-bin-hadoop2.6.tgz

# Set home
ENV SPARK_HOME=/opt/spark-1.6.3-bin-hadoop2.6

#set spark/bin
ENV PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin

# Ports
EXPOSE 6066 7077 8080 8081


