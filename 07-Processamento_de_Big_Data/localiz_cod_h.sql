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

INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2008",  0, 'Não está em área de localização diferenciada');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2008",  1, 'Área de assentamento');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2008",  2, 'Terra indígena');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2008",  3, 'Área de comunidade remanescente de quilombos');

INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2009",  0, 'Não está em área de localização diferenciada');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2009",  1, 'Área de assentamento');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2009",  2, 'Terra indígena');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2009",  3, 'Área de comunidade remanescente de quilombos');

INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2010",  0, 'Não está em área de localização diferenciada');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2010",  1, 'Área de assentamento');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2010",  2, 'Terra indígena');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2010",  3, 'Área de comunidade remanescente de quilombos');

INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2011",  0, 'Não está em área de localização diferenciada');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2011",  1, 'Área de assentamento');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2011",  2, 'Terra indígena');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2011",  3, 'Área de comunidade remanescente de quilombos');

INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2012",  0, 'A escola não está em área de localização diferenciada');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2012",  1, 'Área de assentamento');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2012",  2, 'Terra indígena');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2012",  3, 'Área remanescente de quilombos');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2012",  4, 'Unidade de uso sustentável');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2012",  5, 'Unidade de uso sustentável em terra indígena');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2012",  6, 'Unidade de uso sustentável em área remanescente de quilombos');

INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2013",  0, 'A escola não está em área de localização diferenciada');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2013",  1, 'Área de assentamento');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2013",  2, 'Terra indígena');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2013",  3, 'Área remanescente de quilombos');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2013",  4, 'Unidade de uso sustentável');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2013",  5, 'Unidade de uso sustentável em terra indígena');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2013",  6, 'Unidade de uso sustentável em área remanescente de quilombos');

INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2014",  0, 'A escola não está em área de localização diferenciada');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2014",  1, 'Área de assentamento');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2014",  2, 'Terra indígena');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2014",  3, 'Área remanescente de quilombos');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2014",  4, 'Unidade de uso sustentável');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2014",  5, 'Unidade de uso sustentável em terra indígena');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2014",  6, 'Unidade de uso sustentável em área remanescente de quilombos');

INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2015",  0, 'A escola não está em área de localização diferenciada');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2015",  1, 'Área de assentamento');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2015",  2, 'Terra indígena');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2015",  3, 'Área remanescente de quilombos');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2015",  4, 'Unidade de uso sustentável');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2015",  5, 'Unidade de uso sustentável em terra indígena');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2015",  6, 'Unidade de uso sustentável em área remanescente de quilombos');

INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2016",  0, 'A escola não está em área de localização diferenciada');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2016",  1, 'Área de assentamento');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2016",  2, 'Terra indígena');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2016",  3, 'Área remanescente de quilombos');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2016",  4, 'Unidade de uso sustentável');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2016",  5, 'Unidade de uso sustentável em terra indígena');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2016",  6, 'Unidade de uso sustentável em área remanescente de quilombos');

INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2017",  0, 'A escola não está em área de localização diferenciada');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2017",  1, 'Área de assentamento');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2017",  2, 'Terra indígena');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2017",  3, 'Área remanescente de quilombos');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2017",  4, 'Unidade de uso sustentável');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2017",  5, 'Unidade de uso sustentável em terra indígena');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2017",  6, 'Unidade de uso sustentável em área remanescente de quilombos');

INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2018",  0, 'A escola não está em área de localização diferenciada');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2018",  1, 'Área de assentamento');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2018",  2, 'Terra indígena');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2018",  3, 'Área remanescente de quilombos');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2018",  4, 'Unidade de uso sustentável');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2018",  5, 'Unidade de uso sustentável em terra indígena');
INSERT INTO localizacao_dif (ano,  codigo, descricao) VALUES ("2018",  6, 'Unidade de uso sustentável em área remanescente de quilombos');




