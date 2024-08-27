--VISÕES-------------------------------------------------------------------------------------------------------------------
--Visão para verificar quais contas estão mais ativas na plataforma verificando o numero de partidas jogadas
CREATE VIEW DetalhesPartidasContas AS
SELECT
    c.Nome AS NomeConta,
    COUNT(p.PartidaID) AS TotalPartidasJogadas,
    MAX(p.Data) AS UltimaPartida
FROM
    CONTAS c
LEFT JOIN
    PARTIDAS_JOGADAS p ON c.ContaID = p.ContaID
GROUP BY
    c.Nome;

--CONSULTAS----------------------------------------------------------------------------------------------------------------

--2 CONSULTAS UTILIZANDO GROUP BY

--Média de rating do usuário por abertura jogada
SELECT
    a.Nome AS Abertura,
    AVG(p.RatingUsuario) AS MediaRatingUsuario,
    AVG(b.RatingJogador1) AS MediaRatingJogador1,
    AVG(b.RatingJogador2) AS MediaRatingJogador2
FROM
    PARTIDAS_JOGADAS p
JOIN
    BANCO_DE_PARTIDAS b ON p.Lances = b.Lances
JOIN
    ABERTURAS a ON p.Variante = a.Nome
GROUP BY
    a.Nome
ORDER BY
    MediaRatingUsuario DESC;
--Número de partidas jogadas e vitórias por usuário e abertura
SELECT
    c.NomeUsuario AS Usuario,
    a.Nome AS Abertura,
    COUNT(p.ID) AS NumeroDePartidas,
    SUM(CASE WHEN p.Resultado = 1 THEN 1 ELSE 0 END) AS NumeroDeVitorias
FROM
    PARTIDAS_JOGADAS p
JOIN
    CONTA c ON p.ID = c.ID
JOIN
    ABERTURAS a ON p.Variante = a.Nome
GROUP BY
    c.NomeUsuario,
    a.Nome
ORDER BY
    Usuario, Abertura;

--2 CONSULTAS UTILIZANDO SUBCONSULTAS
--Nome das contas e total de partidas jogadas
SELECT
    Nome,
    (SELECT COUNT(*)
     FROM PARTIDAS_JOGADAS p
     WHERE p.ContaID = c.ContaID
       AND p.JogoID = j.JogoID) AS TotalPartidasJogadas
FROM
    CONTAS c,
    JOGOS j;
--Nome das contas e data da última partida jogada
SELECT
    Nome,
    (SELECT MAX(p.Data)
     FROM PARTIDAS_JOGADAS p
     WHERE p.ContaID = c.ContaID
       AND p.JogoID = j.JogoID) AS UltimaPartida
FROM
    CONTAS c,
    JOGOS j;

--No mínimo uma delas (diferente das consultas acima) deve necessitar do operador NOT EXISTS para responder questões do tipo TODOS ou NENHUM que <referencia> (isto é, não existe formulação equivalente usando simplesmente joins ou subconsultas com (NOT) IN ou demais operadores relacionais)
--Contas que não jogaram em uma data específica (no exemplo temos 2024-08-01)
SELECT
    Nome
FROM
    CONTAS c
WHERE
    NOT EXISTS (
        SELECT 1
        FROM PARTIDAS_JOGADAS p
        WHERE p.ContaID = c.ContaID
          AND p.Data = '2024-08-01'
    );

--2 CONSULTAS UTILIZANDO A VISÃO DEFINIDA NO PRIMEIRO ITEM

--Encontra contas que nunca jogaram
SELECT
    NomeConta
FROM
    DetalhesPartidasContas d
WHERE
    NOT EXISTS (
        SELECT 1
        FROM DetalhesPartidasContas d2
        WHERE d2.NomeConta = d.NomeConta
          AND d2.TotalPartidasJogadas > 0
    );
 --Encontra contas que só jogaram uma vez e antes de uma data fixa
SELECT
    NomeConta
FROM
    DetalhesPartidasContas d
WHERE
    TotalPartidasJogadas = 1
    AND UltimaPartida < '2024-08-01';