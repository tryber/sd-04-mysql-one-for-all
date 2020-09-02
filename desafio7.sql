CREATE VIEW perfil_artistas AS
SELECT
  ar.nome AS 'artista',
  al.titulo AS 'album',
  count(s.artistas_id) AS 'seguidores'
FROM SpotifyClone.artistas AS ar
INNER JOIN SpotifyClone.albuns AS al ON ar.id = al.artista_id
INNER JOIN SpotifyClone.artistas_seguidos AS s ON ar.id = s.artistas_id
GROUP BY ar.nome, al.titulo
ORDER BY
  `seguidores` DESC,
  `artista`,
  `album`;
