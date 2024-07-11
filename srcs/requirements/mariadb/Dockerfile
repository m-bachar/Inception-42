# Use Debian Buster as the base image
FROM debian:bullseye

# Update and upgrade existing packages
RUN apt update -y && apt upgrade -y

# Install MariaDB server
RUN apt install mariadb-server mariadb-client -y

RUN sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy script.sh from host to container
COPY ./tools/script.sh .

# Make script.sh executable
RUN chmod +x script.sh

# Specify the command to run when the container starts
CMD ["./script.sh"]