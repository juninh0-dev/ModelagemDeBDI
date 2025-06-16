select version();

create database ordem_de_servico;

use ordem_de_servico;

show tables;

create table cliente(
	cli_codigo INT auto_increment primary key,
	cli_nome varchar(50) not null,
    cli_tell_contato varchar(11) not null,
    cli_email varchar(255) not null
);

create table servico(
	ser_codigo int auto_increment primary key, 
    ser_descricao varchar(255),
    ser_horas_de_aplicacao time,
    ser_valor decimaL(5,2) not null
);

create table item(
	item_codigo int primary key auto_increment,
    item_valor decimal(5,2) not null,
    item_desc varchar(255)
);

create table tecnico(
	tec_codigo int primary key auto_increment,
    tec_nome varchar(50) not null,
    tec_tell varchar(11) not null unique
);

create table cli_endereco(
	logradouro varchar(255) not null,
    cidade varchar(255) not null,
    estado varchar(2) not null,
    cep varchar(8) not null,
    bairro varchar(255) not null,
    numero int not null,
    fk_cod_endereco int,
    FOREIGN KEY (fk_cod_endereco) REFERENCES cliente(cli_codigo)
);


create table equipamento(
	equi_codigo varchar(8) primary key,
	equi_descricao varchar(255),
    equi_marca varchar(50) not null,
    equi_ano_fabri date not null,
    equi_detal_config varchar(255),
    equi_obs varchar(255),
	fk_cli_codigo INT,
    FOREIGN KEY (fk_cli_codigo) REFERENCES cliente(cli_codigo)
);

create table ordem_servico(
	os_codigo int auto_increment primary key,
	os_data date not null,
    os_data_fechamento date not null,
    fk_cli_codigo int,
    fk_equi_codigo varchar(8),
    fk_tec_codigo int,
    FOREIGN KEY (fk_cli_codigo) REFERENCES cliente(cli_codigo),
    FOREIGN KEY (fk_equi_codigo) REFERENCES equipamento(equi_codigo),
	FOREIGN KEY (fk_tec_codigo) REFERENCES tecnico(tec_codigo)
);

create table os_servico(
	fk_os_codigo int,
	fk_ser_codigo int,
	FOREIGN KEY (fk_os_codigo) REFERENCES ordem_servico(os_codigo),
    FOREIGN KEY (fk_ser_codigo) REFERENCES servico(ser_codigo)
);

create table os_item(
	fk_os_codigo int,
    fk_item_codigo int,
    FOREIGN KEY (fk_os_codigo) REFERENCES ordem_servico(os_codigo),
    FOREIGN KEY (fk_os_codigo) REFERENCES item(item_codigo)
);