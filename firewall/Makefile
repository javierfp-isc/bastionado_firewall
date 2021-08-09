PROJECT="perimetral"
SERVICES=adm1 adm2 dir1 rde rdi rl sat1 sat2 www

#Targets principales
install:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml up -d

down:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml down

delete:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml down --rmi all -v

start:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml start

stop:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml stop

restart: stop start

sh:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml exec ${service} bash

info:
	docker inspect ${PROJECT}_${service}_1

ls:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml ps

fwdown:
	for s in ${SERVICES};do docker-compose -p ${PROJECT} -f compose/docker-compose.yml exec $$s /usr/sbin/iptables -P INPUT ACCEPT;done
	for s in ${SERVICES};do docker-compose -p ${PROJECT} -f compose/docker-compose.yml exec $$s /usr/sbin/iptables -P FORWARD ACCEPT;done
	for s in ${SERVICES};do docker-compose -p ${PROJECT} -f compose/docker-compose.yml exec $$s /usr/sbin/iptables -P OUTPUT ACCEPT;done

fwup:
	for s in ${SERVICES};do docker-compose -p ${PROJECT} -f compose/docker-compose.yml exec $$s /usr/sbin/iptables -P INPUT DROP;done
	for s in ${SERVICES};do docker-compose -p ${PROJECT} -f compose/docker-compose.yml exec $$s /usr/sbin/iptables -P FORWARD DROP;done
	for s in ${SERVICES};do docker-compose -p ${PROJECT} -f compose/docker-compose.yml exec $$s /usr/sbin/iptables -P OUTPUT DROP;done

