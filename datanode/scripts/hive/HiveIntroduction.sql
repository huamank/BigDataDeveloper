
--
-- HIVE DDL
--

-- Creamos Base de datos si no existe
CREATE DATABASE IF NOT EXISTS test_db COMMENT 'Database de prueba';

-- Mostramos las bases de datos que existen
SHOW DATABASES;

-- Borramos una base de datos
DROP DATABASE IF EXISTS test_db CASCADE;
SHOW DATABASES;


-- Crear tablas

CREATE TABLE persons (
    id INT,
    firstname VARCHAR(10),
    surname VARCHAR(10),
    birthday TIMESTAMP,
    color VARCHAR(9),
    quantity INT
    );


CREATE TABLE persons1 (
    id INT,
    firstname VARCHAR(10),
    surname VARCHAR(10),
    birthday TIMESTAMP,
    color VARCHAR(9),
    quantity INT)
COMMENT 'Esta es mi primera tabla'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
STORED AS TEXTFILE;


CREATE TABLE IF NOT EXISTS DDLdb.persons2 LIKE persons;

-- 
-- Agrega una nueva columna especificando su posición.
--
ALTER TABLE persons ADD COLUMNS (state VARCHAR(8));
DESCRIBE persons;

-- 
-- Modifica el tipo de campo de una columna.
--
ALTER TABLE 
    persons 
CHANGE 
    firstname firstname VARCHAR(12);
DESCRIBE persons;

--
-- Borra columnas.
--
ALTER TABLE 
    persons 
REPLACE COLUMNS 
    (id INT, 
     firstname VARCHAR(10));
DESCRIBE persons;

--
-- Borrado de tablas:
--
DROP TABLE IF EXISTS persons;
DROP TABLE IF EXISTS persons1;


-- CREATE EXTERNAL TABLE IF NOT EXISTS db.table1 
-- LIKE db.table
-- LOCATION '/path/to/data';

-- CREATE EXTERNAL TABLE IF NOT EXISTS table1 (
--    col1 STRING,
--    col2 STRING)
-- ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' 
-- LOCATION '/path/to/data';

-- CREATE TABLE IF NOT EXISTS table (
--    col1 STRING,
--    col2 STRING,
--    col3 STRING)
-- PARTITIONED BY (col4 STRING, col5 STRING);


--
-- HIVE DDL
--

DROP DATABASE IF EXISTS test_db CASCADE;
CREATE DATABASE test_db;
USE test_db;

CREATE TABLE persons (
    id INT,
    firstname VARCHAR(10),
    surname VARCHAR(10),
    birthday TIMESTAMP,
    color VARCHAR(9),
    quantity INT
);

--
-- Inserta el registro en la tabla.
-- Los valores están en el mismo orden de los campos.
--
INSERT INTO persons VALUES
   (1,"Vivian","Hamilton","1971-07-08","green",1);
    
SELECT * FROM persons;


--
-- Inserta varios registros a la vez.
-- Los valores deben estar en el mismo orden de los campos.
--
INSERT INTO persons VALUES
    (2,"Karen","Holcomb","1974-05-23","green",4),
    (3,"Cody","Garrett","1973-04-22","orange",1);
    
SELECT * FROM persons;   


--
-- Insertamos datos desde queries
--

CREATE TABLE IF NOT EXISTS persons1 LIKE persons;

INSERT OVERWRITE TABLE persons1
SELECT * FROM persons
WHERE color='green';

SELECT * FROM persons1;


CREATE TABLE IF NOT EXISTS persons2 LIKE persons;

FROM persons
INSERT OVERWRITE TABLE persons1
   SELECT * WHERE color='red'
INSERT OVERWRITE TABLE persons2
   SELECT * WHERE color='green';

--
-- Partition by
--

DROP TABLE IF EXISTS persons3;

CREATE TABLE persons3 (
    id INT,
    firstname VARCHAR(10),
    surname VARCHAR(10),
    birthday TIMESTAMP,
    color VARCHAR(9)
)
PARTITIONED BY (quantity INT);

INSERT INTO TABLE persons3 PARTITION (quantity = 1) VALUES
   (1,"Vivian","Hamilton","1971-07-08","green");

set hive.exec.dynamic.partition.mode=nonstrict;
set hive.exec.dynamic.partition.mode=strict;

FROM persons
INSERT OVERWRITE TABLE persons3 partition(quantity)
   SELECT * WHERE color='green';

SELECT * FROM persons3;


INSERT INTO persons VALUES
    (4,"Karen","Holcomb","1974-05-23","green",7),
    (5,"Cody","Garrett","1973-04-22","green",5);