CREATE TABLE `usuario` (
  `id` INT NOT NULL Auto_increment,
  `email` varchar(100) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `tel` varchar(100) NOT NULL,
  `cpf` varchar(100) UNIQUE NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `rifa` (
  `id` INT NOT NULL PRIMARY KEY Auto_increment,
  `titulo` varchar(100) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `quant_num` DATETIME NOT NULL,
  `data_termino` DATETIME NOT NULL,
  `tempo_reserva` TIME NOT NULL,
  `fk_administrador_id` INT NOT NULL,
  FOREIGN KEY (`fk_administrador_id`) REFERENCES `usuario`(`id`)
) ENGINE=InnoDB;

CREATE TABLE `pedido` (
  `id` INT NOT NULL PRIMARY KEY Auto_increment,
  `fk_rifa_id` INT NOT NULL,
  `fk_usuario_id` INT NOT NULL,
  `valor` DOUBLE NOT NULL,
  `status` BOOLEAN,
  FoREIGN KEY (`fk_rifa_id`) REFERENCES rifa(`id`),
  FOREIGN KEY (`fk_usuario_id`) REFERENCES usuario(`id`)
) ENGINE=InnoDB;

CREATE TABLE `numero` (
  `numero` INT NOT NULL,
  `fk_rifa_id` INT NOT NULL,
  `fk_pedido_id` INT NOT NULL,
  CONSTRAINT pk_numero PRIMARY KEY(`numero`, `fk_pedido_id`),
  FOREIGN KEY (`fk_rifa_id`) REFERENCES rifa(`id`),
  FOREIGN KEY (`fk_pedido_id`) REFERENCES pedido(`id`)
) ENGINE=InnoDB;

CREATE TABLE `colaborador` (
  `id` INT NOT NULL Auto_increment,
  `fk_rifa_id` INT NOT NULL,
  `fk_usuario_id` INT NOT NULL,
  `url` VARCHAR(100) NOT NULL,
  `saque` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`fk_rifa_id`) REFERENCES rifa(`id`),
  FOREIGN KEY (`fk_usuario_id`) REFERENCES usuario(`id`)
) ENGINE=InnoDB;

CREATE TABLE `pedido_colaborador` (
  `fk_pedido_id` INT NOT NULL,
  `fk_colaborador_id` INT NOT NULL,
  FOREIGN KEY (`fk_pedido_id`) REFERENCES pedido(`id`),
  FOREIGN KEY (`fk_colaborador_id`) REFERENCES colaborador(`id`)
) ENGINE=InnoDB;

CREATE TABLE `imagens` (
  `fk_rifa_id` INT NOT NULL,
  `link_img` VARCHAR(100),
  FOREIGN KEY (`fk_rifa_id`) REFERENCES rifa(`id`)
) ENGINE=InnoDB;

CREATE TABLE `tags` (
    `nome` VARCHAR(100) NOT NULL,
    PRIMARY KEY(`nome`)
) ENGINE=InnoDB;

CREATE TABLE `rifa_tag` (
  `fk_rifa_id` INT NOT NULL,
  `fk_tags_name` VARCHAR(100),
  FOREIGN KEY (`fk_rifa_id`) REFERENCES rifa(`id`),
  FOREIGN KEY (`fk_tags_name`) REFERENCES tags(`nome`)
) ENGINE=InnoDB;