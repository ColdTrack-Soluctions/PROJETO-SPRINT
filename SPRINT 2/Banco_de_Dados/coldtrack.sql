-- CRIANDO A NOSSA BASE DE DADOS
create database bd_coldtrack;
-- ULTILIZANDO A BASE DE DADOS
use bd_coldtrack;

-- CRIANDO UMA TABELA PARA O NOSSO CLIENTE
create table cliente(
idCliente int primary key auto_increment,
nomeCliente varchar(100) not null,
emailCliente varchar(100) not null,
senhaCliente varchar(255),
cnpjCliente char(14)
);

-- INSERINDO DADOS SOBRE O CLIENTE CADASTRADO NO SISTEMA
insert into cliente values
(null,'Rodrigo Abraão','rodrigoAbraão@gmail.com','Password','11111111111111'),
(null,'Amélia Eva','AmeliaEva@gmail.com','Password','2222222222222');

select * from cliente;

-- ViSUALIZANDO O NOME E O EMAIL DO CLIENTE
select nomeCliente as 'Nome do Cliente', emailCliente as 'Email do Cliente' from cliente;


-- CRIANDO UMA TABELA PARA OS FUNCIONÁRIOS DESSE CLIENTE QUE POSSUEM UMA CONTA REGISTRADA
create table funcionario(
idFuncionario int auto_increment,
fkCliente int,
constraint pkCompFuncionarioCliente primary key (idFuncionario, fkCliente),
cargoFuncionario varchar(45),
nomeFuncionario varchar(45),
emailFuncionario varchar(45),
senhaFuncionario varchar(45),
telefoneFuncionario varchar(45),
constraint fkClienteFuncionario foreign key (fkCliente) references cliente(idCliente),
fkEstabelecimento int,
constraint fkEstabelecimentoFuncionario foreign key (fkEstabelecimento) references estabelecimento (idEstabelecimento));

SELECT idFuncionario, fkCliente , nomeFuncionario, emailFuncionario FROM funcionario WHERE emailfuncionario = 'a' AND senhafuncionario = 'a';
select * from funcionario;
-- INSERINDO INFORMAÇÕES SOBRE FUNCIONARIOS CADASTRADOS
insert into funcionario values
(default, 1, 'Diretor', 'João','joãodias@gmail.com', 'password','(55) 1198123-67890', 1),
(default, 2, 'Gerente', 'Ana', 'anadias@gmail.com','password','(55) 1198765-1234', 2);

select * from funcionario;

-- EXIBINDO O NOME DO FUNCIONARIO, O SEU CARGO E O NOME DO RESPONSÁVEL PELA EMPRESA ONDE TRABALHA
select funcionario.nomeFuncionario as 'Nome do Funcionario', funcionario.cargoFuncionario as 'Cargo',
	cliente.nomeCliente as 'Chefe' from funcionario
	join cliente on fkCliente = idCliente;

-- TABELA PARA O ESTABELECIMENTO E SUAS INFORMAÇÕES
create table estabelecimento(
idEstabelecimento int primary key auto_increment,
nomeEstabelecimento varchar(45),
UnidadefederativaEstabelecimento varchar(45),
cidadeEstabelecimento varchar(45),
bairroEstabelecimento varchar(45),
cepEstabelecimento char(9),
númeroEstabelecimento varchar(45),
telefoneEstabelecimento varchar(45),
qtdRefrigeradores int,
fkCliente int,
constraint fkClienteEstabelecimento foreign key (fkCliente) references cliente(idCliente));

-- INSERINDO DADOS SOBRE O ESTABELECIMENTO DO CLIENTE
insert into estabelecimento values
(default, 'Swift Costa Barros', 'SP (São Paulo)','São Paulo', 'Vila Alpina', '12345-678', '123', '12345-67890', '8', '1'),
(default, 'Bonas Sapopemba', 'SP (São Paulo)','São Paulo', 'Sapopemba', '87654-321', '321', '09876-54321', '6', '2');

select * from estabelecimento;

-- EXIBINDO O NOME DO ESTABELECIMENTO E SEU RESPONSÁVEL
select nomeEstabelecimento as 'Nome do Estabelecimento', nomeCliente as 'Responsável' from estabelecimento 
	join cliente on fkCliente = idCliente;


-- TABELA ESPECIFICANDO CADA REFRIGERADOR PRESENTE NO ESTABELECIMENTO
create table refrigerador(
idRefrigerador int primary key auto_increment,
localFisico varchar(100),
marca varchar(50),
modelo varchar(50),
fkEstabelecimento int,
constraint fkRefrigeradorEstabelecimento foreign key (fkEstabelecimento) references estabelecimento(idEstabelecimento)
);

-- INSERINDO DADOS SOBRE REFRIGERADORES
insert into refrigerador values 
(default,'Área Frigorifica - NORTE','DuFrio','GPTU-40', 1);


select * from refrigerador;

-- TABELA PARA O SENSOR DE TEMPERATURA 

