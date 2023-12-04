
CREATE DATABASE IF NOT EXISTS faculdade;

USE faculdade;

CREATE TABLE IF NOT EXISTS estudante(
id BIGINT AUTO_INCREMENT NOT NULL,
nome VARCHAR(50) NOT NULL,
genero VARCHAR(30) NOT NULL,
dt_nasc DATE NULL,
nota_P1 DECIMAL(6,2) NOT NULL,
nota_P2 DECIMAL(6,2) NOT NULL,
nota_Trabalho DECIMAL(6,2) NOT NULL,
Curso VARCHAR(50) NOT NULL,
email varchar (55) NULL,
PRIMARY KEY(id)
); 
 

INSERT INTO estudante
VALUES  (NULL,"Joao Silva", "masculino","2000-11-20",10,7.0, 7.2,"logistica",NULL),

		(NULL,"Maria Oliveira", "Feminino","2000-08-23",4,5.0, 8.2,"Medicina","maria.oliveira@email.com"),
        
		(NULL,"Ana Santos", "Feminino","2001-03-18",10.00,10.00,5.2,"Psicologia",NULL),
        
		(NULL,"Carlos Pereira", "masculino","1999-12-05",10,7.0, 7.2,"Administracao","carlos.pereira@email.com"),
        
		(NULL,"Laura Mendes", "Feminino","2002-06-25",5,7.0, 5.2,"Engenharia Civil",NULL),
        
		(NULL,"Rafael Costa", "masculino","2000-09-10",6,6.0, 7.2,"Direito",NULL),
        
        (NULL,"Camila Oliveira", "masculino","2001-11-30",5.5,5.0, 5.2,"Biologia",NULL),
        
        (NULL,"Pedro Martins", "masculino"," 2002-04-15",9,8, 8.2,"Ciencia da Computaxao",NULL),
        
        (NULL,"Isabella Ferreira", "Feminino","2001-07-22",4.5,9.5, 3.2,"Arquitetura","isabella.ferreira@email.com");


SELECT * FROM estudante;

SELECT nome,genero,curso,email,(nota_P1+nota_P2+nota_Trabalho)/3 as media FROM estudante where (nota_P1+nota_P2+nota_Trabalho)/3 >7.0;

SELECT nome,genero,curso,email,(nota_P1+nota_P2+nota_Trabalho)/3 as media FROM estudante where (nota_P1+nota_P2+nota_Trabalho)/3 <7.0;

ALTER TABLE estudante MODIFY Curso VARCHAR(40) NOT NULL;

UPDATE estudante SET nota_P1  = 10.00,nota_P2=8 WHERE id = 9;

