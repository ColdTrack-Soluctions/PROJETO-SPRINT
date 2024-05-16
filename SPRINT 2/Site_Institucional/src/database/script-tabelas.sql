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
qtdPortas char(2),
fkEstabelecimento int,
constraint fkRefrigeradorEstabelecimento foreign key (fkEstabelecimento) references estabelecimento(idEstabelecimento)
);

-- INSERINDO DADOS SOBRE REFRIGERADORES
insert into refrigerador values 
(default,'Área Frigorifica - NORTE','DuFrio','GPTU-40','2', 1),
(default,'Área Frigorifica - SUL','Metal Frio','GPTU-40','1', 2);


select * from refrigerador;

-- VISUALIZANDO A ÁREA DO REFRIGERADORES ONDE A QUANTIDADE DE PORTAS É "2"
select localFisico as Área from refrigerador where qtdportas = 2;


-- TABELA PARA O ARDUÍNO E SUAS INFORMAÇÕES
create table Arduino(
idArduino int primary key auto_increment,
versaoSistema varchar(100),
dtInstalação date,
ultimaManutenção date
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

-- TABELA PARA O SENSOR DE TEMPERATURA 

create table SensorTemperatura(
idSensorTemperatura int primary key auto_increment, 
fkArduino int, 
constraint fkArduinoTemperatura foreign key (fkArduino) references Arduino (idArduino));

 insert into SensorTemperatura values
 (default, 1),
 (default, 2),
 (default, 3),
 (default, 4);
 
 select * from SensorTemperatura;
 
 -- TABELA PARA O SENSOR DE BLOQUEIO

create table SensorBloqueio(
idSensorBloqueio int primary key auto_increment, 
fkArduino int, 
constraint fkArduinoBloqueio foreign key (fkArduino) references Arduino (idArduino));

insert into SensorBloqueio Values
 (default, 1),
 (default, 2),
 (default, 3),
 (default, 4);

select * from SensorBloqueio;

-- CRIANDO UMA TABELA PARA ALGUMAS PORTAS DE REFRIGERADORES 
create table portaRefrigerador (
idPorta int,
fkRefrigerador int,
constraint pkCompPorta primary key (idPorta, fkRefrigerador),
produtoArmazenado varchar(45),
tipoAbertura varchar(45),
constraint chkAbertura check (tipoAbertura in ('Puxar', 'Arrastar')),
fkArduino int,
constraint fkPortaArduino foreign key (fkArduino) references Arduino (idArduino));

-- INSERINDO DADOS DE PORTAS
insert into portaRefrigerador values
(1, 1, 'Alcatra', 'Puxar', 1),
(2, 1, 'Picanha', 'Puxar', 1),
(1, 2, 'Maminha', 'Arrastar', 2);

select * from portaRefrigerador;


-- VISUALIZANDO O IDENTIFICADOR DA PORTA, SEU PRODUTO E A SUA ÁREA NO MERCADO DE CARNE
select portaRefrigerador.idPorta as 'Número da Porta', portaRefrigerador.produtoArmazenado as Produto,
	refrigerador.localFisico as Área from portaRefrigerador
	join refrigerador on idRefrigerador = fkRefrigerador;


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
(1, 1, 5, -2.3),
(2, 2, 5, -0.8);

select * from temperaturaIdeal;

-- EXIBINDO A TEMPERATURA MÁXIMA QUE UM DETERMINADO SENSOR DEVE CAPTAR ANTES DE NOTIFICAR O SISTEMA
select Arduino.idArduino as 'Identificador do Arduino', temperaturaIdeal.tempMax as 'Temperatura Máxima' 
	from temperaturaIdeal 
	join Arduino on fkSensorTemperatura = idArduino where idArduino = 2;

-- CRIANDO UMA TABELA PARA INSERIR OS DADOS REGISTRADOS COM NOSSO SENSORES (TEMPERATURA & PROXIMIDADE)
create table dadosCaptados(
idDadosCaptados int,
fkSensorTemperatura int,
fkSensorBloqueio int, 
constraint pkCompDados primary key (fkSensorTemperatura, idDadosCaptados, fkSensorBloqueio),
qtdAbertura int, 
temperatura float,
dataHora datetime default current_timestamp,
constraint fkDadosTemperatura foreign key (fkSensorTemperatura) references sensorTemperatura(idSensorTemperatura),
constraint fkDadosBloqueio foreign key (fkSensorBloqueio) references sensorBloqueio(idSensorBloqueio));

alter table dadosCaptados modify column idDadosCaptados int auto_increment;

-- INSERINDO ALGUNS REGRISTROS DE DADOS DOS SENSORES (APENAS UM EXEMPLO)

-- OBS : Em nosso projeto real usaremos uma API que irá dizer ao banco apenas quando as portas foram abertas e o seu respectivo horario.

insert into dadosCaptados values
(1, 1, 1, 5, 2.3, default),
(2, 2, 2, 2, 0.5, default),
(3, 3, 3, 6, 0.4, default),
(4, 4, 4, 8, -1.3, default);

select * from dadosCaptados;

select * from dadosCaptados join sensorTemperatura on fkSensorTemperatura = idSensorTemperatura;


    

