create database ColdTrack;
use ColdTrack;
create table contratante(
idUsuario int primary key auto_increment,
nome varchar(60) not null,
email varchar(70) unique,
empresa varchar(60),
logradouro varchar(65),
CEP char(9),
complemento varchar(80));

create table refrigeradores(
idRefrigerador int primary key auto_increment,
modelo varchar(20) not null,
fabricante varchar(30) not null,
capacidade varchar(3) not null,
preco int);

create table sensores(
idSensor int primary key auto_increment,
nome varchar(40), 
funcao varchar(30), 
idRefrigerador int unique not null);

create table funcionarios(
idFuncionario int primary key auto_increment,
nome varchar(50),
cpf char(11) unique not null,
funcao varchar(25),
email varchar(70) unique,
celular varchar(9) unique,
setor varchar(20),
filial varchar(20));


 