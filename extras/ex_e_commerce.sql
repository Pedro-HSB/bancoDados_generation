
CREATE DATABASE IF NOT EXISTS e_commerce;

USE e_commerce;

CREATE TABLE IF NOT EXISTS produto(
id BIGINT AUTO_INCREMENT NOT NULL,
nome VARCHAR(50) NOT NULL,
quantidade INT NULL DEFAULT(1),
Data_Fabricação VARCHAR(50) NOT NULL,
data_validade DATE NULL,
preco DECIMAL(6,2) NOT NULL,
Fornecedor VARCHAR(50) NOT NULL,
Categoria  VARCHAR(50) NOT NULL,
PRIMARY KEY(id)
); 
 

INSERT INTO produto
VALUES  (NULL,"sabao", 100,"2023-11-20",NULL,6.00, "johnson","higiene"),

		(NULL,"Laptop Dell Inspiron 15", 100,"2023-01-15",NULL,899.99, "Dell Inc.","Eletronicos"),
        
		(NULL,"Camiseta", 100,"2023-02-03",NULL,19.99, "Cotton Style Co.","Vestuário"),
        
		(NULL,"Leite", 1000,"2023-01-10","2023-02-10",2.49, "Dairy Farms Ltd.","Alimentos"),
        
		(NULL,"Smartphone Galaxy S21", 100," 2023-03-05",NULL,999.99, "Samsung Electronics","Eletronicos"),
        
		(NULL,"Aventuras de Sherlock Holmes", 100," 2023-02-20",NULL,14.99, "Books Unlimited","Livros"),
        
        (NULL,"Cafeteira Elétrica 12 xícaras", 100,"2023-01-25",NULL,49.99, "Kitchen Appliances Inc.","Eletrodomesticos"),
        
        (NULL,"Tênis de Corrida Nike Air Zoom", 100,"2023-02-10",NULL,129.99, "Nike Corporation","Calcados"),
        
        (NULL,"Máquina de Lavar Roupa 8kg", 100,"2023-03-15",NULL,399.99, "Home Appliances Co.","Eletrodomesticos");


SELECT * FROM produto;

SELECT * FROM produto where preco > 500;

SELECT * FROM produto where preco < 500;

ALTER TABLE produto MODIFY Fornecedor VARCHAR(70) NOT NULL;

UPDATE produto SET preco  = 800.00 WHERE id = 5;

