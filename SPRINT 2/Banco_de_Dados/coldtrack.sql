-- CRIANDO A NOSSA BASE DE DADOScreate database bd_coldtrack;
-- ULTILIZANDO A BASE DE DADOS
create database bd_coldtrack;
use bd_coldtrack;

-- CRIANDO UMA TABELA PARA O NOSSO CLIENTE
create table cliente(
idCliente int primary key auto_increment,
nomeCliente varchar(100) not null,
emailCliente varchar(100) not null,
senhaCliente varchar(255),
cnpjCliente char(18)
);

-- INSERINDO DADOS SOBRE O CLIENTE CADASTRADO NO SISTEMA
insert into cliente values
(null,'Rodrigo Abraão','rodrigoAbraão@gmail.com','Password','11111111111111'),
(null,'Amélia Eva','AmeliaEva@gmail.com','Password','2222222222222');

select * from cliente;

-- ViSUALIZANDO O NOME E O EMAIL DO CLIENTE
select nomeCliente as 'Nome do Cliente', emailCliente as 'Email do Cliente' from cliente;

-- TABELA PARA O ESTABELECIMENTO E SUAS INFORMAÇÕES
create table estabelecimento(
idEstabelecimento int,
fkCliente int,
constraint pkestabelecimentocliente primary key(idEstabelecimento, fkCliente),
constraint fkClienteEstabelecimento foreign key (fkCliente) references cliente(idCliente),
nomeEstabelecimento varchar(45),
UnidadefederativaEstabelecimento varchar(45),
cidadeEstabelecimento varchar(45),
bairroEstabelecimento varchar(45),
cepEstabelecimento char(9),
númeroEstabelecimento varchar(45),
telefoneEstabelecimento varchar(45),
qtdRefrigeradores int
);

-- INSERINDO DADOS SOBRE O ESTABELECIMENTO DO CLIENTE
insert into estabelecimento values
(1, 1, 'Swift Costa Barros', 'SP (São Paulo)','São Paulo', 'Vila Alpina', '12345-678', '123', '12345-67890', '8'),
(1, 2, 'Bonas Sapopemba', 'SP (São Paulo)','São Paulo', 'Sapopemba', '87654-321', '321', '09876-54321', '6');

select * from estabelecimento;

-- EXIBINDO O NOME DO ESTABELECIMENTO E SEU RESPONSÁVEL
select nomeEstabelecimento as 'Nome do Estabelecimento', nomeCliente as 'Responsável' from estabelecimento 
	join cliente on fkCliente = idCliente;
-- CRIANDO UMA TABELA PARA OS FUNCIONÁRIOS DESSE CLIENTE QUE POSSUEM UMA CONTA REGISTRADA
create table funcionario(
idFuncionario int,
fkCliente int,
fkEstabelecimento int,
constraint fkClienteFuncionario foreign key (fkCliente) references estabelecimento(fkCliente),
constraint fkEstabelecimentoFuncionario foreign key (fkEstabelecimento) references estabelecimento (idEstabelecimento),
constraint pkCompFuncionarioCliente primary key (idFuncionario, fkEstabelecimento ,fkCliente),
cargoFuncionario varchar(45),
nomeFuncionario varchar(45),
emailFuncionario varchar(45),
senhaFuncionario varchar(45),
telefoneFuncionario varchar(45)
);

SELECT idFuncionario, fkCliente , nomeFuncionario, emailFuncionario FROM funcionario WHERE emailfuncionario = 'a' AND senhafuncionario = 'a';
select * from funcionario;
-- INSERINDO INFORMAÇÕES SOBRE FUNCIONARIOS CADASTRADOS
insert into funcionario values
(1, 1, 1, 'Diretor', 'João','joãodias@gmail.com', 'password','(55) 1198123-67890'),
(1, 2, 1, 'Gerente', 'Ana', 'anadias@gmail.com','password','(55) 1198765-1234');

select * from funcionario;

-- EXIBINDO O NOME DO FUNCIONARIO, O SEU CARGO E O NOME DO RESPONSÁVEL PELA EMPRESA ONDE TRABALHA
select funcionario.nomeFuncionario as 'Nome do Funcionario', funcionario.cargoFuncionario as 'Cargo',
	cliente.nomeCliente as 'Chefe' from funcionario
	join cliente on fkCliente = idCliente;


