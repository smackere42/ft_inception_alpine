start: dirs portainer
	cd srcs && docker-compose up -d

build: dirs
	cd srcs && docker-compose up --build

run: build portainer
	cd srcs && docker-compose up -d

dirs:
	cd srcs/requirements/wordpress/tools && chmod +x make_dir.sh && bash make_dir.sh

re: stop clean start

stop:
	cd srcs && docker-compose stop
	docker stop portainer

wordpressr:
	docker stop wordpress
	docker rm wordpress
	docker rmi smackere:wordpress
	docker-compose up -d

execw:
	docker exec -ti wordpress ash


nginxr:
	docker stop nginx
	docker rm nginx
	docker rmi smackere:nginx
	docker-compose up -d

execn:
	docker exec -ti nginx ash

mariadbr:
	docker stop mariadb
	docker rm mariadb
	docker rmi smackere:mariadb
	docker-compose up -d

execm:
	docker exec -ti mariadb ash

redisr:
	docker stop redis
	docker rm redis
	docker rmi smackere:redis
	docker-compose up -d

execr:
	docker exec -ti redis ash
#redis-cli
#monitor

ftpr:
	docker stop vsftpd
	docker rm vsftpd
	docker rmi smackere:vsftpd
	cd srcs && docker-compose up -d

execf:
	docker exec -ti vsftpd ash

adminerr:
	docker stop adminer
	docker rm adminer
	docker rmi smackere:adminer
	cd srcs && docker-compose up -d

execa:
	docker exec -ti adminer ash

staticr:
	docker stop static
	docker rm static
	docker rmi smackere:static
	cd srcs && docker-compose up -d

portainer:
	docker volume create portainer
	docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer:/data portainer/portainer-ce:2.11.1

clean: stop
	docker rm nginx
	docker rm mariadb
	docker rm wordpress
	docker rm redis
	docker rm vsftpd
	docker rm adminer
	docker rm static
	docker rm portainer
	docker rmi smackere:nginx
	docker rmi smackere:mariadb
	docker rmi smackere:wordpress
	docker rmi smackere:redis
	docker rmi smackere:vsftpd
	docker rmi smackere:adminer
	docker rmi smackere:static
	docker rmi alpine:3.16
	docker rmi portainer/portainer-ce:2.11.1
	docker volume rm srcs_db
	docker volume rm srcs_wp
	docker volume rm portainer
	docker network prune -f

down: stop clean	