##https://mirrors.aliyun.com/apache/spark/

docker build -t migle/spark .


docker run -t -i  migle/spark /bin/bash 

#启动master
#启动worker
1. 查找出master的ip地址
`docker inspect b6fc762b07ad |grep IPADD`  

2. 启动work容器
3. 进入窗口中启动worker
  spark-class org.apache.spark.deploy.worker.Worker spark://master_ip:7077


#启动master
 docker run --name=master -p 8080:8080 -p7077:7077 -p 6066:6066 -p 8081:8081 -i -t migle/spark

 #启动worker,可以启动多个
 docker run --link=master -i -t migle/spark
 spark-class org.apache.spark.deploy.worker.Worker spark://master:7077


macos中启动spark-shell连接
>> 10.10.10.100是virtualbox中的default的ip地址

spark-shell --master spark://10.10.10.100:7077


