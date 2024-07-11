all:
	docker-compose -f ./srcs/docker-compose.yml up -d
wipe:
	rm -fr /Users/mbachar/Data/data_wp/* -y
	rm -fr /Users/mbachar/Data/data_db/* -y
	docker stop $(docker ps -qa)
	docker rm $(docker ps -qa)
	docker rmi -f $(docker images -qa)
	docker volume rm $(docker volume ls -q)
	docker system prune -af
