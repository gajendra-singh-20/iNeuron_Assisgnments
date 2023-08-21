-- Active: 1691992213195@@127.0.0.1@3306@linkedin

-- Question 1
create DATABASE linkedin;
use linkedin;
create table technology(
    id INT,
    technology VARCHAR(25)
);

insert into technology value(1,"DS"),(1,"PowerBI"),(1,"Python"),(1,"SQL"),(2,"PowerBI"),(2,"Python"),(2,"SQL"),
(3,"PowerBI"),(3,"Python"),(3,"SQL");

select * from technology;

select id from technology WHERE technology in ("DS","Python","SQL");
SELECT id from technology WHERE technology ="DS" AND IN (SELECT id from technology WHERE technology ="SQL"
 AND IN (SELECT id from technology WHERE technology = "Python"  )
 );

SELECT id from technology WHERE technology="DS"
AND id IN(
    SELECT id from technology WHERE technology="SQL" AND id IN(
        SELECT id from technology WHERE technology="Python"
    )
);


---------------------------------
-- Question 2

CREATE DATABASE Ecom;
use Ecom;

CREATE TABLE product_info (
    pr_id INT PRIMARY KEY,
    product_name VARCHAR(255)
);
INSERT INTO product_info (pr_id, product_name) VALUES (1001, 'blog');
INSERT INTO product_info (pr_id, product_name) VALUES (1002, 'youtube');
INSERT INTO product_info (pr_id, product_name) VALUES (1003, 'education');

SELECT * from product_info;
CREATE TABLE product_likes_info (
    user_id INT,
    pr_id INT,
    liked_date DATE,
    FOREIGN KEY (pr_id) REFERENCES product_info(pr_id)
);
INSERT INTO product_likes_info (user_id, pr_id, liked_date) VALUES (1, 1001, '2023-08-21');
INSERT INTO product_likes_info (user_id, pr_id, liked_date) VALUES (2, 1003, '2023-08-22');

SELECT p.pr_id
FROM product_info p
LEFT JOIN product_likes_info pli ON p.pr_id = pli.pr_id
WHERE pli.pr_id IS NULL;
