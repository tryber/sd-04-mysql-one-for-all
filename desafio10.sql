DELIMITER $$
create function quantidade_musicas_no_historico(usuario_id int)
returns int reads sql data

begin
declare total_value int;
select count(h.musica_id) quantidade_musicas_no_historico from SpotifyClone.historicos h
where h.usuario_id = usuario_id
group by h.usuario_id into total_value;
return total_value;
END; $$
