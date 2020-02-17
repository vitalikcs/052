FROM ubuntu:18.04
ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update
RUN apt-get install -y apache2 apache2-utils php curl php-mysql php-cli php-gd
RUN cd /tmp
RUN curl -O https://wordpress.org/latest.tar.gz
RUN tar -xzf latest.tar.gz -C /var/www/html --strip 1 
RUN cd -
RUN rm -rf /var/www/html/index.html 
#RUN cp -a /tmp/wordpress/. /var/www/wordpress
RUN chown -R www-data:www-data /var/www

EXPOSE 80
ENTRYPOINT ["apache2ctl"]
CMD ["-DFOREGROUND"]
