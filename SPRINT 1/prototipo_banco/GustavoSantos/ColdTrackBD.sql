use sprint1;

CREATE TABLE coldTrack (
idCold int primary key,
nomeCold varchar (40),
especialidade varchar(200),
tipoSensores varchar (100),
tipoClientes varchar (50),
cnpj varchar (20),
emailCold varchar (50)
);

describe coldTrack;

insert into coldTrack values
(1, 'Cold Track', 'Implementação de sensores em Refrigeradores', 'Sensores de temperatura e bloqueio', 'distribuidoras de Refrigeradores', '12.234.567/0001-00','coldTrack@gmail.com');

select * from coldTrack;



Create table enderecoCold (
pais varchar (50),
cidade varchar(50),
rua varchar (50),
cep varchar (50),
logradouro varchar (100),
bairro varchar (40),
complemento varchar (50),
numero int
);

DESCRIBE enderecoCold;

insert into enderecoCold values
('Brasil','São Paulo Capital','Rua Haddock Lobo', ' 01414-001','Centro Público','Cesar cerqueira', 'Colégio de ensino superior, Universidade privada', 595);

select * from enderecoCold;

Create table empresas (
idEmpresa int primary key auto_increment,
nomeEmpresa varchar (100),
cnpj varchar (60),
emailEmpresa varchar (50),
telefoneEmpresa varchar (50),
rua varchar (50),
cep varchar (50),
logradouro varchar (100),
complemento varchar (50),
numero int
);

describe empresas;

insert into empresas value
(null,'Metal Frio','01.111.222.333/0003-78','MetalFrio123@gmail.com','11 98181-2012','Rua Mario Paulo','08451-590','Centro Público','Prédio Luxo empresarial','505'),
(null,'Brastemp','12.222.333.003/0003-99','Brastemp@gmail.com','11 99999-0012','Avenida Josue Legal','02342-111','Centro Público','Prédio sabio','123');

select * from empresas;

CREATE TABLE sensores (
idSensor int primary key auto_increment,
nomeSensor varchar (50),
funcao varchar (40)
);

describe sensores;

insert into sensores value
(null, 'Sensor de temperatura','Medir a temperatura'),
(null,'Sensor de bloqueio','Detectar presenças');

Create table temperatura (
dataHora timestamp,
temperatura float
);

describe temperatura;

CREATE TABLE bloqueio(
requisicao float,
demonstracao varchar(50)
);

describe bloqueio;
