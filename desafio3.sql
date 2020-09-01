CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        usuario.nome AS `usuario`, cancoes.nome AS `nome`
    FROM
        SpotifyClone.usuarios AS usuario
        INNER JOIN SpotifyClone.usuarios_cancoes AS historico ON historico.usuario_id = usuario.id
        INNER JOIN SpotifyClone.cancoes AS cancoes ON cancoes.id = historico.cancao_id
ORDER BY `usuario`, `nome`;
