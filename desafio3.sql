CREATE VIEW historico_reproducao_usuarios as
select US.usuario usuario, C.cancao nome
from usuarios US
inner JOIN historico H on H.idusuario = US.idusuario
inner JOIN cancoes C on C.idcancao = H.idcancao
order by usuario, nome;
