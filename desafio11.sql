SELECT 
    s.name AS nome,
    COUNT(*) AS reproducoes
FROM
    SpotifyClone.song AS s
        JOIN
    SpotifyClone.playback_history AS play ON play.id_song = s.id
        JOIN
-- SELECIONA PARA CONTAGEM SOMENTE AS REPRODUÇÕES DE PLANOS NÃO GRATUITOS (ID do plano gratuito === 1)
    SpotifyClone.user AS u ON u.id = play.id_user AND u.id_plan <> 1
GROUP BY nome
ORDER BY nome;
