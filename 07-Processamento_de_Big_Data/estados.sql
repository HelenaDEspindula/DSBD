DROP TABLE IF EXISTS municipio;
DROP TABLE IF EXISTS estado;

CREATE TABLE estado(
    uf TEXT PRIMARY KEY,
    nome_e TEXT NOT NULL UNIQUE,
    regiao TEXT	  NOT NULL,
    FOREIGN KEY (regiao) REFERENCES regiao(sigla)
);

INSERT INTO estado (uf, nome_e, regiao) VALUES ('AC', 'Acre', 'N');
INSERT INTO estado (uf, nome_e, regiao) VALUES ('AL', 'Alagoas', 'NE');
INSERT INTO estado (uf, nome_e, regiao) VALUES ('AP', 'Amapá', 'N');
INSERT INTO estado (uf, nome_e, regiao) VALUES ('AM', 'Amazonas', 'N');
INSERT INTO estado (uf, nome_e, regiao) VALUES ('BA', 'Bahia', 'NE');
INSERT INTO estado (uf, nome_e, regiao) VALUES ('CE', 'Ceará', 'NE');
INSERT INTO estado (uf, nome_e, regiao) VALUES ('DF', 'Distrito Federal', 'CO');
INSERT INTO estado (uf, nome_e, regiao) VALUES ('ES', 'Espírito Santo', 'SE');
INSERT INTO estado (uf, nome_e, regiao) VALUES ('GO', 'Goiás', 'CO');
INSERT INTO estado (uf, nome_e, regiao) VALUES ('MA', 'Maranhão', 'NE');
INSERT INTO estado (uf, nome_e, regiao) VALUES ('MT', 'Mato Grosso', 'CO');
INSERT INTO estado (uf, nome_e, regiao) VALUES ('MS', 'Mato Grosso do Sul', 'CO');
INSERT INTO estado (uf, nome_e, regiao) VALUES ('MG', 'Minas Gerais', 'SE');
INSERT INTO estado (uf, nome_e, regiao) VALUES ('PA', 'Pará', 'N');
INSERT INTO estado (uf, nome_e, regiao) VALUES ('PB', 'Paraíba', 'NE');
INSERT INTO estado (uf, nome_e, regiao) VALUES ('PR', 'Paraná', 'S');
INSERT INTO estado (uf, nome_e, regiao) VALUES ('PE', 'Pernambuco', 'NE');
INSERT INTO estado (uf, nome_e, regiao) VALUES ('PI', 'Piauí', 'NE');
INSERT INTO estado (uf, nome_e, regiao) VALUES ('RJ', 'Rio de Janeiro', 'SE');
INSERT INTO estado (uf, nome_e, regiao) VALUES ('RN', 'Rio Grande do Norte', 'NE');
INSERT INTO estado (uf, nome_e, regiao) VALUES ('RS', 'Rio Grande do Sul', 'S');
INSERT INTO estado (uf, nome_e, regiao) VALUES ('RO', 'Rondônia', 'N');
INSERT INTO estado (uf, nome_e, regiao) VALUES ('RR', 'Roraima', 'N');
INSERT INTO estado (uf, nome_e, regiao) VALUES ('SC', 'Santa Catarina', 'S');
INSERT INTO estado (uf, nome_e, regiao) VALUES ('SP', 'São Paulo', 'SE');
INSERT INTO estado (uf, nome_e, regiao) VALUES ('SE', 'Sergipe', 'NE');
INSERT INTO estado (uf, nome_e, regiao) VALUES ('TO', 'Tocantins', 'N');