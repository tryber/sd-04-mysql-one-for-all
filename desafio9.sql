DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN nome_artista VARCHAR(50))
BEGIN
SELECT 
    a.nome AS artista, ab.nome AS album
FROM
    album ab
        JOIN
    artista AS a ON a.id = ab.artista_id
WHERE
    a.nome = nome_artista;
END $$
