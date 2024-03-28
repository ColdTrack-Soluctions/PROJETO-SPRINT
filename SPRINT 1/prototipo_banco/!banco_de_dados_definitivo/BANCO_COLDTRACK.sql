-- CRIANDO A NOSSA BASE DE DADOS
create database bd_coldtrack;

-- ULTILIZANDO A BASE DE DADOS
use bd_coldtrack;

-- PRIMEIRA TABELA ESTÁ ESPECIFICANDO CADA REFRIGERADOR 
create table refrigerador(
idRefrigerador int primary key auto_increment,
localFisico varchar(100),
marca varchar(50),
modelo varchar(50),
qtd_portas char(2),
produto_armazenado varchar(100),
temperatura_ideal_minino char(3),
temperatura_ideal_maxima char(3),
-- FONTE : https://www.foodconnection.com.br/sustentabilidade/como-armazenar-carnes-corretamente-no-ougue-ou-frigorifico
valor float
);

-- INSERINDO ALGUNS REFRIGERADORES AO NOSSO SISTEMA
insert into refrigerador values 

(default,'Área Frigorifica - NORTE','DuFrio','GPTU-40','2','Picanha',0,4,7565.09),
-- OUTRO REFRIGERADOR EM OUTRA ÁREA
(default,'Área Laticínios - SUL','Metal Frio','GPTU-40','1','Sorvete','-18','-20',7565.09);
-- fonte https://www.foodconnection.com.br/sorvetes/como-armazenar-sorvete-da-forma-adequada-em-sua-sorveteria

-- MOSTRANDO TODOS OS REFRIGERADORES EM TODAS AS ÁREAS
select * from refrigerador;

-- MOSTRANDO APENAS OS REFRIGERADORES COM CAPACIDADE DE 450 Litros
select * from refrigerador where produto_armazenado = 'Sorvete';

/*-----------------------------------------------------------------------------*/

-- CRIANDO UMA TABELA PARA ARMAZENAR OS DADOS FÍSICOS DO ARDUINO

create table arduino(
idArduino int primary key auto_increment,
modeloArduino varchar(50),
localFisico varchar(100),
versaoSistema varchar(100)
);

-- INSERINDO ALGUNS REGISTRO SOBRE O ARDUINO 
insert into arduino values (null,'Arduino UNO','Área Carnes - LESTE','1.0.0'),
(null,'Arduino UNO','Área de Laticinios - NORTE','1.0.0'),
(null,'Arduino UNO','Área Embutidos - SUL','1.0.0')
;

-- MOSTANDO QUANTOS ARDUINOS ESTÃO INSTALADOS EM DEVIDO LUGAR
select * from arduino;

-- CRIANDO UMA TABELA PARA MOSTRAR QUAIS SÃO OS SENSORES QUE ESTAMOS ULTILIZANDO
create table sensores(
idSensor int primary key auto_increment,
nome varchar(50),
funcao varchar(30),
descricao longtext
);

-- INSERINDO DADOS SOBRE QUAIS SENSORES ESTAMOS ULTILIZANDO
insert into sensores values 
(null, 'TRCT 5000', 'Sensor de Proximidade','Responsável por captar quantidade de vezes que devida porta foi aberta ou fechada'),
(null,'LM 35',' Sensor de Temperatura', 'Captura temperaturas de -55°C até 150°C, com esse sensor iremos monitorar a temperatura INTERNA do refrigerador')
;

-- MOSTRANDO QUAIS SENSORES ESTAMOS ULTILIZANDO ATUALMENTE NO PROJETO 
select * from sensores;

-- CRIANDO UMA TABELA PARA INSERIR OS DADOS REGISTRADOS COM NOSSO SENSORES (TEMPERATURA & PROXIMIDADE)
create table dadosCaptura(
-- idArduinoResponsavelCaptura 'fk'
-- idRefrigerador 'fk'
idDados int primary key auto_increment,
temperatura float,
proximidade char(1),
dataHora datetime default current_timestamp
);

/* INSERINDO ALGUNS REGRISTROS DE DADOS DOS SENSORES (APENAS UM EXEMPLO)

	OBS : Em nosso projeto real usaremos uma API que irá dizer ao banco apenas quando as portas foram abertas e o seu respectivo horario.
*/
insert into dadosCaptura values
(default,2.4,'1',default),
(default,2.5,'1',default),
(default,2.4,'1',default),
(default,2.4,'1',default),
(default,2.2,'0',default);

-- VIZUALIZANDO DADOS DE ABERTURA 
select * from dadosCaptura;

-- VIZUALIZANDO DADOS DE ABERTURA DO DIA '18-03-2024'
SELECT * FROM dadosCaptura WHERE DATE(dataHora) = '2024-03-18';


-- AQUI É ONDE ESTARA ARMAZENADOS OS DADOS DE CADASTRO DOS PONTOS DE VENDA 
create table ponto_venda(
idPontoVenda int primary key auto_increment,
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
estado varchar(50),
pais varchar(50)
);

-- INSERINDO EMPRESAS PONTO DE VENDA DE NOSSO SISTEMA
insert into ponto_venda values

(null,'Carrefour','administracao@carrefour.com','Password','xxxxxxxx','11111111111111',
'Rua Abrahão Gonçalves Braga','412','00000000','Unidade Leste', 'São Paulo','São Paulo', 'Brasil'),

(null,'Extra','administracao@extra.com','Password','xxxxxxxx','2222222222222',
'Rua joão alves pimenta','201','00000000','Unidade Sul', 'São Paulo','Diadema', 'Brasil');


-- MOSTRANDO TODOS OS NOSSOS CLIENTES JUNTAMENTE COM OS DEVIDOS DADOS
select * from ponto_venda;

-- CRIANDO UMA TABELA SOBRE NÓS (COLD TRACK)
create table coldtrack(
idUnidade int primary key auto_increment,
cnpj char(14),
responsavel varchar(50),
emailResponsavel varchar(50),
logradouro varchar(100),
numero varchar(10),
cep char(8),
complemento varchar(100)
);

-- CRIANDO NOVAS UNIDADES COLDTRACK
insert into coldtrack values (null,'04821041000108','Cindy oliveira','cindy.oliveira@coldtrack.com','Rua Haddock Lobo','595','01414001','Travessa da Av. Paulista - São Paulo');

-- MOSTRANDO QUAIS UNIDADES TEMOS !
select * from coldtrack;