create table SensorTemperatura(
idSensorTemperatura int primary key auto_increment, 
Modelo varchar(45),
fkRefrigerador int, 
constraint fkRefrigeradorTemperatura foreign key (fkRefrigerador) references Refrigerador (idRefrigerador));

 insert into SensorTemperatura values
 (default, 'LM35' , 1);
 
 select * from SensorTemperatura;
 
-- criando tabela de dados captados do sensor de temperatura
create table dadosTemperatura(
idDadoTemperatura int,
fkSensorTemperatura int,
constraint pkcompostatemperatura primary key(iddadotemperatura, fksensortemperatura),
constraint fksensordadostemperatura foreign key(fksensortemperatura) references sensorTemperatura(idsensortemperatura),
Temperatura decimal(6,2),
Horario DATETIME
);

-- TABELA QUE INFORMA A TEMPERATURA IDEAL
create table temperaturaIdeal (
idTemperatura int,
fkSensorTemperatura int,
tempMax float,
tempMin float,
constraint fkTempSensor foreign key (fkSensorTemperatura) references SensorTemperatura(idSensorTemperatura));
drop table temperaturaideal;
-- INSERINDO DADOS SOBRE A TEMPERATURA IDEAL QUE CADA SENSOR DEVE CAPTAR
insert into temperaturaIdeal values 

(2, 2, 5, -0.8);

select * from temperaturaIdeal;

-- EXIBINDO A TEMPERATURA MÁXIMA QUE UM DETERMINADO SENSOR DEVE CAPTAR ANTES DE NOTIFICAR O SISTEMA
select Arduino.idArduino as 'Identificador do Arduino', temperaturaIdeal.tempMax as 'Temperatura Máxima' 
	from temperaturaIdeal 
	join Arduino on fkSensorTemperatura = idArduino where idArduino = 2;
    
    
-- CRIANDO UMA TABELA PARA ALGUMAS PORTAS DE REFRIGERADORES 
create table portaRefrigerador (
idPorta int,
fkRefrigerador int,
constraint pkCompPorta primary key (idPorta, fkRefrigerador),
produtoArmazenado varchar(45),
tipoAbertura varchar(45),
constraint chkAbertura check (tipoAbertura in ('Puxar', 'Arrastar'))
);

-- INSERINDO DADOS DE PORTAS
insert into portaRefrigerador values
(1, 1, 'Alcatra', 'Puxar'),
(2, 1, 'Picanha', 'Puxar');

select * from portaRefrigerador;

-- TABELA PARA O SENSOR DE BLOQUEIO

create table SensorBloqueio(
idSensorBloqueio int primary key auto_increment, 
Modelo varchar(45),
fkPortaRefrigerador int, 
constraint fkRefrigeradorBloqueio foreign key (fkPortaRefrigerador) references PortaRefrigerador (idPorta));

insert into SensorBloqueio Values
 (default, 'TCRT5000' , 1),
 (default, 'TCRT5000' , 2);
select * from SensorBloqueio;

-- criando tabela de dados captados do sensor de bloqueio
create table dadosAbertura(
idDadoAbertura int,
fkSensorBloqueio int,
constraint pkcompostaabertura primary key(iddadoabertura, fksensorbloqueio),
constraint fksensordadosabertura foreign key(fksensorbloqueio) references sensorBloqueio(idsensorbloqueio),
Aberturas int,
Horario DATETIME
);

-- VISUALIZANDO O IDENTIFICADOR DA PORTA, SEU PRODUTO E A SUA ÁREA NO MERCADO DE CARNE
select portaRefrigerador.idPorta as 'Número da Porta', portaRefrigerador.produtoArmazenado as Produto,
	refrigerador.localFisico as Área from portaRefrigerador
	join refrigerador on idRefrigerador = fkRefrigerador;

    
    -- TABELA PARA O ARDUÍNO E SUAS INFORMAÇÕES
create table Arduino(
idArduino int primary key auto_increment,
versaoSistema varchar(100),
dtInstalação date,
ultimaManutenção date,
fkSensorBloqueio int,
fkSensorTemperatura int,
constraint fkarduinobloqueio foreign key (fksensorbloqueio) references sensorbloqueio(idsensorbloqueio),
constraint fkarduinotemperatura foreign key (fksensortemperatura) references sensortemperatura(idsensortemperatura)
);

-- INSERINDO INFORMAÇÕES SOBRE ARDUÍNOS UTILIZADOS
insert into Arduino values 
(null,'1.0.0', '2023-03-12', '2024-04-04'),
(null,'1.0.0', '2023-04-19', '2024-04-03');

insert into Arduino values
(null,'1.0.0', '2023-04-29', '2024-05-06'),
(null,'1.0.0', '2023-05-06', null);

select * from Arduino;


-- EXIBINDO A DATA DE INSTALAÇÃO DE UM DETERMINADO SENSOR
select date_format(dtInstalação, '%d-%m-%y')  as 'Data de Instalação' from Arduino where idArduino = 1;
