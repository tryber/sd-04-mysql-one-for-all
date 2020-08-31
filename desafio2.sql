CREATE VIEW estatisticas_musicais AS
SELECT COUNT(cancao) AS cancoes,
(SELECT COUNT(artista) FROM artistas) AS artistas,
(SELECT COUNT(album) FROM albuns) AS albuns
FROM cancoes;
