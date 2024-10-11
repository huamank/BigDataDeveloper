FROM bde2020/hadoop-datanode:2.0.0-hadoop2.7.4-java8
ENV HADOOP_HOME=/opt/hadoop-2.7.4
ENV SQOOP_HOME=/usr/local/sqoop
ENV PATH=$PATH:$HADOOP_HOME/bin:$SQOOP_HOME/bin
WORKDIR /datanode
RUN rm /opt/hadoop-2.7.4/share/hadoop/common/lib/avro-1.7.4.jar
COPY jdbc/org.json-20120521.jar /opt/hadoop-2.7.4/share/hadoop/common/lib
COPY jdbc/avro-1.8.1.jar /opt/hadoop-2.7.4/share/hadoop/common/lib
COPY jdbc/org.json-20120521.jar /usr/local/sqoop/lib/

