PROJECT="vlan"
SERVICES=host102 host103 gw1020 host202 host203 gw2030 host302 host303 host5020 host5031 host5041 host5052 host5062

#Targets principales
install: vagrantup

down: composedown vagrantdelete

delete: composedelete vagrantdelete

start: vagrantstart

stop: vagrantstop

restart: stop start

sh:
	docker-compose -p ${PROJECT} --env-file compose/vars.env  -f compose/docker-compose.yml exec ${service} bash

info:
	docker inspect ${PROJECT}_${service}_1

ls:
	docker-compose -p ${PROJECT} --env-file compose/vars.env  -f compose/docker-compose.yml ps

#Requisitos
vagrantup: composeup
	cd vagrant && vagrant up
composeup:	
	docker-compose -p ${PROJECT} --env-file compose/vars.env -f compose/docker-compose.yml up -d

vagrantdelete:
	cd vagrant && vagrant destroy -f
composedelete:
	docker-compose -p ${PROJECT} --env-file compose/vars.env -f compose/docker-compose.yml down --rmi all -v

composedown:
	docker-compose -p ${PROJECT} --env-file compose/vars.env -f compose/docker-compose.yml down

vagrantstart: composestart
	cd vagrant && vagrant up
composestart:
	docker-compose -p ${PROJECT} --env-file compose/vars.env -f compose/docker-compose.yml start	

vagrantstop: composestop
	cd vagrant && vagrant halt
composestop:
	docker-compose -p ${PROJECT} --env-file compose/vars.env -f compose/docker-compose.yml stop


