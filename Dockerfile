FROM java:7

EXPOSE 3004

RUN curl -O http://jenkins-registrar.dev-prsn.com:8080/view/PaaS%20POC/job/openshift-deploy-singleService/lastSuccessfulBuild/artifact/service/target/user-profile-jar-with-dependencies.jar

RUN curl -O http://jenkins-registrar.dev-prsn.com:8080/view/PaaS%20POC/job/openshift-deploy-singleService/lastSuccessfulBuild/artifact/service/config/environment.properties

RUN curl -O http://jenkins-registrar.dev-prsn.com:8080/view/PaaS%20POC/job/openshift-deploy-singleService/lastSuccessfulBuild/artifact/service/config/version.properties
RUN mkdir -p config/dev
RUN mv version.properties config/dev

RUN curl -O http://jenkins-registrar.dev-prsn.com:8080/view/PaaS%20POC/job/openshift-deploy-singleService/lastSuccessfulBuild/artifact/service/config/logback.xml

ENV SERVERS "java -classpath user-profile-jar-with-dependencies.jar com.pearson.grid.userprofile.Main"
CMD sh -c "eval $SERVERS"

