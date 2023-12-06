CREATE DATABASE db_farmacia_bem_estar;
/*DROP DATABASE db_farmacia_bem_estar;*/
USE db_farmacia_bem_estar;

CREATE TABLE Cliente(
id BIGINT AUTO_INCREMENT NOT NULL,
Nome VARCHAR(50) NOT NULL,
Telefone VARCHAR(50) NOT NULL,
Endereco VARCHAR(70) NOT NULL,
Email VARCHAR(50) NOT NULL, 
PRIMARY KEY (id)
);

CREATE TABLE Venda(
id BIGINT AUTO_INCREMENT NOT NULL,
IDCliente BIGINT NOT NULL,
DataVenda DATE NOT NULL,
TotalVenda BIGINT NOT NULL,
MétodoPagamento VARCHAR(20) NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (IDCliente) REFERENCES Cliente(id)
);

CREATE TABLE Fornecedor(
id BIGINT AUTO_INCREMENT NOT NULL,
Nome VARCHAR(50) NOT NULL,
Telefone VARCHAR(50) NOT NULL,
Endereco VARCHAR(70) NOT NULL,
Email VARCHAR(50) NOT NULL, 
PRIMARY KEY (id)
);

CREATE TABLE categoria(
id BIGINT AUTO_INCREMENT NOT NULL,
Nome VARCHAR(50) NOT NULL,
Descricao VARCHAR(70) NULL,
DataCriacao DATE NOT NULL,
UltimaAtualizacao DATE NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE Produto(
id BIGINT AUTO_INCREMENT NOT NULL,
Nome VARCHAR(50) NOT NULL,
Descricao VARCHAR(70) NULL,
Preco DECIMAL(6,2) NOT NULL,
QtdEstoque BIGINT NOT NULL,
MétodoPagamento VARCHAR(70) NOT NULL,
IDFornecedor BIGINT NOT NULL,
IDCategoria BIGINT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (IDFornecedor) REFERENCES Fornecedor(id),
FOREIGN KEY (IDCategoria) REFERENCES categoria(id)
);

CREATE TABLE Fornecimento(
id BIGINT AUTO_INCREMENT NOT NULL,
IDFornecedor BIGINT NOT NULL,
IDProduto BIGINT NOT NULL,
DataFornecimento DATE NOT NULL,
QtdFornecida VARCHAR(50) NOT NULL,   
PRIMARY KEY (id),
FOREIGN KEY (IDFornecedor) REFERENCES Fornecedor(id),
FOREIGN KEY (IDProduto) REFERENCES Produto(id)
);




INSERT INTO Cliente VALUES
    (NULL,'Ana Silva',"9876-5432","Rua das Flores, 123, Bairro Jardim, Cidade Alegre","ana.silva@email.com"),
    (NULL,'Marcos Oliveira',"8765-4321","Av. Principal, 456, Bairro Centro, Cidade Feliz","marcos.oliveira@email.com"),
    (NULL,'Camila Santos',"7654-3210","Travessa da Paz, 789, Bairro Tranquilo, Cidade Serena","camila.santos@email.com"),
    (NULL,'Rafaela Lima',"6543-2109"," Rua da Alegria, 987, Bairro Feliz, Cidade Encantada","rafaela.lima@email.com"),
    (NULL,'Bruno Pereira',"5432-1098","Alameda dos Sonhos, 654, Bairro Esperança, Cidade Iluminada","bruno.pereira@email.com");
    
    
    
INSERT INTO venda VALUES
    (NULL,1,"2023-01-15",150.00,"Cartão de Credito"),
    (NULL,2,"2023-02-02",75.50,"Dinheiro"),
    (NULL,4,"2023-03-10",200.00,"PIX"),
    (NULL,5,"2023-04-05",120.25,"Cartao de Debito"),
    (NULL,3,"2023-05-20",90.80,"Cartão de Credito"),
    (NULL,2,"2023-06-15",180.50,"Vale-Alimentação");



INSERT INTO Fornecedor VALUES
    (NULL,'Distribuidora ABC Ltda',"9876-5432","Rua das Flores, 123, Bairro Jardim, Cidade Alegre","contato@DistribuidoraABC.com.br"),
    (NULL,'Mega Pharma Distribuidora',"8765-4321","Av. Principal, 456, Bairro Centro, Cidade Feliz","contato@megaPharma.com.br"),
    (NULL,'Suprimentos Médicos XYZ',"7654-3210","Travessa da Paz, 789, Bairro Tranquilo, Cidade Serena","contato@SuprimentosMedicos.com.br"),
    (NULL,'Beleza e Saúde Ltda',"6543-2109"," Rua da Alegria, 987, Bairro Feliz, Cidade Encantada","contato@BelezaSaude.com.br"),
    (NULL,'Pharma World Importadora',"5432-1098","Alameda dos Sonhos, 654, Bairro Esperança, Cidade Iluminada","contato@.PharmaWorld.com.br"),
    (NULL,'FarmaSuprimentos SA',"5432-1098","Alameda dos Sonhos, 654, Bairro Esperança, Cidade Iluminada","contato@farmasuprimentos.com.br");

 INSERT INTO categoria VALUES
		(NULL,"Medicamentos","Produtos farmacêuticos para tratamento de diversas condições de saúde","2023-01-10","2023-03-15"),
        (NULL,"Higiene Pessoal","Produtos para cuidados diários, incluindo sabonetes, xampus.","2023-02-05","2023-04-20"),
        (NULL,"Vitaminas e Suplementos","Suplementos nutricionais e vitaminas.","2023-03-12","2023-05-25"),
        (NULL,"Cuidados com o Bebê","Produtos específicos para bebês, como fraldas","2023-04-18","2023-06-10"),
        (NULL,"Dermocosméticos","Produtos cosméticos com propriedades dermatológicas","2023-05-02","2023-07-01"),
        (NULL,"Material Médico","Equipamentos e materiais médicos, incluindo curativos","2023-06-15","2023-08-05");
        
        
INSERT INTO Produto VALUES
        (NULL,"Analgex 500mg","Alívio rápido para dores intensas.",15.99,200,"Dinheiro",1,1),
        (NULL,"HydraCare Shampoo","Hidratação profunda para cabelos secos.",12.50,150,"Cartão de Crédito",2,2),
        (NULL,"C-Vit Boost 1000mg","Reforça o sistema imunológico.",22.00,100,"PIX",3,3),
        (NULL,"SafeHeal Curativo","Proteção contra infecções.",8.99,300,"Cartão de Débito",4,6),
        (NULL,"SunGuard Protetor Solar","Proteção eficaz contra raios UV.",30.00,120,"Transferência Bancária",5,5),
        (NULL,"ProGain Whey Protein","Auxilia no ganho de massa muscular.",45.50,80,"Vale-Alimentação",6,3);
        
        
 INSERT INTO Fornecimento VALUES
       (NULL, 1, 1, "2023-01-05", 500),
       (NULL, 2, 2, "2023-02-15", 300),
       (NULL, 3, 3, "2023-03-25", 200),
       (NULL, 4, 4, "2023-04-10", 100),
       (NULL, 5, 5, "2023-05-20", 150),
       (NULL, 6, 6, "2023-06-30", 250);

SELECT * FROM cliente;
SELECT * FROM venda;
SELECT * FROM Fornecedor;
SELECT * FROM Produto;
SELECT * FROM Fornecimento;

SELECT *
FROM Produto WHERE Produto.preco > 20.00;

SELECT *
FROM Produto WHERE Produto.preco BETWEEN 15.00 AND 60.00;

SELECT *
FROM Produto WHERE Produto.nome LIKE "%C%";


SELECT Produto.nome ,
categoria.nome AS categoria
FROM Produto 
INNER JOIN categoria
ON Produto.IDCategoria = categoria.id;


SELECT Produto.nome,
categoria.nome
FROM categoria
INNER JOIN Produto
ON Produto.IDCategoria = categoria.id
AND Produto.IDCategoria = 3;/*deve retornar as Vitaminas e Suplementos*/


 

SELECT Produto.nome AS Produto,
Categoria.nome AS Categoria
FROM categoria
INNER JOIN Produto
ON Produto.IDCategoria = categoria.id
INNER JOIN Fornecedor
ON Produto.IDFornecedor = Fornecedor.id;


SELECT Cliente.nome AS Cliente,
Venda.MétodoPagamento AS "Método de Pagamento"
FROM Cliente
INNER JOIN Venda
ON Venda.IDCliente = Cliente.id;
