/*DROP DATABASE db_pizzaria_legal;*/
CREATE DATABASE IF NOT EXISTS db_pizzaria_legal;

USE db_pizzaria_legal;


CREATE TABLE IF NOT EXISTS Cliente (
id BIGINT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
Telefone VARCHAR(50) NOT NULL,
Endereco VARCHAR(70) NOT NULL,
Email VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Categoria (
id BIGINT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Pizza (
id BIGINT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
Descricao VARCHAR(70) NOT NULL,
Preco DECIMAL(6,2) NOT NULL,
IDCategoria BIGINT NOT NULL,
FOREIGN KEY (IDCategoria) REFERENCES Categoria(id)
);

CREATE TABLE IF NOT EXISTS Pedido (
id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
IDCliente BIGINT NOT NULL,
DataPedido DATE NOT NULL,
StatusPedido VARCHAR(50) NOT NULL,
FOREIGN KEY (IDCliente) REFERENCES cliente(id)
);

CREATE TABLE IF NOT EXISTS ItensPedido (
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
IDPedido BIGINT NOT NULL,
IDPizza BIGINT NOT NULL,
Quantidade INT NOT NULL,
PrecoUnitario DECIMAL(6,2) NOT NULL,
FOREIGN KEY (IDPedido) REFERENCES Pedido(id),
FOREIGN KEY (IDPizza) REFERENCES pizza(id)
);




INSERT INTO Cliente VALUES
    (NULL,'Ana Silva',"9876-5432","Rua das Flores, 123, Bairro Jardim, Cidade Alegre","ana.silva@email.com"),
    (NULL,'Marcos Oliveira',"8765-4321","Av. Principal, 456, Bairro Centro, Cidade Feliz","marcos.oliveira@email.com"),
    (NULL,'Camila Santos',"7654-3210","Travessa da Paz, 789, Bairro Tranquilo, Cidade Serena","camila.santos@email.com"),
    (NULL,'Rafaela Lima',"6543-2109"," Rua da Alegria, 987, Bairro Feliz, Cidade Encantada","rafaela.lima@email.com"),
    (NULL,'Bruno Pereira',"5432-1098","Alameda dos Sonhos, 654, Bairro Esperança, Cidade Iluminada","bruno.pereira@email.com");
    



INSERT INTO Categoria VALUES 
    (NULL,"Tradicional"),
    (NULL,"Especialidades da Casa"),
    (NULL,"Vegetariana"),
    (NULL,"Doce"),
    (NULL,"Personalizadas");




INSERT INTO Pizza VALUES 
    (NULL,"Margherita","Molho de tomate, mussarela e manjericão fresco.",30.00,1),
    (NULL,"Pepperoni","Molho de tomate, pepperoni, queijo e orégano.",35.50,1),
    (NULL,"Vegetariana","Molho de tomate, queijo, tomate, pimentão e cebola",32.00,3),
    (NULL,"Quatro Queijos","Molho de tomate, mussarela, parmesão, provolone e gorgonzola.",38.00,1),
    (NULL,"Chocolate Delight","Chocolate, morangos frescos, raspas de chocolate e chantilly.",40.00,4);
    
    

INSERT  INTO Pedido VALUES 
    (NULL,1,"2023-05-15","Em andamento"),
    (NULL,3,"2023-06-02","Concluído"),
    (NULL,2,"2023-06-10","Em andamento"),
    (NULL,4,"2023-06-25","Concluído"),
    (NULL,5,"2023-07-05","Em andamento");




INSERT  INTO ItensPedido VALUES 
    (NULL,"Margherita",1,1,2,30.00),
    (NULL,"Pepperoni Especial",2,2,1,35.50),
    (NULL,"Pizza Veggie",3,3,3,32.00),
    (NULL,"Pizza Quatro Queijos",4,4,1,38.00),
    (NULL,"Chocolate Delight",5,5,2,40.00);
    
    
SELECT * FROM Cliente;
SELECT * FROM Categoria;
SELECT * FROM Pizza;
SELECT * FROM Pedido;
SELECT * FROM ItensPedido;


SELECT *
FROM Pizza WHERE Pizza.preco > 35.00;

SELECT *
FROM Pizza WHERE Pizza.preco BETWEEN 35.00 AND 38.00;

SELECT *
FROM Pizza WHERE Pizza.nome LIKE "%M%";

SELECT Pizza.nome AS pizza,
categoria.nome AS categoria
FROM Pizza 
INNER JOIN categoria
ON Pizza.IDCategoria = categoria.id;

SELECT Pizza.nome,
categoria.nome
FROM Pizza 
INNER JOIN categoria
ON Pizza.IDCategoria = categoria.id
AND Pizza.IDCategoria = 3;/*deve retornar as vegetarianas*/


SELECT cliente.nome AS Cliente,
Pizza.nome AS pizza,
Categoria.nome AS Categoria,
ItensPedido.PrecoUnitario AS preco,
Pedido.StatusPedido AS "status"
FROM pedido
INNER JOIN ItensPedido
ON ItensPedido.IDPedido = Pedido.id
AND Pedido.StatusPedido LIKE "concluido"
INNER JOIN cliente
ON Pedido.IDCliente = cliente.id
INNER JOIN pizza
ON ItensPedido.IDPizza = pizza.id
INNER JOIN Categoria
ON pizza.IDCategoria = Categoria.id;

SELECT Pedido.StatusPedido AS andamento,
cliente.nome AS cliente,
ItensPedido.Quantidade ,
ItensPedido.PrecoUnitario AS preco
FROM Pedido 
INNER JOIN ItensPedido
ON Pedido.id = ItensPedido.IDPedido
AND Pedido.StatusPedido LIKE "em andamento"
INNER JOIN cliente
ON Pedido.IDCliente = cliente.id;