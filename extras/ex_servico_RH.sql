
CREATE DATABASE IF NOT EXISTS servico_RH;

USE servico_RH;

CREATE TABLE IF NOT EXISTS colaborador(
id bigint AUTO_INCREMENT,
nome varchar (55) NOT NULL,
endereco varchar (55) NOT NULL,
email varchar (55) NULL,
telefone INT NULL,
dt_nasc date NULL,
salario decimal(6,2) NOT NULL,
PRIMARY KEY (id)
); 

INSERT INTO colaborador
VALUES  (NULL,"cleito", "rua dos cleito",NULL,119633666, "1960-12-20",1000.00),
		(NULL,"cleitin", "rua dos cleito","flksdjfs@gmail.com",1152682666, "1950-12-25",1300.00),
		(NULL,"cleitou", "rua dos cleito","fsdf@gmail.com",1194522166, "1950-2-2",1500.00),
		(NULL,"cleitao", "rua dos cleito",NULL,119633666, "1940-1-20",1600.00),
		(NULL,"clei", "rua dos cleito",NULL,119633666, "1970-3-5",2000.00),
		(NULL,"cleitosvaldo", "rua dos cleito",NULL,119633666, "1980-8-20",2500.00);

SELECT * FROM colaborador;

SELECT * FROM colaborador where salario > 2000;

SELECT * FROM colaborador where salario < 2000;

ALTER TABLE colaborador ADD estado_civil VARCHAR(30) NOT NULL;

/*cleitosvaldo*/
UPDATE colaborador SET salario = 3000 WHERE id = 6;

