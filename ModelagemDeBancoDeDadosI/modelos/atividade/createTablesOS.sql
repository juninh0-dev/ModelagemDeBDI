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
	equi_codigo varchar(8) primary key,
	equi_descricao text,
    equi_marca varchar(50) not null,
    equi_ano_fabri date not null,
    equi_detal_config text,
    equi_obs text,
	fk_cli_codigo INT,
    FOREIGN KEY (fk_cli_codigo) REFERENCES cliente(cli_codigo)
);

create table ordemServico(
	os_codigo int auto_increment primary key,
	os_data date not null,
    os_data_fechamento date not null,
    fk_cli_codigo int not null,
    fk_equi_codigo int not null,
    fk_tec_codigo int not null,
    FOREIGN KEY (fk_cli_codigo) REFERENCES cliente(cli_codigo),
    FOREIGN KEY (fk_equi_codigo) REFERENCES equipamento(equi_codigo),
	FOREIGN KEY (fk_tec_codigo) REFERENCES tecnico(tec_codigo)
);

create table servico(
	ser_codigo int auto_increment primary key, 
    ser_descricao text,
    ser_horas_de_aplicacao time,
    ser_valor decimaL(5,2) not null
);

create table item(
	item_codigo int primary key auto_increment,
    item_valor decimal(5,2) not null,
    item_desc text
);

create table tecnico(
	tec_codigo int primary key auto_increment,
    tec_nome varchar(50) not null,
    tec_tell varchar(11) not null unique
);
