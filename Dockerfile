FROM jenkins
COPY plugins.txt /usr/share/jenkins/plugins.txt
COPY config.xml /var/jenkins_home
RUN /usr/local/bin/install-plugins.sh $(cat /usr/share/jenkins/plugins.txt | tr '\n' ' ')