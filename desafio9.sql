DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN nome VARCHAR(30))
BEGIN
SELECT artistas.nome AS artista,
  albuns.nome AS album
FROM albuns
  JOIN artista AS a 
  ON a.artista_id = albuns.artista_id
WHERE artista = a.nome;
END
$$ DELIMITTER;
