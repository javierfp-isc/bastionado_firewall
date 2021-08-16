# bastionado perimetral
Repositorio para prácticas relacionadas con la seguridad perimetral

El repositorio consta de los siguentes escenarios

* **firewall**: Escenario para prácticas de Firewall con iptables
* **ids**: Escenario para prácticas de IDS/IPS Snort y Suricata
* **proxy**: Escenario para prácticas de proxy inverso con nginx
* **services**: Escenario para lanzar servicios web para hacer tests
* **elk**: Escenario Elasticsearch+Logstash+Kibana de tipo SIEM para analizar logs de IDS

## Creación y gestión de los escenarios

Los distintos escenarios para las prácticas se despliegan en los directorios anteriores dentro del repositorio. Cada escenario consta de un stack **docker-compose**, pudiendo también disponer de un despliegue vagrant para máquinas Virtualbox.

Los elementos principales son services **docker-compose**, los cuales se construyen a partir del archivo **compose/docker-compose.yml**.

A efectos de interacción con los escenarios (creación, listado de elementos, parada, arranque, etc.) se dispone de un **Makefile** dentro de cada escenario el cual, mediante targets, permite la gestión de cada uno de ellos mediante el **comando make**.

### Lanzar escenario

Desde el directorio del escenario ejecutamos:

`make`

El comando anterior crear todos los elementos del escenario: imágenes docker, networks, containers y volúmenes

### Listar los elementos de un escenario

Ejectuamos para ello:

`make ls`

### Arrancar y parar escenario

Con el comando:

`make start`

Arrancamos los containers del escenario.

Si ejecutamos:

`make stop`

detenemos los containers del escenario

Con:

`make restart`

reiniciamos el escenario (stop->start)

### Acceder por terminal a un service del escenario

Para acceder por terminal de línea de comandos a un service (container) usando su nombre de service, ejecutamos:

`make sh service=nombre`

donde **nombre** es el nombre del service correspondiente

### Ver información de un service del escenario

Ejecutamos:

`make info service=nombre`

### Eliminar containers de un escenario

Para eliminar los containers de un escenario, solamente éstos, sin eliminar networks, ni volúmenes ni imágenes, ejecutamos:

`make down`

### Eliminar containers e imágenes de un escenario

Si además queremos eliminar también las imágenes, ejecutamos:

`make delete`

### Deshabilitar Firewall

En todos los escenarios, menos en **services** y **elk**, se disponen también de dos targets que permiten deshabilitar y habilitar, mediante iptables, netfilter. Realmente lo que hacen es actuar sobre las POLICY de las cadenas INPUT, OUTPUT y FORWARD, estableciendo ésta ACCEPT. El efecto resultante es que el tráfico no se bloquea. Esto puede resultar útil para hacer pruebas sin que el firewall "moleste".

Los targets son:

`make fwdown`

Establece las políticas a ACCEPT para todos los elementos del escenario.

`make fwup`

Reestablece las políticas a DROP para todos los elementos del escenario.
