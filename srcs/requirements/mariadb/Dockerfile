# Use the Debian oldstable base image
FROM debian:oldstable

# Update and upgrade packages in the base image
RUN apt update -y && apt upgrade -y

# Install MariaDB server and client
RUN apt install mariadb-server mariadb-client -y

# Copy custom MariaDB server configuration file to the container
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy a script named script.sh to the root of the container filesystem
COPY ./tools/script.sh .

# Make script.sh executable
RUN chmod +x script.sh

# Define the command to run when the container starts
CMD ["./script.sh"]
