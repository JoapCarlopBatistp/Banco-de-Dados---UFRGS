
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
INSERT INTO CONTA VALUES (0001, 'ocean_man@gmail.com', 'golfinho', 'Jotaro Cujoh');
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
INSERT INTO CONTA VALUES (0012, 'dutchvanderlinde@gmail.com', 'plan', 'Dutch');

--INSERTS EM PERFIL
INSERT INTO PERFIL VALUES ('Morioh', 'Japão', 'Jotaro Cujoh', 0011, 12-06-2004, 1000, 1200, 2000, 2500);
INSERT INTO PERFIL VALUES ('abc', 'Brasil', 'Joao', NULL, 12-12-2004, 1050, 1500, 2003, 2520);
INSERT INTO PERFIL VALUES ('Cidade', 'País', 'Jose', 0011, 12-11-2005, 1000, 1200, 2000, 2500);
INSERT INTO PERFIL VALUES ('Cidade', 'país', 'Pedro', 0011, 15-05-2004, 100, 200, 20, 25);
INSERT INTO PERFIL VALUES ('Gotham', 'EUA', 'Coringa', 0002, 09-03-1999, 1000, 1230, 2800, 2500);
INSERT INTO PERFIL VALUES ('São Paulo', 'Brasil', 'Renato', 0002, 24-08-2007, 0, 0, 0, 0);
INSERT INTO PERFIL VALUES ('Nova Iorque', 'EUA', 'David', 0003, 12-01-2004, 2000, 2200, 3000, 3500);
INSERT INTO PERFIL VALUES ('Porto Alegre', 'Brasil', 'JC', 0001, 22-02-2004, 2000, 3200, 4000, 3500);
INSERT INTO PERFIL VALUES ('Cidade Norueguesa 123', 'Noruega', 'Magnus Carlsen', 0010, 30-06-2000, 5000, 5200, 5000, 5500);
INSERT INTO PERFIL VALUES ('Cidade dos EUA aleatoria', 'EUA', 'Hikaru Nakamura', 0009, 01-07-1999, 4000, 4200, 4000, 4500);
INSERT INTO PERFIL VALUES ('Londres', 'UK', 'Joseph Joestar', 0001, 13-06-1950, 2000, 1200, 2000, 2500);
INSERT INTO PERFIL VALUES ('Plan City', 'Tahiti', 'Dutch', 0007, 12-01-1860, 3000, 2200, 3000, 2500);

--INSERTS EM USUARIOS NAO ASSINANTES
INSERT INTO USUARIOS_NAO_ASSINANTES VALUES (0002, false);
INSERT INTO USUARIOS_NAO_ASSINANTES VALUES (0003, false);
INSERT INTO USUARIOS_NAO_ASSINANTES VALUES (0004, false);
INSERT INTO USUARIOS_NAO_ASSINANTES VALUES (0005, false);
INSERT INTO USUARIOS_NAO_ASSINANTES VALUES (0006, false);
INSERT INTO USUARIOS_NAO_ASSINANTES VALUES (0007, false);
INSERT INTO USUARIOS_NAO_ASSINANTES VALUES (0008, false);
INSERT INTO USUARIOS_NAO_ASSINANTES VALUES (0011, false);
INSERT INTO USUARIOS_NAO_ASSINANTES VALUES (0012, false);

--INSERTS EM USUARIOS ASSINANTES
INSERT INTO USUARIOS_ASSINANTES VALUES (0001, true, 0);
INSERT INTO USUARIOS_ASSINANTES VALUES (0009, true, 1);
INSERT INTO USUARIOS_ASSINANTES VALUES (0010, true, 2);

