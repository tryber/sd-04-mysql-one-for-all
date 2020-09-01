CREATE VIEW perfil_artistas AS
SELECT 
    A.nome AS 'artista',
    AL.titulo AS 'album',
    COUNT(S.usuario_id) AS 'seguidores'
FROM
    SpotifyClone.artistas AS A INNER JOIN SpotifyClone.albuns AS AL ON A.artista_id = AL.artista_id
    INNER JOIN SpotifyClone.seguindo_artista AS S ON S.artista_id = A.artista_id GROUP BY album_id
    ORDER BY 3 DESC, 1, 2;
    