
CREATE DATABASE IF NOT EXISTS retail_db;

USE retail_db;

CREATE EXTERNAL TABLE IF NOT EXISTS categories
(category_id int,
category_department_id string,
category_name string
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION 'hdfs:///user/datapath/datasets/categories';


CREATE EXTERNAL TABLE IF NOT EXISTS customers
(customer_id int,
customer_fname string,
customer_lname string,
customer_email string,
customer_password string,
customer_street string,
customer_city string,
customer_state string,
customer_zipcode string
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION 'hdfs:///user/datapath/datasets/customers';


CREATE EXTERNAL TABLE IF NOT EXISTS departments
(department_id int,
department_name string
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION 'hdfs:///user/datapath/datasets/departments';


CREATE TABLE IF NOT EXISTS departments_test
(department_id int,
department_name string
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION 'hdfs:///user/datapath/datasets/departments_test';

CREATE EXTERNAL TABLE IF NOT EXISTS order_items
(order_item_id int,
order_item_order_id int,
order_item_product_id int, 
order_item_quantity int, 
order_item_subtotal float,
order_item_product_price float
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION 'hdfs:///user/datapath/datasets/order_items';


CREATE EXTERNAL TABLE IF NOT EXISTS orders
(order_id int,
order_date string,
order_customer_id int,
order_status string
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION 'hdfs:///user/datapath/datasets/orders';


CREATE EXTERNAL TABLE IF NOT EXISTS products
(product_id int,
product_category_id int,
product_name string,
product_description string,
product_price float,
product_image string
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION 'hdfs:///user/datapath/datasets/products';
