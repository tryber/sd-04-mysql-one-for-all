CREATE VIEW historico_reproducao_usuarios AS (
SELECT
(SELECT COUNT(usuario_id) FROM SpotifyClone.usuarios) AS usuario,
(SELECT COUNT(cancao) FROM SpotifyClone.cancoes) AS nome
);
