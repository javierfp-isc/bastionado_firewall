PROJECT="perimetral"
SERVICES=wordpress moodle

#Targets principales
install:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml up -d

down:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml stop
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml rm -f

delete: down
	for s in ${SERVICES};do docker rmi -f ${PROJECT}_$$s;done

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


