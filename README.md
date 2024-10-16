# BigDataDeveloper

## Descripción del Repositorio
Este repositorio cuenta con las siguientes herramientas:

- MySQL
- Hadoop
- Spark
- Hive
- Jupyter

Todo el contenido se ejecutara en codespace de github.

## Desplegar container

1. Crear un codespace para el repositorio e ingresar al mismo
2. Abrir terminal de codespace
3. Ejecutar el siguiente comando para desplegar los contenedores<br>
```    >_ docker-compose up     ``` <br>
Esta linea desplegara los contenedores y podras ver estos utilizando la extension Docker explorer

## MySQL
Este contenedor contiene una base de datos llamada retail_db y consta de las siguientes tablas: <br>
- customers
- orders
- order_items
- products
- categories
- departments
<br>
credenciales:
<br>
user: root
<br>
pass: root
<br>
port: 3310
<br>
Ejecutar ifconfig en terminal para obtener la ip (eth0)
 
## Hadoop

Para poder trabajar con hadoop ingresamos al contenedor del datanode. <br>
Abrimos un terminal nuevo y ejecutamos lo siguiente
```     >_ docker exec -it datanode bash     ``` <br> 
Asi para cada contenedor con el que queremos trabajar. <br>

Para utilizar sqoop en el datanode debemos ejecutar lo siguiente
```     >_ sh /datanode/scripts/script.sh     ``` <br> 

Para exportar las tabla de la base de datos retail con sqoop ejecutar lo siguiente:<br> 
```     >_ sh /datanode/scripts/sqoop/script_sqoop_textfile.sh     ```<br> 
```     >_ sh /datanode/scripts/sqoop/script_sqoop_avro.sh     ```

## Hive
Para poder trabajar con hive ingresamos al contenedor del hive-server. <br>
Abrimos un terminal nuevo y ejecutamos lo siguiente
```     >_ docker exec -it hive-server bash     ``` <br> 

Para crear tablas externas en base a los datos importados con sqoop ejecutamos los siguientes pasos:<br>

Abrir un terminal de hive desde el contenedor de hive-server<br> 
```     >_ hive      ```<br> 
En un nuevo terminal (en un terminal sin estar dentro de un contenedor), copiar el archivo hive.hql (ubicado en el datanode) a hive-server <br> 
```     >_ docker cp datanode/scripts/hive/hive.hql hive-server:/opt      ``` <br> 
```     >_ docker cp datanode/scripts/hive/hive_avro.hql hive-server:/opt      ``` <br> 
En el contenedor de hive-server ejecutamos lo siguiente para crear las tablas. 
```     >_ hive -f /opt/hive.hql    ``` <br> 




