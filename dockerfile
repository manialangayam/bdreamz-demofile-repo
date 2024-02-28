ARG version=latest
FROM ubuntu:${version}
FROM debian:${version}
MAINTAINER awscloudrockers@gmail.com
LABEL version="1.5"
LABEL description="This image is custom image and used for building custom container"
RUN apt-get update -y
RUN apt-get install -y git
RUN apt-get install -y docker
RUN apt-get install -y nginx
RUN apt-get install -y apache2
RUN mkdir /data
CMD mkdir /var/www/html/test-folder
#ENTRYPOINT ["/usr/sbin/apache2ctl","-D","FOREGROUND"]
#CMD touch index.html
EXPOSE 9091
EXPOSE 9090
ENV dir /var/www/html
ADD index.html /var/www/html
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/klinik.zip /var/www/html/
COPY error.html /var/www/html
VOLUME ["/var/log"]
RUN useradd besant
#USER besant
WORKDIR /var/www/html
#CMD ["/bin/bash"]
HEALTHCHECK CMD curl -f http://18.191.212.207:9091/ || exit 1
ONBUILD RUN apt-get install python3 -y
ONBUILD RUN mkdir onbuild-folder
ONBUILD RUN touch onbuild.txt
CMD ["/usr/sbin/apache2ctl","-D","FOREGROUND"]
ENTRYPOINT ["/bin/bash"]
