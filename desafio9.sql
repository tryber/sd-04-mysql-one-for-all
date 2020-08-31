USE SpotifyClone;
DELIMITER $$

CREATE PROCEDURE albuns_do_artista(nome VARCHAR(50))
BEGIN
SELECT A.nome_artista AS 'artista',
AB.nome_do_album AS `album`
FROM SpotifyClone.artista AS A
JOIN SpotifyClone.album AS AB ON A.id = AB.artista_id
WHERE A.nome_artista = nome
ORDER BY `album`;
END $$

DELIMITER ;

CALL albuns_do_artista('Walter Phoenix');
