CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        usr.nome AS 'usuario', musc.nome AS 'nome'
    FROM
        SpotifyClone.Usuario AS usr
            INNER JOIN
        SpotifyClone.Historico_Reproducao AS hist ON usr.id = hist.usuario_id
            INNER JOIN
        SpotifyClone.Musica AS musc ON hist.musica_id = musc.id
    ORDER BY usr.nome ASC , musc.nome ASC;
