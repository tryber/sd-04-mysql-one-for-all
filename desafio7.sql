CREATE VIEW perfil_artistas as
SELECT DISTINCT
    a.artista,
    al.album,
    (SELECT 
            COUNT(sa.idartista)
        FROM
            seguindo_artista sa
        WHERE
            sa.idartista = a.idartista) seguidores
FROM
    artistas a
        INNER JOIN
    albuns al ON al.idartista = a.idartista
ORDER BY seguidores DESC , artista , album;
  