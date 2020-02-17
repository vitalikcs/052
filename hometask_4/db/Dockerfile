FROM ubuntu:18.04
RUN apt-get -y update
RUN apt-get install -y apt-utils
COPY ./dbs1.sh $HOME/dbs1.sh
RUN chmod 700 dbs1.sh
RUN ./dbs1.sh
RUN mkdir /var/run/mysqld
RUN mkfifo /var/run/mysqld/mysqld.sock
RUN chown -R mysql /var/run/mysqld
EXPOSE 3306
CMD ["mysqld_safe"]
#CMD ["mysql", "-h", "localhost", "-uroot", "-p'123456'", "-e", "'CREATE DATABASE wordpress;'"]

