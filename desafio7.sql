CREATE VIEW perfil_artistas AS
SELECT 
  art.nome_artista AS 'artista',
    alb.titulo_album AS 'album',
    COUNT(seg.usuario_id) AS 'seguidores'
FROM
    SpotifyClone.artistas AS art INNER JOIN SpotifyClone.albuns AS alb ON art.artista_id = alb.artista_id
    INNER JOIN SpotifyClone.seguindo_artistas AS seg ON seg.artista_id = art.artista_id GROUP BY album_id
    ORDER BY 3 DESC, 1, 2;
