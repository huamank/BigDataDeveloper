CREATE DATABASE IF NOT EXISTS retail_db;

USE retail_db;

CREATE EXTERNAL TABLE IF NOT EXISTS categories_avro
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.avro.AvroSerDe'
STORED as AVRO
LOCATION 'hdfs://namenode:8020/user/datapath/datasets/avro/categories'
TBLPROPERTIES ('avro.schema.url'='hdfs://namenode:8020/user/datapath/datasets/avro/categories.avsc');


CREATE EXTERNAL TABLE IF NOT EXISTS customers_avro
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.avro.AvroSerDe'
STORED as AVRO
LOCATION 'hdfs://namenode:8020/user/datapath/datasets/avro/customers'
TBLPROPERTIES ('avro.schema.url'='hdfs://namenode:8020/user/datapath/datasets/avro/customers.avsc');


CREATE EXTERNAL TABLE IF NOT EXISTS orders_avro
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.avro.AvroSerDe'
STORED as AVRO
LOCATION 'hdfs://namenode:8020/user/datapath/datasets/avro/orders'
TBLPROPERTIES ('avro.schema.url'='hdfs://namenode:8020/user/datapath/datasets/avro/orders.avsc');


CREATE EXTERNAL TABLE IF NOT EXISTS order_items_avro
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.avro.AvroSerDe'
STORED as AVRO
LOCATION 'hdfs://namenode:8020/user/datapath/datasets/avro/order_items'
TBLPROPERTIES ('avro.schema.url'='hdfs://namenode:8020/user/datapath/datasets/avro/order_items.avsc');


CREATE EXTERNAL TABLE IF NOT EXISTS departments_avro
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.avro.AvroSerDe'
STORED as AVRO
LOCATION 'hdfs://namenode:8020/user/datapath/datasets/avro/departments'
TBLPROPERTIES ('avro.schema.url'='hdfs://namenode:8020/user/datapath/datasets/avro/departments.avsc');


CREATE EXTERNAL TABLE IF NOT EXISTS products_avro
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.avro.AvroSerDe'
STORED as AVRO
LOCATION 'hdfs://namenode:8020/user/datapath/datasets/avro/products'
TBLPROPERTIES ('avro.schema.url'='hdfs://namenode:8020/user/datapath/datasets/avro/products.avsc');
