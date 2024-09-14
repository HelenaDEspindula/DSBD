-- !preview conn=DBI::dbConnect(RSQLite::SQLite())

CREATE TABLE telefone (
  cod_escola INT PRIMARY KEY,
  ddd int,
  numero int,
  FOREIGN KEY (cod_escola) REFERENCES escola(codigo)
);

INSERT INTO escola (cod_escola, ddd, numero) VALUES (11022558, 1, 111);
INSERT INTO escola (cod_escola, ddd, numero) VALUES (11024275, 2, 222);
INSERT INTO escola (cod_escola, ddd, numero) VALUES (11024291, 3, 333);
INSERT INTO escola (cod_escola, ddd, numero) VALUES (11024372, 4, 444);
INSERT INTO escola (cod_escola, ddd, numero) VALUES (11024666, 5, 555);
INSERT INTO escola (cod_escola, ddd, numero) VALUES (11024682, 6, 666);
INSERT INTO escola (cod_escola, ddd, numero) VALUES (11024828, 7, 777);
INSERT INTO escola (cod_escola, ddd, numero) VALUES (11024917, 8, 888);