--INSERTS EM PARTIDAS USUARIOS
INSERT INTO PARTIDAS_JOGADAS VALUES (0009, 'Dutch', 2200, 4200, 'Pretas', 1, 'Siciliana dragão', 45, 99, 19-06-2000, "Cc3Cd6e4e5", 4);
INSERT INTO PARTIDAS_JOGADAS VALUES (0012, 'Magnus Carlsen', 4200, 2200, 'Brancas', 0, 'Siciliana dragão', 99, 45, 19-06-2000, Cc3Cd6e4e5, 4);
INSERT INTO PARTIDAS_JOGADAS VALUES (0011, 'Joao', 1050, 1000, 'Brancas', 1, 'Abertura Espanhola', 1200, 1000, '2004-06-12', 'e4 e5 Nf3 Nc6 Bb5 a6', 12);
INSERT INTO PARTIDAS_JOGADAS VALUES (0004, 'Pedro', 100, 1200, 'Pretas', 0, 'Defesa Francesa', 200, 1200, '2004-05-15', 'e4 e6 d4 d5', 8);
INSERT INTO PARTIDAS_JOGADAS VALUES (0003, 'Renato', 0, 1230, 'Brancas', 1, 'Defesa Siciliana', 0, 1230, '1999-03-09', 'e4 c5 Nf3 d6 d4 cxd4', 7);
INSERT INTO PARTIDAS_JOGADAS VALUES (0008, 'JC', 2000, 2200, 'Pretas', 0, 'Abertura Catalã', 3200, 2200, '2004-01-12', 'd4 d5 c4 e6 Nf3', 8);
INSERT INTO PARTIDAS_JOGADAS VALUES (0010, 'Hikaru Nakamura', 4000, 5000, 'Brancas', 1, 'Defesa Alekhine', 4200, 5000, '2000-06-30', 'e4 Nf6 e5 Nd5', 10);
INSERT INTO PARTIDAS_JOGADAS VALUES (0009, 'Magnus Carlsen', 5200, 4000, 'Pretas', 0, 'Gambito Evans', 4200, 3000, '2000-06-30', 'e4 e5 Nf3 Nc6 Bc4 Bc5 c3', 10);
INSERT INTO PARTIDAS_JOGADAS VALUES (0007, 'David', 2200, 2400, 'Brancas', 1, 'Defesa Caro-Kann', 2200, 2400, '2004-07-10', 'e4 c6 d4 d5', 8);
INSERT INTO PARTIDAS_JOGADAS VALUES (0008, 'JC', 2000, 1500, 'Pretas', 0, 'Abertura Inglesa', 2200, 1500, '2004-08-25', 'c4 e5 Nf3 d6', 7);
INSERT INTO PARTIDAS_JOGADAS VALUES (0012, 'Dutch', 3000, 3500, 'Brancas', 1, 'Gambito da Dama', 2200, 3500, '1860-01-12', 'd4 d5 c4', 5);
INSERT INTO PARTIDAS_JOGADAS VALUES (0011, 'Joseph Joestar', 1200, 1500, 'Pretas', 0, 'Abertura Réti', 1500, 1200, '2004-06-12', 'Nf3 d4 c4', 6);
INSERT INTO PARTIDAS_JOGADAS VALUES (0007, 'David', 2200, 2000, 'Brancas', 1, 'Defesa Siciliana', 2200, 2000, '2004-01-12', 'e4 c5', 6);
INSERT INTO PARTIDAS_JOGADAS VALUES (0010, 'Magnus Carlsen', 5200, 4200, 'Pretas', 1, 'Abertura Bird', 5200, 4200, '2005-03-15', 'f4 d5', 4);
INSERT INTO PARTIDAS_JOGADAS VALUES (0012, 'Dutch', 3000, 3000, 'Brancas', 0, 'Defesa Grünfeld', 3000, 3000, '2004-09-30', 'd4 g6 c4 Bg7', 7);
INSERT INTO PARTIDAS_JOGADAS VALUES (0010, 'Hikaru Nakamura', 4000, 3500, 'Pretas', 1, 'Gambito da Dama', 4000, 3500, '2004-10-10', 'd4 d5 c4 e6', 8);
INSERT INTO PARTIDAS_JOGADAS VALUES (0008, 'JC', 2000, 2000, 'Brancas', 1, 'Defesa Francesa', 2000, 2000, '2005-04-12', 'e4 e6 d4 d5', 8);
--TERMINAR ESSES INSERTS MAIS TARDE 

