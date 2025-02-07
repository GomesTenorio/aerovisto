create database aerovisto;
use aerovisto

create table usuario (
id_usuario VARCHAR(7) PRIMARY KEY,
nome VARCHAR(50),
email VARCHAR(25),
telefone VARCHAR(15),
idade INTEGER,
senha VARCHAR(10),
cpf VARCHAR(11)
);

create table agencia (
cnpj VARCHAR(14) PRIMARY KEY,
nome VARCHAR(100),
telefone VARCHAR(12),
email VARCHAR(100),
site VARCHAR(100),
whatsapp VARCHAR(11)
);

create table destinos (
id_destinos VARCHAR(10) PRIMARY KEY,
nome VARCHAR(20),
descricao VARCHAR(100),
localizacao VARCHAR(20),
preco_base DECIMAL(10)
);

create table pacotes_viagens (
id_pacote VARCHAR(10) PRIMARY KEY,
nome VARCHAR(20),
descricao VARCHAR(100),
preco DECIMAL(10),
duracao INTEGER,
id_destino VARCHAR(10),
cnpj VARCHAR(14),
FOREIGN KEY(cnpj) REFERENCES agencia (cnpj),
FOREIGN KEY (id_destino) REFERENCES destinos (id_destinos)
);

create table reservas (
id_reserva VARCHAR(10) PRIMARY KEY,
data_reserva DATETIME,
status VARCHAR(10),
valor_final DECIMAL(10),
id_pacote VARCHAR(10),
id_usuario VARCHAR(7),
FOREIGN KEY(id_usuario) REFERENCES usuario (id_usuario),
FOREIGN KEY (id_pacote) REFERENCES pacotes_viagens (id_pacote)
);

create table pagamento (
id_pagamento VARCHAR(10) PRIMARY KEY,
valor DECIMAL(10),
data_pagamento DATETIME,
status VARCHAR(20),
metodo VARCHAR(20),
id_reserva VARCHAR(10),
FOREIGN KEY (id_reserva) REFERENCES reservas (id_reserva)
);

CREATE TABLE Tem (
id_pacote VARCHAR(10),
id_reserva VARCHAR(10)
);

CREATE TABLE esta_incluso (
id_destinos VARCHAR(10),
id_pacote VARCHAR(10),
FOREIGN KEY(id_destinos) REFERENCES destinos (id_destinos)
);

ALTER TABLE Tem ADD FOREIGN KEY(id_pacote) REFERENCES pacotes_viagens (id_pacote);
ALTER TABLE Tem ADD FOREIGN KEY(id_reserva) REFERENCES reservas (id_reserva);
ALTER TABLE esta_incluso ADD FOREIGN KEY(id_pacote) REFERENCES pacotes_viagens (id_pacote)

insert into agencia (cnpj, nome, telefone, email, site, whatsapp) 
values ('12345678000101', 'AeroVisto', '08001234567', 
'voudeaerovisto@aerovisto.com.br', 'https://github.com/GomesTenorio/aerovisto', '19999-9999');

select * from agencia;