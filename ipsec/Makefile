PROJECT="redes_ipsec"

#Targets principales
install: composeup sustup vagrantup

down: sustdown composedown vagrantdelete

delete: sustdown composedelete vagrantdelete

start: composestart vagrantstart

stop: composestop vagrantstop

restart: stop start

sh:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml exec ${service} bash

info:
	docker inspect ${PROJECT}_${service}_1

ls:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml ps

#Requisitos
vagrantup:
	-cd vagrant && vagrant up ; vagrant up
composeup:	
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml up -d
	-xhost si:localuser:root	
sustup:
	sed -i "s/<ipvlan_pp>/di-$(shell docker network ls | grep redes_ipsec_pp | cut -d' ' -f1)/" vagrant/Vagrantfile
	sed -i "s/<ipvlan_psoe>/di-$(shell docker network ls | grep redes_ipsec_psoe | cut -d' ' -f1)/" vagrant/Vagrantfile
	sed -i "s/<ipvlan_wan>/di-$(shell docker network ls | grep redes_ipsec_wan | cut -d' ' -f1)/" vagrant/Vagrantfile
	
vagrantdelete:
	cd vagrant && vagrant destroy -f
composedelete:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml down --rmi all -v

composedown:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml down
sustdown:
	sed -i "s/di-$(shell docker network ls | grep redes_ipsec_pp | cut -d' ' -f1)/<ipvlan_pp>/" vagrant/Vagrantfile
	sed -i "s/di-$(shell docker network ls | grep redes_ipsec_psoe | cut -d' ' -f1)/<ipvlan_psoe>/" vagrant/Vagrantfile
	sed -i "s/di-$(shell docker network ls | grep redes_ipsec_wan | cut -d' ' -f1)/<ipvlan_wan>/" vagrant/Vagrantfile
	
vagrantstart:
	-cd vagrant && vagrant up ; vagrant up
composestart:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml start
	-xhost si:localuser:root

vagrantstop:
	cd vagrant && vagrant halt
composestop:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml stop


