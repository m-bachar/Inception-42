# Use the Debian oldstable base image
FROM debian:oldstable

# Update and upgrade packages in the base image
RUN apt update -y && apt upgrade -y

# Install nginx web server
RUN apt install nginx -y

# Create SSL directory for nginx
RUN mkdir -p /etc/nginx/ssl

# Install openssl for generating SSL certificates
RUN apt install openssl -y

# Generate a self-signed SSL certificate for nginx
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/mbachar.crt -keyout /etc/nginx/ssl/mbachar.key -subj "/C=MA/ST=KH/L=Khouribga/O=42/OU=42/CN=mbachar.42.fr/UID=mbachar"

# Copy custom nginx configuration file to the container
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Define the command to run when the container starts
CMD [ "nginx", "-g", "daemon off;" ]
