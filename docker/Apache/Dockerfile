FROM ubuntu:22.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt update -y 
RUN apt upgrade -y 
RUN apt install -y apache2 php php-zip php-xml php-mysql 
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
