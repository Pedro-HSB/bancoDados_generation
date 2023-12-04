/*Aula generation 04/12*/

CREATE DATABASE IF NOT EXISTS db_quitanda;

USE db_quitanda;

CREATE TABLE IF NOT EXISTS tb_produto(
id BIGINT AUTO_INCREMENT NOT NULL,
nome VARCHAR(50) NOT NULL,
quantidade INT NULL DEFAULT(1),
data_validade DATE NULL,
preco DECIMAL NOT NULL,
PRIMARY KEY(id)
);

INSERT INTO tb_produto VALUES 
(NULL,"tomato",100,"2023-12-18",8.00),
(NULL,"maca",100,"2023-12-10",11.00),
(NULL,"laranja",100,"2023-12-15",15.00),
(NULL,"banana",100,"2023-12-8",11.90),
(NULL,"uva",100,"2023-12-15",30.00),
(NULL,"melancia",100,"2023-12-9",20.00);

SELECT * FROM tb_produto;

ALTER TABLE tb_produto MODIFY preco DECIMAL(6,2);

UPDATE tb_produto SET preco =11.90 WHERE id=4;


/*SET SQL_SAFE_UPDATES=0;*/

SELECT CONCAT("R$ ",FORMAT(preco,2,"pt_br"))as preco from tb_produto;