-- !preview conn=DBI::dbConnect(ano,  RSQLite::SQLite(ano,  ))

CREATE TABLE localizacao_dif (
  ano INT NOT NULL,
  codigo INT PRIMARY KEY,
  descricao TEXT NOT NULL UNIQUE
);
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2007",  0, 'Não está em área de localização diferenciada');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2007",  1, 'Área de assentamento');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2007",  2, 'Terra indígena');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2007",  3, 'Área de comunidade remanescente de quilombos');