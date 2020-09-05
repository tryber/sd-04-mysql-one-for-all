select * from usuarios; select * from historico;

SELECT 
    c.cancao nome, COUNT(h.idcancao) reproducoes
FROM
    historico h
        INNER JOIN
    cancoes c ON c.idcancao = h.idcancao
        INNER JOIN
    usuarios u ON (u.idusuario = h.idusuario)
        AND (u.idplano = 2 OR u.idplano = 3)
GROUP BY c.cancao , h.idusuario;