-- TABELA ESPECIFICANDO CADA REFRIGERADOR PRESENTE NO ESTABELECIMENTO
create table refrigerador(
idRefrigerador int,
fkEstabelecimento int,
fkCliente int,
constraint pkrefrigerador primary key (idRefrigerador, fkEstabelecimento, fkCliente),
constraint fkRefrigeradorEstabelecimento foreign key (fkEstabelecimento) references estabelecimento(idEstabelecimento),
constraint fkrefrigeradorCliente foreign key (fkCliente) references estabelecimento(fkCliente),
localFisico varchar(100),
marca varchar(50),
modelo varchar(50),
fkArduino int
);

-- INSERINDO DADOS SOBRE REFRIGERADORES
insert into refrigerador values 
(1, 1, 1,'Área Frigorifica - NORTE','DuFrio','GPTU-40', null),
(2, 1, 1,'Área Frigorifica - NORTE','DuFrio','GPTU-40', null),
(1, 1, 2,'Área Frigorifica - NORTE','DuFrio','GPTU-40', null),
(2, 1, 2,'Área Frigorifica - NORTE','DuFrio','GPTU-40', null);

select * from refrigerador;
select * from refrigerador where fkcliente = 3 and fkestabelecimento = 1;

-- TABELA PARA O SENSOR DE TEMPERATURA 

create table SensorTemperatura(
idSensorTemperatura int,
fkRefrigerador int,
fkEstabelecimento int,
fkCliente int,
constraint pkcompostasensortemperatura primary key (idSensorTemperatura, fkRefrigerador, fkEstabelecimento, fkCliente),
constraint fkrefrigeradorsensortemperatura foreign key (fkRefrigerador) references refrigerador(idRefrigerador),
constraint fkestabelecimentosensortemperatura foreign key (fkEstabelecimento) references refrigerador(fkEstabelecimento),
constraint fkclientesensortemperatura foreign key (fkCliente) references refrigerador(fkCliente),
Modelo varchar(45)
);

 insert into SensorTemperatura values
 (1, 1, 1, 1,'LM35'),
 (1, 1, 1, 2,'LM35');
 
 select * from SensorTemperatura;
 
-- criando tabela de dados captados do sensor de temperatura
create table dadosTemperatura(
idDadoTemperatura int,
fkSensorTemperatura int,
fkRefrigerador int,
fkEstabelecimento int,
fkCliente int,
constraint pkcompostadadostemperatura primary key (idDadoTemperatura, fkSensorTemperatura, fkRefrigerador, fkEstabelecimento, fkCliente),
constraint fksensortemperaturadadostemperatura foreign key (fkSensorTemperatura) references SensorTemperatura(idSensorTemperatura),
constraint fkrefrigeradordadostemperatura foreign key (fkRefrigerador) references SensorTemperatura(fkRefrigerador),
constraint fkestabelecimentosdadostemperatura foreign key (fkEstabelecimento) references SensorTemperatura(fkEstabelecimento),
constraint fkclientedadostemperatura foreign key (fkCliente) references SensorTemperatura(fkCliente),
Temperatura decimal(6,2),
Horario DATETIME
);

select * from dadosTemperatura;


-- TABELA QUE INFORMA A TEMPERATURA IDEAL
create table temperaturaIdeal (
idTemperatura int,
fkSensorTemperatura int,
fkRefrigerador int,
fkEstabelecimento int,
fkCliente int,
constraint pkcompostatempideal primary key (idTemperatura, fkSensorTemperatura, fkRefrigerador, fkEstabelecimento, fkCliente),
constraint fkTempSensor foreign key (fkSensorTemperatura) references SensorTemperatura(idSensorTemperatura),
constraint fkrefrigeradortempideal foreign key (fkRefrigerador) references SensorTemperatura(fkRefrigerador),
constraint fkestabelecimentotempideal foreign key (fkEstabelecimento) references SensorTemperatura(fkEstabelecimento),
constraint fkclientetempideal foreign key (fkCliente) references SensorTemperatura(fkCliente),
tempMax float,
tempMin float
);
-- INSERINDO DADOS SOBRE A TEMPERATURA IDEAL QUE CADA SENSOR DEVE CAPTAR
insert into temperaturaIdeal values 
(1, 1, 1, 1, 1, 5, -0.8),
(1, 1, 1, 1, 2, 5, -0.8);
select * from temperaturaIdeal;

