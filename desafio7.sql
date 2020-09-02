CREATE VIEW perfil_artistas AS
  (SELECT artistas.nome AS artista,
    albums.nome AS album,
    COUNT(sa.artista_id) AS seguidores
    FROM SpotifyClone.artistas AS artistas
    INNER JOIN SpotifyClone.albums AS albums
    ON artistas.id = albums.id_artista
    INNER JOIN SpotifyClone.seguindo_artistas AS sa
    ON artistas.id = sa.artista_id
    GROUP BY albums.nome, artistas.nome
    ORDER BY seguidores DESC, artista, album
);
