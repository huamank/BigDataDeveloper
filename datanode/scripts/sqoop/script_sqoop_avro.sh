#!/bin/bash
sqoop import \
--connect "jdbc:mysql://10.0.0.100:3310/retail_db" \
--username=root \
--password=root \
--table customers \
--as-avrodatafile \
--target-dir=/user/datapath/datasets/avro/customers \
--delete-target-dir

sqoop import \
--connect "jdbc:mysql://10.0.0.100:3310/retail_db" \
--username=root \
--password=root \
--table departments \
--as-avrodatafile \
--target-dir=/user/datapath/datasets/avro/departments \
--delete-target-dir

sqoop import \
--connect "jdbc:mysql://10.0.0.100:3310/retail_db" \
--username=root \
--password=root \
--table categories \
--as-avrodatafile \
--target-dir=/user/datapath/datasets/avro/categories \
--delete-target-dir

sqoop import \
--connect "jdbc:mysql://10.0.0.100:3310/retail_db" \
--username=root \
--password=root \
--table orders \
--as-avrodatafile \
--target-dir=/user/datapath/datasets/avro/orders \
--delete-target-dir

sqoop import \
--connect "jdbc:mysql://10.0.0.100:3310/retail_db" \
--username=root \
--password=root \
--table order_items \
--as-avrodatafile \
--target-dir=/user/datapath/datasets/avro/order_items \
--delete-target-dir

sqoop import \
--connect "jdbc:mysql://10.0.0.100:3310/retail_db" \
--username=root \
--password=root \
--table products \
--as-avrodatafile \
--target-dir=/user/datapath/datasets/avro/products \
--delete-target-dir