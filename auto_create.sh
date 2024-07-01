#!/bin/bash

touch Makefile && mkdir srcs
cd srcs && touch docker-compose.yml .env && mkdir requirements
cd requirements && mkdir bonus mariadb nginx tools wordpress
cd mariadb && touch Dockerfile .dockerignore && mkdir conf tools
cd ../nginx && touch Dockerfile .dockerignore && mkdir conf tools
