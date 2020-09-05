DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

  /* 1-tabela plano*/
  CREATE TABLE SpotifyClone.plano(
  plano_id INT NOT NULL AUTO_INCREMENT UNIQUE,
  plano VARCHAR(45) NOT NULL,
  valor_plano DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (plano_id));

/* 2-tabela usuario*/
CREATE TABLE SpotifyClone.usuario (
    usuario_id INT NOT NULL AUTO_INCREMENT,
    idade INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    plano_id INT NULL,
    CONSTRAINT pk_usuario_id primary key(usuario_id),
    CONSTRAINT fk_plano_id FOREIGN KEY (plano_id)
    REFERENCES SpotifyClone.plano (plano_id));

/* 3-tabela artista*/
CREATE TABLE SpotifyClone.artista (
  artista_id INT NOT NULL UNIQUE,
  nome VARCHAR(100) NOT NULL,
  PRIMARY KEY (`artista_id`));
  
/* 4-tabela seguir artista*/
CREATE TABLE `SpotifyClone`.`seguir_artista` (
  `usuario_id` INT NOT NULL,
  `artista_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`, `artista_id`),
  INDEX `fk_artista_id_idx` (`artista_id` ASC) VISIBLE,
  CONSTRAINT `fk_seguir_artista_1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `SpotifyClone`.`usuario` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_artista_id`
    FOREIGN KEY (`artista_id`)
    REFERENCES `SpotifyClone`.`artista` (`artista_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

/* 5-tabela album*/
CREATE TABLE SpotifyClone.album (
  album_id INT NOT NULL AUTO_INCREMENT UNIQUE,
  albuns VARCHAR(50) NOT NULL,
  artista_id int null,
  CONSTRAINT pk_album_id PRIMARY KEY (album_id),
  FOREIGN KEY (artista_id)
  REFERENCES SpotifyClone.artista(artista_id)
  );


/* 6-tabela canção*/
CREATE TABLE SpotifyClone.cancao (
  cancao_id INT NOT NULL AUTO_INCREMENT UNIQUE,
  cancoes VARCHAR(50) NULL,
  album_id int null,
  PRIMARY KEY (cancao_id),
  FOREIGN KEY (album_id)
  REFERENCES SpotifyClone.album(album_id)
  );

  /* 7-tabela historico de producao*/
  CREATE TABLE `SpotifyClone`.`historico_reproducao` (
  `usuario_id` INT NOT NULL,
  `cancao_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`, `cancao_id`),
    FOREIGN KEY (`usuario_id`)
    REFERENCES `SpotifyClone`.`usuario` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`cancao_id`)
    REFERENCES `SpotifyClone`.`cancao` (`cancao_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    INSERT INTO plano(plano_id,plano, valor_plano)
    VALUES (NULL, "gratuito",0),(NULL,"familiar",7.99),(NULL,"universitario",5.99);
    
    insert into usuario(usuario_id,idade,nome,plano_id)
    values (null,23,"Thati",1),(null,35,"Cintia",2),(null,20,"Bill",3),(null,45,"Roger",1);
    
    insert into artista(artista_id,nome)
    values (1,"Walter Phoenix"),(2,"Peter Strong"),(3,"Lance Day"),(4,"Freedie Shannon");
    
    insert into album(album_id,albuns,artista_id)
    values(null,"Envious",1),(null,"Exuberant",1),(null,"Hallowed Steam",2),(null,"Incandescent",3),(null,"Temporary Culture",4);
    
    insert into cancao(cancao_id,cancoes,album_id)
    values(null,"Soul For Us",1),(null,"Reflections Of Magic",1),(null,"Dance With Her Own",1),(null,"Troubles Of My Inner Fire",2),
    (null,"Time Fireworks",2),(null,"Magic Circus",3),(null, "Honey, So Do I",3),(null,"Sweetie, Let's Go Wild",3),
    (null,"She Knows",3),(null,"Fantasy For Me",4),(null,"Celebration Of More",4),(null,"Rock His Everything",4),(null,"Home Forever",4),
    (null, "Diamond Power",4),(null,"Honey, Let's Be Silly",4),(null,"Thang Of Thunder",5),(null, "Words Of Her Life",5),
    (null,"Without My Streets",5);
    
 insert into seguir_artista(usuario_id,artista_id)
    values(1,1),(1,4),(1,3),(2,1),(2,3),(3,2),(3,1),(4,4);
    
    insert into historico_reproducao(usuario_id,cancao_id)
    values(1,1),(1,6),(1,14),(1,16),(2,13),(2,17),(2,2),
    (2,15),(3,4),(3,16),(3,6),(4,3),(4,18),(4,11);
	
		
	
		
		
		