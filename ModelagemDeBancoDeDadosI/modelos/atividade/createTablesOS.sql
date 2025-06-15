select version();

create database ordemservico;

use ordemservico;

show tables;

create table cliente(
	cli_codigo INT auto_increment primary key,
	cli_nome varchar(50) not null,
    cli_tell_contato varchar(11) not null,
    cli_email varchar(255) not null
);

create table cli_endereco(
	cod_endereco int,
	logradouro varchar(255) not null,
    cidade varchar(255) not null,
    estado varchar(2) not null,
    cep varchar(8) not null,
    bairro varchar(255) not null,
    numero int not null,
    FOREIGN KEY (cod_endereco) REFERENCES cliente(cli_codigo)
);

create table equipamento(
	equi_codigo varchar
	equi_descricao
    equi_marca
    equi_ano_fabri
    equi_
);

