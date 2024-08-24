-- !preview conn=DBI::dbConnect(RSQLite::SQLite())
DROP TABLE IF EXISTS municipio;
DROP TABLE IF EXISTS estado;
DROP TABLE IF EXISTS regiao;

CREATE TABLE regiao (
  sigla INT PRIMARY KEY,
  nome_r 	 TEXT NOT NULL
);


INSERT INTO regiao (sigla, nome_r) VALUES ('N', 'Norte');
INSERT INTO regiao (sigla, nome_r) VALUES ('NE', 'Nordeste');
INSERT INTO regiao (sigla, nome_r) VALUES ('CO', 'Centro-Oeste');
INSERT INTO regiao (sigla, nome_r) VALUES ('SE', 'Sudeste');
INSERT INTO regiao (sigla, nome_r) VALUES ('S', 'Sul');