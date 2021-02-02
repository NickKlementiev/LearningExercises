CREATE DATABASE devedores;
SHOW DATABASES;

USE devedores;

CREATE TABLE lista(
id INTEGER,
empresa VARCHAR(30),
admissao date,
montante FLOAT(10, 2),
status VARCHAR(10),
regional VARCHAR(20)
);

SHOW TABLES;
DESCRIBE lista;

INSERT INTO lista VALUES
(1, 'BRADESCO', '2009/12/24', 1400.25, 'GRANDE', 'SP'),
(2, 'ITAU', '2007/12/01', 3456.23, 'GRANDE', 'SP');

SELECT * FROM lista;

DROP TABLE lista;
DROP DATABASE devedores;