create view historico_reproducao_usuarios as 
select u.usuario as usuario, m.nome_musica as nome from SpotifyClone.usuarios u
inner join SpotifyClone.historicos h on h.usuario_id=u.usuario_id
inner join SpotifyClone.musicas m on m.musica_id=h.musica_id
order by usuario;
