CREATE VIEW estatisticas_musicais AS
    SELECT 
        (SELECT 
                COUNT(c.nome)
            FROM
                cancao c) AS cancoes,
        (SELECT 
                COUNT(a.nome)
            FROM
                artista a) AS artistas,
        (SELECT 
                COUNT(ab.nome)
            FROM
                album ab) AS albuns;