--INSERTS EM ANUNCIOS
INSERT INTO ANUNCIOS VALUES ('Empresa1', 'https://linkdaempresa1.com');
INSERT INTO ANUNCIOS VALUES ('Industrias Wayne', 'https://NossoDonoNaoÉOBatman.com');
INSERT INTO ANUNCIOS VALUES ('Aperture Science', 'https://still_alive.com');
INSERT INTO ANUNCIOS VALUES ('Vault-Tec', 'https://VaultTecCorporation.com');
INSERT INTO ANUNCIOS VALUES ('Deep Rock Galactic', 'https://RockAndStone.com');

--INSERTS EM DISTINTIVOS
INSERT INTO DISTINTIVOS(ID, Nome) VALUES (0009, 'TOP 10 Jogadores');
INSERT INTO DISTINTIVOS(ID, Nome) VALUES (0010, 'TOP 10 Jogadores');
INSERT INTO DISTINTIVOS(ID, Nome) VALUES (0001, 'Assinatura ouro');
INSERT INTO DISTINTIVOS(ID, Nome) VALUES (0009, 'Assinatura diamante');
INSERT INTO DISTINTIVOS(ID, Nome) VALUES (0010, 'Assinatura platina');

--INSERTS EM CONQUISTAS
INSERT INTO CONQUISTAS VALUES (0001, 'Primeiros passos', 'Jogou sua primeira partida');
INSERT INTO CONQUISTAS VALUES (0001, 'Jogador Veterano', 'Iniciou no jogo 3 anos atrás');
INSERT INTO CONQUISTAS VALUES (0001, 'Mestre de aberturas', 'Jogou todas as aberturas ao menos uma vez');
INSERT INTO CONQUISTAS VALUES (0002, 'Primeiros passos', 'Jogou sua primeira partida');
INSERT INTO CONQUISTAS VALUES (0002, 'Vitória em torneio', 'Ganhou seu primeiro torneio');
INSERT INTO CONQUISTAS VALUES (0009, 'Primeiros passos', 'Jogou sua primeira partida');
INSERT INTO CONQUISTAS VALUES (0010, 'Primeiros passos', 'Jogou sua primeira partida');
INSERT INTO CONQUISTAS VALUES (0012, 'Primeiros passos', 'Jogou sua primeira partida');
INSERT INTO CONQUISTAS VALUES (0009, 'TOP 10', 'Entrou no top 10 do ranking de jogadores');
INSERT INTO CONQUISTAS VALUES (0010, 'TOP 10', 'Entrou no top 10 do ranking de jogadores');
INSERT INTO CONQUISTAS VALUES (0009, 'Jogador Veterano', 'Iniciou no jogo 3 anos atrás');
INSERT INTO CONQUISTAS VALUES (0005, 'Primeiros passos', 'Jogou sua primeira partida');

