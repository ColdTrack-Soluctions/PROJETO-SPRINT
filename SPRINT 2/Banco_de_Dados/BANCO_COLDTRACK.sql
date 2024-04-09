-- CRIANDO A NOSSA BASE DE DADOS
create database bd_coldtrack;
-- drop database bd_coldtrack;
-- ULTILIZANDO A BASE DE DADOS
use bd_coldtrack;

create table cliente(
idCliente int primary key auto_increment,
nomeCliente varchar(100) not null,
emailCliente varchar(100) not null,
senha varchar(255),
cnpj char(14),
qtdRefrigeradores int,
logradouro varchar(100),
numero varchar(10),
cep char(8),
complemento varchar(100),
cidade varchar(50),
estado varchar(50),
pais varchar(50)
);

-- INSERINDO EMPRESAS PONTO DE VENDA DE NOSSO SISTEMA
insert into cliente values
(null,'Carrefour','administracao@carrefour.com','Password','11111111111111', 5,
'Rua Abrahão Gonçalves Braga','412','00000000','Unidade Leste', 'São Paulo','São Paulo', 'Brasil'),
(null,'Extra','administracao@extra.com','Password','2222222222222', 7,
'Rua joão alves pimenta','201','00000000','Unidade Sul', 'São Paulo','Diadema', 'Brasil');


-- MOSTRANDO TODOS OS NOSSOS CLIENTES JUNTAMENTE COM OS DEVIDOS DADOS
select * from cliente;

-- PRIMEIRA TABELA ESTÁ ESPECIFICANDO CADA REFRIGERADOR 
create table refrigerador(
idRefrigerador int primary key auto_increment,
localFisico varchar(100),
marca varchar(50),
modelo varchar(50),
qtd_portas char(2),
fkCliente int,
constraint fkRefrigeradorCliente foreign key (fkCliente) references cliente(idCliente)
);


-- INSERINDO ALGUNS REFRIGERADORES AO NOSSO SISTEMA
insert into refrigerador values 

(1,'Área Frigorifica - NORTE','DuFrio','GPTU-40','2', 1),
-- OUTRO REFRIGERADOR EM OUTRA ÁREA
(default,'Área Frigorifica - SUL','Metal Frio','GPTU-40','1', 2);



-- MOSTRANDO TODOS OS REFRIGERADORES EM TODAS AS ÁREAS
select * from refrigerador;

select * from refrigerador join cliente on fKCliente = idCliente;

-- MOSTRANDO APENAS OS REFRIGERADORES COM CAPACIDADE DE 450 Litros
select * from refrigerador where produto_armazenado = 'Picanha';

/*-----------------------------------------------------------------------------*/

create table PortaRefrigerador(
idPorta int,
fkRefrigerador int,
constraint pkCompPorta primary key (idPorta, fkKRefrigerador),
produtoArmazenado varchar(45),
fkSensor int,
constraint fkPortaRefrigeradorSensor foreign key (fkSensor) references sensor(idSensor),
constraint fkPortaRefrigeradorRefrigerador foreign key (fkRefrigerador) references refrigerador(idRefrigerador));

insert into PortaRefrigerador values
(1, 1, 'Coxão Duro', 1),
(2, 2, 'Salmão', 2),
(3, 1, 'Fraldinha', 2);
;

select * from PortaRefrigerador;

select * from PortaRefrigerador join refrigerador on fkRefrigerador = idRefrigerador join sensor on fkSensor = idSensor;

/*-----------------------------------------------------------------------------*/
-- CRIANDO UMA TABELA PARA ARMAZENAR OS DADOS FÍSICOS DO ARDUINO

create table sensor(
idSensor int primary key auto_increment,
localFisico varchar(100),
versaoSistema varchar(100),
dtInstalação date,
ultimaManutenção date
);

-- INSERINDO ALGUNS REGISTRO SOBRE O ARDUINO 
insert into sensor values 
(null,'Área Frigorifica - NORTE','1.0.0', '2023-03-12', '2024-04-04'),
(null,'Área Frigorifica - SUL','1.0.0', '2023-04-19', '2024-04-03');

-- MOSTANDO QUANTOS ARDUINOS ESTÃO INSTALADOS EM DEVIDO LUGAR
select * from sensor;

-- CRIANDO UMA TABELA PARA INSERIR OS DADOS REGISTRADOS COM NOSSO SENSORES (TEMPERATURA & PROXIMIDADE)
create table dadosCaptura(
idDados int,
fkSensor int,
constraint pkCompDados primary key (idDados, fkSensor),
temperatura float,
qtdAbertura varchar(45),
dataHora datetime default current_timestamp,
constraint fkDadosSensor foreign key (fkSensor) references sensor (idSensor) 
);

/* INSERINDO ALGUNS REGRISTROS DE DADOS DOS SENSORES (APENAS UM EXEMPLO)

	OBS : Em nosso projeto real usaremos uma API que irá dizer ao banco apenas quando as portas foram abertas e o seu respectivo horario.
*/
insert into dadosCaptura values
(1, 1, 2.4,'9',default),
(2, 1, 2.5,'11',default),
(3, 1, 2.4,'14',default),
(4, 2, 2.4,'19',default),
(5, 2, 2.2,'10',default);

select * from dadosCaptura join sensor on fkSensor = idSensor;

-- VIZUALIZANDO DADOS DE ABERTURA 
select * from dadosCaptura;

-- VIZUALIZANDO DADOS DE ABERTURA DO DIA '18-03-2024'
SELECT * FROM dadosCaptura WHERE DATE(dataHora) = '2024-03-18';


-- AQUI É ONDE ESTARA ARMAZENADOS OS DADOS DE CADASTRO DOS PONTOS DE VENDA 

-- TABELA TEMPERATURAS MÁXIMAS E MÍNIMAS

create table temperaturas (
idTemperaturas int,
fkDadosCaptura int,
constraint pkCompTemp primary key (idTemperaturas, fkDadosCaptura),
tempMax float,
tempMin float,
constraint fkTempDadosCap foreign key (fkDadosCaptura) references dadosCaptura(idDados));

insert into temperaturas values 
(1, 2, 5, -1),
(2, 2, 5.3, -0.8),
(3, 1, 3.5, -2.2),
(4, 3, 4, 0.3),
(5, 4, 6.2, -3),
(6, 5, 4.7, -1.2);

select * from temperaturas;