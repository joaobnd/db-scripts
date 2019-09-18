-- QUESTÕES 1 E 2

CREATE TABLE automovel (
placa CHAR(8),
cpf_segurado CHAR(11),
marca TEXT,
modelo TEXT,
aut_status TEXT
);

CREATE TABLE segurado (
nome TEXT,
cpf CHAR(11),
automovel CHAR(8),
seguro INTEGER
);

CREATE TABLE perito (
nome TEXT,
cpf CHAR(11),
pericias INTEGER
);

CREATE TABLE oficina (
endereco TEXT,
id_oficina SERIAL,
nome TEXT,
reparos INTEGER
);

CREATE TABLE seguro (
id_seguro SERIAL,
tipo_seguro TEXT,
placa_aut CHAR(8),
valor_anual NUMERIC
);

CREATE TABLE sinistro (
local_ocorrencia TEXT,
descricao TEXT,
data_hora TIMESTAMP,
placa_aut CHAR(8),
id_ocorrencia SERIAL
);

CREATE TABLE pericia (
ocorrencia INTEGER,
id_pericia SERIAL,
placa_aut CHAR(8),
perito CHAR(11),
data_hora TIMESTAMP,
relatorio TEXT,
cobertura BOOLEAN
);

CREATE TABLE reparo (
id_reparo SERIAL,
oficina INTEGER,
custo NUMERIC,
placa_aut CHAR(8),
data_reparo DATE,
finalizado BOOLEAN
);


--Questao 3

ALTER TABLE automovel ADD PRIMARY KEY (placa);
ALTER TABLE segurado ADD PRIMARY KEY (cpf);
ALTER TABLE perito ADD PRIMARY KEY (cpf);
ALTER TABLE oficina ADD PRIMARY KEY (id_oficina);
ALTER TABLE seguro ADD PRIMARY KEY (id_seguro);
ALTER TABLE sinistro ADD PRIMARY KEY (id_ocorrencia);
ALTER TABLE pericia ADD PRIMARY KEY (id_pericia);
ALTER TABLE reparo ADD PRIMARY KEY (id_reparo);

--Questao 4

ALTER TABLE automovel ADD CONSTRAINT pertence FOREIGN KEY (cpf_segurado) REFERENCES segurado (cpf) ON DELETE CASCADE;
ALTER TABLE segurado ADD CONSTRAINT proprietario FOREIGN KEY (automovel) REFERENCES automovel (placa) ON DELETE SET NULL;
ALTER TABLE perito ADD CONSTRAINT investigou FOREIGN KEY (pericias) REFERENCES pericia (id_pericia) ON DELETE SET NULL;
ALTER TABLE oficina ADD CONSTRAINT reparou FOREIGN KEY (reparos) REFERENCES reparo (id_reparo) ON DELETE SET NULL;
ALTER TABLE seguro ADD CONSTRAINT garantia FOREIGN KEY (placa_aut) REFERENCES automovel (placa) ON DELETE CASCADE;
ALTER TABLE sinistro ADD CONSTRAINT acidente FOREIGN KEY (placa_aut) REFERENCES automovel (placa) ON DELETE CASCADE;
ALTER TABLE pericia ADD CONSTRAINT investigado_por FOREIGN KEY (perito) REFERENCES perito (cpf) ON DELETE SET NULL;
ALTER TABLE pericia ADD CONSTRAINT sendo_investigado FOREIGN KEY (placa_aut) REFERENCES automovel (placa) ON DELETE CASCADE;
ALTER TABLE pericia ADD CONSTRAINT investigacao FOREIGN KEY (ocorrencia) REFERENCES sinistro (id_ocorrencia) ON DELETE CASCADE;
ALTER TABLE reparo ADD CONSTRAINT ocorreu_onde FOREIGN KEY (oficina) REFERENCES oficina (id_oficina) ON DELETE SET NULL;
ALTER TABLE reparo ADD CONSTRAINT reparou FOREIGN KEY (placa_aut) REFERENCES automovel (placa) ON DELETE CASCADE;


-- Questao 5 e 6

DROP TABLE automovel CASCADE;
DROP TABLE oficina CASCADE;
DROP TABLE segurado CASCADE;
DROP TABLE seguro CASCADE;
DROP TABLE sinistro CASCADE;
DROP TABLE reparo CASCADE;
DROP TABLE perito CASCADE;
DROP TABLE pericia CASCADE;

-- Questao 7 e 8

CREATE TABLE automovel (
placa CHAR(8) PRIMARY KEY,
cpf_segurado CHAR(11) REFERENCES segurado (cpf) NOT NULL,
marca TEXT,
modelo TEXT,
aut_status TEXT
);

CREATE TABLE segurado (
nome TEXT,
cpf CHAR(11) PRIMARY KEY,
automovel CHAR(8) REFERENCES automovel (placa),
seguro INTEGER REFERENCES seguro (id_seguro) NOT NULL
);

CREATE TABLE perito (
nome TEXT,
cpf CHAR(11) PRIMARY KEY,
pericias INTEGER REFERENCES pericia (id_pericia)

);

CREATE TABLE oficina (
endereco TEXT,
id_oficina SERIAL PRIMARY KEY,
nome TEXT,
reparos INTEGER REFERENCES reparo (id_reparo)
);

CREATE TABLE seguro (
id_seguro SERIAL PRIMARY KEY,
tipo_seguro TEXT,
placa_aut CHAR(8) REFERENCES automovel (placa),
valor_anual NUMERIC
);

CREATE TABLE sinistro (
local_ocorrencia TEXT,
descricao TEXT,
data_hora TIMESTAMP,
placa_aut CHAR(8) REFERENCES automovel (placa) NOT NULL,
id_ocorrencia SERIAL PRIMARY KEY
);

CREATE TABLE pericia (
ocorrencia INTEGER REFERENCES sinistro (id_ocorrencia) NOT NULL,
id_pericia SERIAL PRIMARY KEY,
placa_aut CHAR(8) REFERENCES automovel (placa) NOT NULL,
perito CHAR(11) REFERENCES perito (cpf),
data_hora TIMESTAMP,
relatorio TEXT,
cobertura BOOLEAN
);

CREATE TABLE reparo (
id_reparo SERIAL PRIMARY KEY,
oficina INTEGER REFERENCES oficina (id_oficina) NOT NULL,
custo NUMERIC,
placa_aut CHAR(8) REFERENCES automovel (placa) NOT NULL,
data_reparo DATE,
finalizado BOOLEAN
);

--Não consegui criar as tabelas dessa forma.