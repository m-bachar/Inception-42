# Use Debian Buster as the base image
FROM debian:oldstable

# Update packages, upgrade existing packages, and install vim and curl
RUN apt update -y && apt upgrade -y

# Install nginx web server
RUN apt install nginx -y

# Create directory for SSL certificates
RUN mkdir -p /etc/nginx/ssl

# Install openssl for generating SSL certificates
RUN apt install openssl -y

# Generate self-signed SSL certificate for nginx
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/mbachar.crt -keyout /etc/nginx/ssl/mbachar.key -subj "/C=MA/ST=KH/L=Khouribga/O=42/OU=42/CN=mbachar.42.fr/UID=mbachar"

# Copy custom nginx configuration file to container
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Set the default command to start nginx and keep it running in the foreground
CMD [ "nginx", "-g", "daemon off;" ]