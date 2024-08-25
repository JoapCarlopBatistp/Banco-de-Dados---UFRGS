
--Criação de todas as tabelas -----------------------------------------------------------------------------------------
--ENTIDADE CONTA
CREATE TABLE CONTA (
  ID int PRIMARY KEY,
  Login varchar(20) NOT NULL,
  Senha varchar(20) NOT NULL,
  NomeUsuario varchar(20) NOT NULL
);
--ENTIDADE PERFIL
CREATE TABLE PERFIL (
  Cidade varchar(30),
  País varchar(20),
  NomeUsuario varchar(20) REFERENCES CONTA(NomeUsuario) NOT NULL,
  Amigos int, 										
  DataCriacao date NOT NULL,
  RatingBullet int,
  RatingBlitz int,
  RatingRapidas int,
  RatingClassicas int,
  PRIMARY KEY(NomeUsuario)
);
--ENTIDADE USUARIOS NAO-ASSINANTES
CREATE TABLE USUARIOS_NAO_ASSINANTES (
  ID int REFERENCES CONTA(ID) NOT NULL,
  isMember boolean NOT NULL,
  PRIMARY KEY(ID)
);
--ENTIDADE USUARIOS ASSINANTES
CREATE TABLE USUARIOS_ASSINANTES (
  ID int REFERENCES CONTA(ID) NOT NULL,
  isMember boolean NOT NULL,
  PlanoAtual int,
  PRIMARY KEY(ID)
);
--ENTIDADE PARTIDAS JOGADAS
CREATE TABLE PARTIDAS_JOGADAS (
  ID int REFERENCES CONTA(ID) NOT NULL,
  Adversario varchar(20) NOT NULL,
  RatingAdversario int NOT NULL,
  RatingUsuario int NOT NULL,
  Cor varchar(7) NOT NULL,
  Resultado bit NOT NULL,
  Variante varchar(30) NOT NULL,
  PrecisaoAdversario int NOT NULL,
  PrecisaoUsuario int NOT NULL,
  Data_partida date NOT NULL,
  Lances varchar(500) NOT NULL,
  numeroLances int NOT NULL,
  PRIMARY KEY(Lances),
  SECONDARY KEY(Adversario)
);
--ENTIDADE ANUNCIOS
CREATE TABLE ANUNCIOS (
  Contratante varchar(20) NOT NULL,
  Link varchar(40) NOT NULL,
  Imagem image 
);

CREATE TABLE DISTINTIVOS (
  ID int REFERENCES CONTA(ID) NOT NULL,
  Nome varchar(20) NOT NULL,
  Icone image
  PRIMARY KEY(ID)
);

CREATE TABLE CONQUISTAS (
  ID int REFERENCES CONTA(ID) NOT NULL
  Nome varchar(20) NOT NULL,
  Descricao varchar(40)
);

CREATE TABLE BANCO_DE_PARTIDAS (
  Jogador1 varchar(20) NOT NULL,
  RatingJogador1 int NOT NULL,
  CorJogador1 int NOT NULL,
  Jogador2 varchar(20) NOT NULL,
  RatingJogador2 int NOT NULL,
  CorJogador2 int NOT NULL,
  PrecisaoJogador1 int NOT NULL,
  PrecisaoJogador2 int NOT NULL,
  Data_jogo date NOT NULL,
  Lances varchar(500) NOT NULL,
  NumeroLances int NOT NULL,
  Variante varchar(30) NOT NULL,
  Resultado int NOT NULL,
  PRIMARY KEY(Lances)
);

CREATE TABLE ABERTURAS (
  Nome varchar(30) NOT NULL,
  Lances varchar(100) NOT NULL
);

CREATE TABLE ARTIGOS (
  NomeAutor varchar(20) NOT NULL,
  NomeArtigo varchar(50) NOT NULL,
  Imagem image,
  Conteudo varchar(1000) NOT NULL
  PRIMARY KEY(NomeArtigo)
);

CREATE TABLE COMENTARIOS (
  NomeArtigo varchar(50) REFERENCES ARTIGOS(NomeArtigo) NOT NULL,
  NomeAutor varchar(20) NOT NULL,
  Conteudo varchar(100) NOT NULL
);

--Criação de todos os inserts para todas as tabelas ---------------------------------------------------------------------------
--INSERTS EM CONTA
INSERT INTO CONTA VALUES (0001, 'ocean_man@gmail.com', 'golfinho', 'Jotaro Kujoh');
INSERT INTO CONTA VALUES (0002, 'abc@gmail.com', '1234', 'Joao');
INSERT INTO CONTA VALUES (0003, 'login1@gmail.com', 'qwerty', 'Jose');
INSERT INTO CONTA VALUES (0004, 'login2@yahoo.com.br', '15678', 'Pedro');
INSERT INTO CONTA VALUES (0005, 'hahahaha@hotmail.com', 'euamoobatman123', 'Coringa');
INSERT INTO CONTA VALUES (0006, 'login@gmail.com', 'estousemcriatividade123', 'Renato');
INSERT INTO CONTA VALUES (0007, 'davidbowie@gmail.com', 'starman123', 'David');
INSERT INTO CONTA VALUES (0008, 'JCB@gmail.com', 'BCJ', 'JC');
INSERT INTO CONTA VALUES (0009, 'magnus@gmail.com', 'Xadrez', 'Magnus Carlsen');
INSERT INTO CONTA VALUES (0010, 'hikaru@gmail.com', 'Xadrez2', 'Hikaru Nakamura');
INSERT INTO CONTA VALUES (0011, 'Hermit@gmail.com', 'EuOdeioDioBrando123', 'Joseph Joestar');
INSERT INTO CONTA VALUES (0012, 'pinguim@gmail.com', 'pinguim', 'Pinguim01');

--INSERTS EM PERFIL
INSERT INTO CONTA VALUES ('Morioh', 'Japão', 'Jotaro Cujoh', 0011, 12-06-2004, 1000, 1200, 2000, 2500);
INSERT INTO CONTA VALUES ('abc', 'Brasil', 'Joao', NULL, 12-12-2004, 1050, 1500, 2003, 2520);
INSERT INTO CONTA VALUES ('Cidade', 'País', 'Jose', 0011, 12-11-2005, 1000, 1200, 2000, 2500);
INSERT INTO CONTA VALUES ('Cidade', 'país', 'Pedro', 0011, 15-05-2004, 100, 200, 20, 25);
INSERT INTO CONTA VALUES ('Morioh', 'Japão', 'Jotaro Cujoh', 0011, 12-01-2004, 1000, 1200, 2000, 2500);

--INSERTS EM USUARIOS NAO ASSINANTES


--INSERTS EM USUARIOS ASSINANTES


--INSERTS EM PARTIDAS USUARIOS

--INSERTS EM ANUNCIOS

--INSERTS EM DISTINTIVOS

--INSERTS EM CONQUISTAS

--INSERTS EM BANCO DE PARTIDAS

--INSERTS EM ABERTURAS

--INSERTS EM ARTIGOS

--INSERTS EM COMENTARIOS


-------------------------------------------------------------------------------------------------------------------------------------
--CONSULTAS E VISÕES ESTÃO NO OUTRO ARQUIVO