-- CRIANDO UMA TABELA PARA ALGUMAS PORTAS DE REFRIGERADORES 
create table portaRefrigerador (
idPorta int,
fkRefrigerador int,
fkEstabelecimento int,
fkCliente int,
constraint pkCompPorta primary key (idPorta, fkRefrigerador, fkEstabelecimento, fkCliente),
constraint fkportaRefrigerador foreign key (fkRefrigerador) references refrigerador(idRefrigerador),
constraint fkportaEstabelecimento foreign key (fkEstabelecimento) references refrigerador(fkEstabelecimento),
constraint fkportaCliente foreign key (fkCliente) references refrigerador(fkCliente),
produtoArmazenado varchar(45),
tipoAbertura varchar(45),
constraint chkAbertura check (tipoAbertura in ('Puxar', 'Arrastar'))
);

select * from refrigerador;

-- INSERINDO DADOS DE PORTAS
insert into portaRefrigerador values
(1, 1, 1, 1,'Alcatra', 'Puxar'),
(2, 1, 1, 1, 'Picanha', 'Puxar');


select * from portaRefrigerador;

-- TABELA PARA O SENSOR DE BLOQUEIO

create table SensorBloqueio(
idSensorBloqueio int, 
fkPorta int,
fkRefrigerador int,
fkEstabelecimento int,
fkCliente int,
constraint pkCompBloqueio primary key (idSensorBloqueio, fkPorta, fkRefrigerador, fkEstabelecimento, fkCliente),
constraint fkbloqueioPorta foreign key (fkPorta) references portaRefrigerador(idPorta),
constraint fkbloqueioRefrigerador foreign key (fkRefrigerador) references portaRefrigerador(fkRefrigerador),
constraint fkbloqueioEstabelecimento foreign key (fkEstabelecimento) references portaRefrigerador(fkEstabelecimento),
constraint fkbloqueioCliente foreign key (fkCliente) references portaRefrigerador(fkCliente),
Modelo varchar(45)
);

insert into SensorBloqueio Values
 (1, 1, 1, 1, 1, 'TCRT5000'),
 (1, 2, 1 ,1, 1, 'TCRT5000');
select * from SensorBloqueio;

-- criando tabela de dados captados do sensor de bloqueio
create table dadosAbertura(
idDadoAbertura int,
fkSensorBloqueio int, 
fkPorta int,
fkRefrigerador int,
fkEstabelecimento int,
fkCliente int,
constraint pkCompdadosabertura primary key (idDadoAbertura ,fkSensorBloqueio, fkPorta, fkRefrigerador, fkEstabelecimento, fkCliente),
constraint fkdadobloqueio foreign key (fkSensorBloqueio) references SensorBloqueio(idSensorBloqueio),
constraint fkdadobloqueioPorta foreign key (fkPorta) references SensorBloqueio(fkPorta),
constraint fkdadobloqueioRefrigerador foreign key (fkRefrigerador) references SensorBloqueio(fkRefrigerador),
constraint fkdadobloqueioEstabelecimento foreign key (fkEstabelecimento) references SensorBloqueio(fkEstabelecimento),
constraint fkdadobloqueioCliente foreign key (fkCliente) references SensorBloqueio(fkCliente),
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
ultimaManutenção date
);
alter table refrigerador add constraint fkrefrigeradorArduino foreign key(fkArduino) references Arduino(idArduino);
-- INSERINDO INFORMAÇÕES SOBRE ARDUÍNOS UTILIZADOS
insert into Arduino values 
(null,'1.0.0', '2023-03-12', '2024-04-04'),
(null,'1.0.0', '2023-04-19', '2024-04-03');

insert into Arduino values
(null,'1.0.0', '2023-04-29', '2024-05-06'),
(null,'1.0.0', '2023-05-06', null);


-- EXIBINDO A DATA DE INSTALAÇÃO DE UM DETERMINADO SENSOR
select date_format(dtInstalação, '%d-%m-%y')  as 'Data de Instalação' from Arduino where idArduino = 1;
