PROJECT="redes_ipsec"

#Targets principales
install: vagrantup

down: composedown vagrantdelete

delete: composedelete vagrantdelete

start: vagrantstart

stop: vagrantstop

restart: stop start

sh:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml exec ${service} bash

info:
	docker inspect ${PROJECT}_${service}_1

ls:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml ps

#Requisitos
vagrantup: composeup
	sed -i "s/<ipvlan_pp>/di-$(shell docker network ls | grep redes_ipsec_pp | cut -d' ' -f1)/" vagrant/Vagrantfile
	sed -i "s/<ipvlan_psoe>/di-$(shell docker network ls | grep redes_ipsec_psoe | cut -d' ' -f1)/" vagrant/Vagrantfile
	sed -i "s/<ipvlan_wan>/di-$(shell docker network ls | grep redes_ipsec_wan | cut -d' ' -f1)/" vagrant/Vagrantfile
	cd vagrant && vagrant up
composeup:	
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml up -d
	
vagrantdelete:
	cd vagrant && vagrant destroy -f
composedelete:
	sed -i "s/di-$(shell docker network ls | grep redes_ipsec_pp | cut -d' ' -f1)/<ipvlan_pp>/" vagrant/Vagrantfile
	sed -i "s/di-$(shell docker network ls | grep redes_ipsec_psoe | cut -d' ' -f1)/<ipvlan_psoe>/" vagrant/Vagrantfile
	sed -i "s/di-$(shell docker network ls | grep redes_ipsec_wan | cut -d' ' -f1)/<ipvlan_wan>/" vagrant/Vagrantfile
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml down --rmi all -v

composedown:
	sed -i "s/di-$(shell docker network ls | grep redes_ipsec_pp | cut -d' ' -f1)/<ipvlan_pp>/" vagrant/Vagrantfile
	sed -i "s/di-$(shell docker network ls | grep redes_ipsec_psoe | cut -d' ' -f1)/<ipvlan_psoe>/" vagrant/Vagrantfile
	sed -i "s/di-$(shell docker network ls | grep redes_ipsec_wan | cut -d' ' -f1)/<ipvlan_wan>/" vagrant/Vagrantfile
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml down

vagrantstart: composestart
	cd vagrant && vagrant up
composestart:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml start	

vagrantstop: composestop
	cd vagrant && vagrant halt
composestop:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml stop


