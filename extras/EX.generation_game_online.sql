CREATE DATABASE db_generation_game_online;
/*DROP DATABASE db_generation_game_online;*/
USE db_generation_game_online;

CREATE TABLE classe(
id BIGINT AUTO_INCREMENT NOT NULL,
nome VARCHAR(50) NOT NULL,
Descricao VARCHAR(50) NOT NULL,
HabilidadeEspecial VARCHAR(50) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE personagem(
id BIGINT AUTO_INCREMENT NOT NULL,
nome VARCHAR(50) NOT NULL,
IDClasse BIGINT NOT NULL,
Nivel BIGINT NOT NULL,
XP BIGINT NOT NULL,
PontosVida BIGINT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (IDClasse) REFERENCES classe(id)
);

CREATE TABLE Atributo(
id BIGINT AUTO_INCREMENT NOT NULL,
nome VARCHAR(50) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE AtributosClasse(
IDClasse BIGINT NOT NULL,
IDAtributo BIGINT NOT NULL,
Valor BIGINT NOT NULL,
FOREIGN KEY (IDClasse) REFERENCES classe(id),
FOREIGN KEY (IDAtributo) REFERENCES Atributo(id)
);

INSERT INTO classe VALUES (NULL,"Guerreiro","Combatente corpo a corpo resistente","Ataque Poderoso"),
(NULL,"Ladino","Especialista em furtividade e truques","Ataque Surpresa"),
(NULL,"Mago","Lançador de feiticos poderosos","Bola de Fogo"),
(NULL,"Paladino","Guerreiro sagrado com habilidades de cura","Aura de Protecao"),
(NULL,"Bardo","Mestre das artes performaticas e sociais","Cancao Inspiradora");



INSERT INTO personagem VALUES (NULL,"Herói1",2,5,1200,35),
(NULL,"Feiticeiro",3,8,800,25),
(NULL,"Guardiao",	1,7,2500,50),
(NULL,"Ladrao",2,2,400,20),
(NULL,"Mago",3,6,1800,40),
(NULL,"curandeiro",4,10,2000,40);



INSERT INTO Atributo VALUES (NULL,"Forca"),
(NULL,"Destreza"),
(NULL,"Inteligencia"),
(NULL,"Constituicao"),
(NULL,"Carisma");


/*guerreiro*/
INSERT INTO AtributosClasse VALUES (1,1,8),
(1,2,5),
(1,3,2),
(1,4,10),
(1,5,4);



/*Ladino*/
INSERT INTO AtributosClasse VALUES (2,1,5),
(2,2,8),
(2,3,6),
(2,4,4),
(2,5,7);



/*Mago*/
INSERT INTO AtributosClasse VALUES (3,1,2),
(3,2,4),
(3,3,10)
(3,4,3),
(3,5,6);


/*Paladino*/
INSERT INTO AtributosClasse VALUES (4,1,7),
(4,2,5),
(4,3,4),
(4,4,8),
(4,5,9);


/*Bardo*/
INSERT INTO AtributosClasse VALUES (5,1,3),
(5,2,6),
(5,3,8),
(5,4,5),
(5,5,9);

SELECT * FROM personagem;
SELECT * FROM Classe;
SELECT * FROM Atributo;
SELECT * FROM AtributosClasse;


SELECT personagem.nome as personagem,
atributo.nome AS atributo,
AtributosClasse.Valor 
FROM personagem 
INNER JOIN atributo
ON  atributo.nome LIKE "forca"
INNER JOIN AtributosClasse 
ON Personagem.IDClasse = AtributosClasse.IDClasse
AND AtributosClasse.Valor >5
AND AtributosClasse.IDAtributo = 1;

SELECT personagem.nome as personagem,
atributo.nome AS atributo,
AtributosClasse.Valor 
FROM personagem 
INNER JOIN atributo
ON  atributo.nome LIKE "Destreza"
INNER JOIN AtributosClasse 
ON Personagem.IDClasse = AtributosClasse.IDClasse
AND AtributosClasse.Valor >=6
AND AtributosClasse.IDAtributo = 2;


SELECT *
FROM personagem WHERE personagem.nome LIKE "%c%";

SELECT personagem.nome,personagem.Nivel,classe.Descricao,classe.nome,classe.HabilidadeEspecial
FROM personagem 
INNER JOIN classe
ON classe.id = personagem.IDClasse;

SELECT personagem.nome,personagem.Nivel,classe.nome,classe.HabilidadeEspecial
FROM personagem 
INNER JOIN classe
ON classe.nome LIKE "mago"
AND personagem.IDClasse = 3;/*deve retornar magos*/
