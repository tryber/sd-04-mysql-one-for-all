USE SpotifyClone;
DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico (id INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE music_total INT;
select count(his.usuario_id)
from SpotifyClone.historico_de_reproducoes AS his
INNER JOIN SpotifyClone.usuarios AS usr
ON his.usuario_id = usr.usuario_id
WHERE usr.usuario_id = id INTO music_total;
RETURN music_total;
END $$

DELIMITER ;

-- CREATE FUNCTION quantidade_musicas_no_historico (usuario VARCHAR(15))
-- RETURNS INT READS SQL DATA
-- BEGIN
-- DECLARE music_total INT;
-- select count(his.usuario_id)
-- from SpotifyClone.historico_de_reproducoes AS his
-- INNER JOIN SpotifyClone.usuarios AS usr
-- ON his.usuario_id = usr.usuario_id
-- WHERE usr.usuario = usuario INTO music_total;
-- RETURN music_total;
-- END $$

-- DELIMITER ;

-- select quantidade_musicas_no_historico('Bill');
