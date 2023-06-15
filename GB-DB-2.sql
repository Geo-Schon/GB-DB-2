CREATE SCHEMA gb_db_2;

CREATE TABLE gb_db_2.sales (
    id INT NOT NULL AUTO_INCREMENT,
    order_date DATE NOT NULL,
    amount INT NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO gb_db_2.sales (order_date, amount)
VALUES
  ("2023-12-22",456),
  ("2023-09-03",120),
  ("2023-07-11",294),
  ("2023-11-12",323),
  ("2023-10-03",190),
  ("2023-08-28",90),
  ("2022-01-19",105),
  ("2022-12-15",89),
  ("2022-03-10",209),
  ("2022-03-11",132),
  ("2022-06-01",291),
  ("2022-08-22",97);

SELECT id, order_date, amount,
CASE TRUE
    WHEN amount < 100 THEN 'Меньше 100'
    WHEN amount >= 100 AND amount <= 300 THEN 'От 100 до 300'
    ELSE 'Больше 300'
END AS order_size
FROM gb_db_2.sales;


CREATE TABLE orders (
    order_id INT NOT NULL AUTO_INCREMENT,
    employee_id VARCHAR(5) NOT NULL,
    amount DECIMAL(20, 2) NOT NULL,
    order_status VARCHAR(45) NOT NULL,
    PRIMARY KEY (order_id)
);

INSERT INTO orders (employee_id, amount, order_status)
VALUES
  ("02",50.65,"OPEN"),
  ("01",33.34,"OPEN"),
  ("05",7.90,"CLOSED"),
  ("04",58.30,"CLOSED"),
  ("04",15.02,"CANCELLED"),
  ("05",28.46,"CLOSED"),
  ("03",23.70,"PROCESSED"),
  ("02",84.01,"OPEN"),
  ("11",29.08,"OPEN"),
  ("07",23.53,"OPEN"),
  ("03",58.08,"CLOSED"),
  ("01",58.88,"OPEN");
 
  
SELECT order_id, order_status,
CASE order_status
    WHEN "OPEN" THEN 'Заказ принят'
    WHEN "CLOSED" THEN 'Заказ выполнен'
    WHEN "PROCESSED" THEN 'Заказ обрабатывается'
    ELSE 'Заказ отменен'
END AS order_summary
FROM orders;


/* "0" - это математическое значение, число,
NULL - это значение, которое представляет "отсутствие значения".
*/