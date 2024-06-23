FROM debian:buster

RUN apt update -y && apt upgrade -y

RUN apt install mariadb-server mariadb-client -y

COPY ./conf/50-server.cnf ./etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/script.sh .

RUN chmod +x script.sh

CMD [ "./script.sh" ]
