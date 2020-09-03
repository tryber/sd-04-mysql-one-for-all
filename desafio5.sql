USE SpotifyClone;
CREATE VIEW top_2_hits_do_momento AS
SELECT musica AS musica,
(SELECT COUNT(musica_id) FROM historico WHERE historico.musica_id = cançoes.musica_id) AS reproducoes
FROM SpotifyClone.cançoes
ORDER BY reproducoes DESC, musica ASC
LIMIT 2;
