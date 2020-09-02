CREATE VIEW historico_reproducao_usuarios AS
SELECT u.usuario_name as `usuario`, c.cancoes_name as `nome`
from SpotifyClone.usuario AS u
INNER JOIN SpotifyClone.cancoes AS chistorico_reproducao_usuarios
INNER JOIN SpotifyClone.historico AS h
WHERE u.usuario_id = h.id_usuario AND c.cancoes_id = h.id_cancoes
ORDER BY `usuario`, `nome`;
