PROJECT="vlan"
SERVICES=host102 host103 gw1020 host202 host203 gw2030 host302 host303

#Targets principales
install:
	docker-compose -p ${PROJECT} --env-file compose/vars.env -f compose/docker-compose.yml up -d

down:
	docker-compose -p ${PROJECT} --env-file compose/vars.env  -f compose/docker-compose.yml down

delete:
	docker-compose -p ${PROJECT} --env-file compose/vars.env  -f compose/docker-compose.yml down --rmi all -v

start:
	docker-compose -p ${PROJECT} --env-file compose/vars.env  -f compose/docker-compose.yml start

stop:
	docker-compose -p ${PROJECT} --env-file compose/vars.env  -f compose/docker-compose.yml stop

restart: stop start

sh:
	docker-compose -p ${PROJECT} --env-file compose/vars.env  -f compose/docker-compose.yml exec ${service} bash

info:
	docker inspect ${PROJECT}_${service}_1

ls:
	docker-compose -p ${PROJECT} --env-file compose/vars.env  -f compose/docker-compose.yml ps