--INSERTS EM BANCO DE PARTIDAS
INSERT INTO BANCO_DE_PARTIDAS VALUES ('Jotaro Cujoh', 1000, 1, 'Joao', 1050, 2, 1200, 1500, '2004-06-12', 'e4 e5 Nf3 Nc6 Bb5 a6', 12, 'Abertura Espanhola', 1);
INSERT INTO BANCO_DE_PARTIDAS VALUES ('Jose', 1000, 1, 'Pedro', 100, 2, 1200, 200, '2004-05-15', 'e4 e5 Nf3 Nc6 Bb5 a6', 12, 'Abertura Espanhola', 0);
INSERT INTO BANCO_DE_PARTIDAS VALUES ('Coringa', 1000, 1, 'Renato', 0, 2, 1230, 0, '1999-03-09', 'd4 Nf6 c4 e6', 8, 'Defesa Francesa', 1);
INSERT INTO BANCO_DE_PARTIDAS VALUES ('David', 2000, 1, 'JC', 2000, 2, 2200, 3200, '2004-01-12', 'e4 e5 Nf3 Nc6 Bb5 a6', 10, 'Abertura Espanhola', 1);
INSERT INTO BANCO_DE_PARTIDAS VALUES ('Magnus Carlsen', 5000, 1, 'Hikaru Nakamura', 4000, 2, 5200, 4200, '2000-06-30', 'e4 e5 Nf3 Nc6 Bb5 a6', 10, 'Abertura Espanhola', 1);
INSERT INTO BANCO_DE_PARTIDAS VALUES ('Joseph Joestar', 2000, 1, 'Dutch', 3000, 2, 1200, 2200, '1950-06-13', 'e4 e5 Nf3 Nc6 Bb5 a6', 10, 'Abertura Espanhola', 0);
INSERT INTO BANCO_DE_PARTIDAS VALUES ('Dutch', 3000, 1, 'Mikhail Tal', 3000, 2, 2200, 3000, '1860-01-12', 'e4 e5 Nf3 Nc6 Bb5 a6', 10, 'Abertura Espanhola', 1);
INSERT INTO BANCO_DE_PARTIDAS VALUES ('Jotaro Cujoh', 1000, 1, 'David', 2000, 2, 1200, 2200, '2004-06-12', 'e4 e5 Nf3 Nc6 Bb5 a6', 12, 'Abertura Espanhola', 1);
INSERT INTO BANCO_DE_PARTIDAS VALUES ('Joao', 1050, 1, 'JC', 2000, 2, 1500, 3200, '2004-12-12', 'd4 d5 c4 e6', 8, 'Defesa Francesa', 0);
INSERT INTO BANCO_DE_PARTIDAS VALUES ('Jose', 1000, 1, 'Renato', 0, 2, 1200, 0, '2005-11-12', 'e4 e5 Nf3 Nc6 Bb5 a6', 12, 'Abertura Espanhola', 1);
INSERT INTO BANCO_DE_PARTIDAS VALUES ('Pedro', 100, 1, 'Mikhail Tal', 3000, 2, 200, 3000, '2004-05-15', 'e4 e5 Nf3 Nc6 Bb5 a6', 10, 'Abertura Espanhola', 0);
INSERT INTO BANCO_DE_PARTIDAS VALUES ('Coringa', 1230, 1, 'Dutch', 3000, 2, 2200, 2200, '1999-03-09', 'd4 d5 c4 e6', 8, 'Defesa Francesa', 1);
INSERT INTO BANCO_DE_PARTIDAS VALUES ('David', 2200, 1, 'JC', 3200, 2, 2200, 3200, '2004-01-12', 'e4 e5 Nf3 Nc6 Bb5 a6', 10, 'Abertura Espanhola', 1);
INSERT INTO BANCO_DE_PARTIDAS VALUES ('Magnus Carlsen', 5200, 1, 'Hikaru Nakamura', 4200, 2, 5200, 4200, '2000-06-30', 'e4 e5 Nf3 Nc6 Bb5 a6', 10, 'Abertura Espanhola', 1);
INSERT INTO BANCO_DE_PARTIDAS VALUES ('Joseph Joestar', 1200, 1, 'David', 2000, 2, 2200, 2200, '1950-06-13', 'd4 d5 c4 e6', 8, 'Defesa Francesa', 0);
INSERT INTO BANCO_DE_PARTIDAS VALUES ('Dutch', 2200, 1, 'Magnus Carlsen', 5000, 2, 2200, 5200, '1860-01-12', 'e4 e5 Nf3 Nc6 Bb5 a6', 10, 'Abertura Espanhola', 1);
INSERT INTO BANCO_DE_PARTIDAS VALUES ('Jotaro Cujoh', 1200, 1, 'Hikaru Nakamura', 4000, 2, 1500, 4200, '2004-06-12', 'e4 e5 Nf3 Nc6 Bb5 a6', 12, 'Abertura Espanhola', 0);
--INSERTS EM ABERTURAS
INSERT INTO ABERTURAS VALUES ('Abertura Espanhola', 'e4 e5 Nf3 Nc6 Bb5');
INSERT INTO ABERTURAS VALUES ('Defesa Siciliana', 'e4 c5');
INSERT INTO ABERTURAS VALUES ('Gambito da Dama', 'd4 d5 c4');
INSERT INTO ABERTURAS VALUES ('Abertura Italiana', 'e4 e5 Nf3 Nc6 Bc4');
INSERT INTO ABERTURAS VALUES ('Defesa Francesa', 'e4 e6 d4 d5');
INSERT INTO ABERTURAS VALUES ('Abertura Inglesa', 'c4');
INSERT INTO ABERTURAS VALUES ('Defesa Nimzo-Índia', 'd4 Nf6 c4 e6 Nc3 Bb4');
INSERT INTO ABERTURAS VALUES ('Abertura Catalã', 'd4 d5 c4 e6 Nf3');
INSERT INTO ABERTURAS VALUES ('Defesa Alekhine', 'e4 Nf6 e5 Nd5');
INSERT INTO ABERTURAS VALUES ('Gambito Evans', 'e4 e5 Nf3 Nc6 Bc4 Bc5 c3');
INSERT INTO ABERTURAS VALUES ('Abertura Bird', 'f4 d5');
INSERT INTO ABERTURAS VALUES ('Defesa Grünfeld', 'd4 g6 c4 Bg7');
INSERT INTO ABERTURAS VALUES ('Abertura Alekhine', 'e4 Nf6 e5 Nd5 d4 d6');
INSERT INTO ABERTURAS VALUES ('Defesa Caro-Kann', 'e4 c6 d4 d5');
INSERT INTO ABERTURAS VALUES ('Abertura Réti', 'Nf3 d4 c4');
--INSERTS EM ARTIGOS
INSERT INTO ARTIGOS (NomeAutor,NomeArtigo,Conteudo) VALUES ('Magnus Carlsen', 'Como jogar melhor', 'Jogue melhor jogue melhor jogue melhor');
INSERT INTO ARTIGOS (NomeAutor,NomeArtigo,Conteudo) VALUES ('Dutch', 'Como construir um plano de ataque', 'Eu tenho um plano eu tenho um plano');
INSERT INTO ARTIGOS (NomeAutor,NomeArtigo,Conteudo) VALUES ('Hikaru Nakamura', 'Lorem ipsum dolor', 'sit amet');
INSERT INTO ARTIGOS (NomeAutor,NomeArtigo,Conteudo) VALUES ('Jotaro Cujoh', 'Como lidar com partidas com tempo', 'bla bla bla bla bla bla bla');

--INSERTS EM COMENTARIOS
INSERT INTO COMENTARIOS VALUES ('Como lidar com partidas com tempo', 'Joseph Joestar', 'Informações muito úteis');
INSERT INTO COMENTARIOS VALUES ('Como construir um plano de ataque', 'Coringa', 'HAHAHAHAHAHAHAHAHAHA');
INSERT INTO COMENTARIOS VALUES ('Como jogar melhor', 'Hikaru Nakamura', 'Não gostei');
INSERT INTO COMENTARIOS VALUES ('Lorem ipsum dolor', 'JC', 'consectetur adipiscing elit');

-------------------------------------------------------------------------------------------------------------------------------------
--CONSULTAS E VISÕES ESTÃO NO OUTRO ARQUIVO