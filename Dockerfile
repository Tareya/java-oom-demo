FROM registry.cn-hangzhou.aliyuncs.com/uniondrug-centos/java-alpine:java8-v2
MAINTAINER Tareya.Shen


RUN mkdir -p /data/apps/eureka-client-demo/log


WORKDIR /data/apps/eureka-client-demo

ADD ./eureka-client-demo.jar  /data/apps/eureka-client-demo/
ADD ./application.yaml /data/apps/eureka-client-demo/
ADD ./dump-handler /data/apps/eureka-client-demo/

RUN chmod +x /data/apps/eureka-client-demo/eureka-client-demo.jar && \
    chmod +x /data/apps/eureka-client-demo/dump-handler 

# ENV SPRING_PROFILES_ACTIVE testing
# ENV arg1 '"-Xms512m","-Xmx512m","-Xss256k","-XX:+UnlockExperimentalVMOptions","-XX:+UseCGroupMemoryLimitForHeap","-XX:MetaspaceSize=256m","-XX:MaxMetaspaceSize=256m","-XX:+HeapDumpOnOutOfMemoryError","-XX:+ExitOnOutOfMemoryError","-XX:HeapDumpPath=log/java_heapdump.hprof","-XX:OnOutOfMemoryError=./dump-handler -k \$HOSTNAME -e \$SPRING_PROFILES_ACTIVE"'

# ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-Duser.timezone=Asia/Shanghai","-jar","eureka-client-demo.jar","$arg1"]

