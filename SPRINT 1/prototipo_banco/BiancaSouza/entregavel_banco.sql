CREATE DATABASE sprint_ind;
USE sprint_ind;

CREATE TABLE coldtrack (
idEmpresa int primary key auto_increment,
CNPJ char(14),
emailEmpresa varchar(50),
logradouro varchar(50),
numero int,
cep char(10),
complemento varchar (50));

insert into coldTrack value
(null, '12121314151567', 'cold.tr4ck.solutions@gmail.com', 'Rua Haddock Lobo', 595, '11111-123',null); 

DESCRIBE coldtrack;
select * from coldTrack;

CREATE TABLE funcionarios_CT (
idFuncionario int primary key auto_increment,
nome varchar(50),
funcao varchar(65),
emailFuncionario varchar(100));

DESCRIBE funcionarios_CT;
insert into funcionarios_CT value 
(null,'Alejandro','Back-End','alejandroCastor@gmail.com'),
(null,'Alexandre','Product Owner','alexandre.oliveira@gmail.com'),
(null,'Bianca','Designer','BiancaRodrigues@gmail.com'),
(null,'Cindy','Gestão','cindyOliveira@gmail.com'),
(null,'Felipe','Banco de dados','FelipeAlbertim@gmail.com'),
(null,'Gustavo','Front-End','GustavoBarreto@gmail.com');

select * from funcionarios_CT;

CREATE TABLE cliente (
idCliente int primary key auto_increment,
nomeEmpresa varchar (50),
nomeResponsavel varchar(50),
emailResponsavel varchar(100),
logradouro varchar(50),
numero int,
cep char(10),
complemento varchar(50),
cnpj char(14) 
);

insert into cliente value
(null, 'Metal Frio','Gustavo Santos','gustavo.metalFrio@gmail.com','Rua metal','102','10423-213','Unidade Leste','11122233344412');

select * from cliente;

DESCRIBE cliente;

CREATE TABLE refrigeradores (
idRefrigerador int primary key auto_increment,
quantidade int,
modelo varchar(50),
qtdPortas int,
preco decimal(10,2),
p_armazenado varchar (50),
temperatura_p varchar (50));

insert into refrigeradores value
(null, 10,'ch300',2,'4.000','Sorvete','18°C');

update refrigeradores set temperatura_p = '-18 °C' WHERE idRefrigerador = 1;

select * from refrigeradores;

DESCRIBE refrigeradores;

CREATE TABLE sensores (
idSensor int primary key auto_increment,
nome varchar(40),
modeloArduino varchar(50),
localFisico varchar(50),
temperatura float
);

insert into sensores value 
(null, 'Temperatura - LM35' , 'UNO' , 'Refrigeradores - ALA B', -2),
(null, 'Proximidade - TRCT5000', 'UNO','Refrigerdores - ALA B', null);

DESCRIBE sensores;

select * from sensores;

CREATE TABLE cadastro (
idCadastro int primary key auto_increment,
nomePontodeVenda varchar(50),
emailPV varchar(100),
senha varchar(50),
CNPJ char(14),
logradouro varchar(50),
numero int,
complemento varchar(50),
CEP char(10),
cidade varchar (50),
estado varchar (50),
país varchar(50));

DESCRIBE cadastro;

insert into cadastro value
(null, 'Extra', 'extra.supermercado@gmail.com', 'extra123', '12345678901234',
'Avenida Gustavo Facó', '500', 'Mercado Ala Norte', '1234567890','São Paulo - Capital','São Paulo', 'Brasil');

select * from cadastro;
