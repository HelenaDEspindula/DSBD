-- !preview conn=DBI::dbConnect(RSQLite::SQLite())

CREATE TABLE escola (
  codigo INT PRIMARY KEY,
  nome TEXT NOT NULL,
  cod_municipio INT NOT NULL,
  endereco TEXT NULL,
  compl_endereco TEXT NULL,
  bairro TEXT NULL,
  FOREIGN KEY (cod_municipio) REFERENCES municipio(codigo),
  FOREIGN KEY (cod_loc_dif) REFERENCES localizacao_dif(codigo)
);
