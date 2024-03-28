
create database coldtrackBancoDeDados;


use coldtrackBancoDeDados;

create table refrigerador(
idRefrigerador int primary key auto_increment,
localFisico varchar(100),
marca varchar(50),
modelo varchar(50),
qtd_portas char(2),
produto_armazenado varchar(100),
temperatura_ideal_minino char(3),
temperatura_ideal_maxima char(3)
);

create table arduino(
idArduino int primary key auto_increment,
modeloArduino varchar(50),
localFisico varchar(100),
versaoSistema varchar(100)
);


create table sensores(
idSensor int primary key auto_increment,
nome varchar(50),
funcao varchar(30),
descricao longtext
);


create table dadosCaptura(
idDados int primary key auto_increment,
temperatura float,
proximidade char(1),
dataHora datetime default current_timestamp
);


create table contratante(
idContratante int primary key auto_increment,
nomePontoDeVenda varchar(100) not null,
emailPontoDeVenda varchar(100) not null,
senha varchar(255),
confirmaSenha varchar(255),
cnpj char(14),
logradouro varchar(100),
numero varchar(10),
cep char(8),
complemento varchar(100),
cidade varchar(50),
pais varchar(50)
);


