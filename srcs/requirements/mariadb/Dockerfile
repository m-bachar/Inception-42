# FROM debian:buster

# RUN apt update -y && apt upgrade -y

# RUN apt install mariadb-server mariadb-client -y

# COPY ./conf/50-server.cnf ./etc/mysql/mariadb.conf.d/50-server.cnf

# COPY ./tools/script.sh .

# RUN chmod +x script.sh

# EXPOSE 3306

# CMD [ "./script.sh" ]

# base image
FROM debian:buster

# install mariadb server
RUN apt update && apt -y install mariadb-server

# copy the script.sh into container
COPY ./tools/script.sh /tmp/script.sh

# change the permission to the script.sh
RUN chmod +x /tmp/script.sh

# run the script.sh
ENTRYPOINT [ "/tmp/script.sh" ]

# running mysqld daemon
CMD [ "mysqld" ]