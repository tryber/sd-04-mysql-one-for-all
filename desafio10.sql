USE SpotifyClone;

DROP PROCEDURE IF EXISTS albuns_do_artista;

DELIMITER $ $ CREATE PROCEDURE albuns_do_artista(IN nome VARCHAR(100)) BEGIN
SELECT
    a.nome artista,
    ab.titulo album
FROM
    SpotifyClone.artistas a
    INNER JOIN SpotifyClone.albuns ab ON ab.artista_id = a.artista_id
WHERE
    a.nome LIKE (nome)
ORDER BY
    ab.titulo;

END $ $ DELIMITER;
