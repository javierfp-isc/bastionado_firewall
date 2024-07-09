PROJECT="perimetral"
SERVICES=wordpress moodle dvwa

#Targets principales
install:
	docker compose -p ${PROJECT} -f compose/docker-compose.yml up -d

down:
	docker compose -p ${PROJECT} -f compose/docker-compose.yml stop
	docker compose -p ${PROJECT} -f compose/docker-compose.yml rm -f

delete: down
	for s in ${SERVICES};do docker rmi -f ${PROJECT}_$$s;done

start:
	docker compose -p ${PROJECT} -f compose/docker-compose.yml start

stop:
	docker compose -p ${PROJECT} -f compose/docker-compose.yml stop

restart: stop start

sh:
	docker compose -p ${PROJECT} -f compose/docker-compose.yml exec ${service} bash

info:
	docker inspect ${PROJECT}_${service}_1

ls:
	docker compose -p ${PROJECT} -f compose/docker-compose.yml ps

