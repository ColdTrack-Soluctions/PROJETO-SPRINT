USE sprint1;

CREATE TABLE ColdTrack (
idColdTrack int primary key,
cnpj char (14),
responsavel varchar (40), 
email varchar (40),
logradouro varchar (80),
numero varchar (10),
cep char (8));

DESCRIBE ColdTrack;

INSERT INTO ColdTrack VALUES 
(1, '99807854000190', 'Felipe Albertim', 'cold.track.solutions@gmail.com', 'Rua Hadoock Lobo', 538, '01310930');

SELECT * FROM ColdTrack;


CREATE TABLE refrigerador (
idRefrigerador int primary key,
localizacao varchar (90),
marca varchar (15),
modelo varchar (50),
capacidade varchar (4),
valor int);

INSERT INTO refrigerador VALUES 
(1, 'corredorA', 'Frigelar', 'Expositor Vertical', 366, 2799),
(2, 'corredorB', 'CastellMaq', 'VB40AH', 406, 4511),
(3, 'corredorC', 'MetalFrio', 'EEV500P2', 510, 3969);

SELECT * FROM refrigerador;


CREATE TABLE sensores (
nome varchar (20),
funcao varchar (50),
descricao varchar (100));
 
 ALTER TABLE sensores ADD COLUMN idSensores int primary key;
 
 DESCRIBE sensores;
 
 INSERT INTO sensores VALUES
 ('LM35', 'Monitorar Temperatura', 'Usaremos esse sensor para evitar a perda do seu produto', 1),
 ('TRC5000', 'Otimizar vendas', 'Ver qual produto está sendo mais requisitado', 2); 
 
 SELECT * FROM sensores;
 
 CREATE TABLE contratante (
 idContratante int primary key auto_increment,
 nomeEmpresa varchar (50),
 cnpj char (14),
 responsavel varchar (50),
 emailEmpresa varchar (50),
 logradouro varchar (100),
 numero varchar (10),
 cep char (8));
  
  DESCRIBE contratante;
  
  INSERT INTO contratante VALUES 
  (1, 'Frigelar', 89675007000498, 'Marcos Londres', 'frigelar@gmail.com', 'Avenida Paulista', 780, 01153000),
  (2, 'MetalFrio', 37768268000223, 'Gisele Bunchen', 'metalfrio.gelo@gmail.com', 'Rua Bela Vista', 245, 01197000);
  
  SELECT * FROM contratante;
  
  CREATE TABLE arduino (
  idArduino int primary key,
  modelo varchar (20),
  localFisico varchar (40),
  versao varchar (50));
  
  INSERT INTO arduino VALUES 
  (1, 'UNO', 'Corredor de Refrigeração de Embutidos', 2.00),
  (2, 'UNO', 'Corredor de Refrigeração de Bebidas', 2.00),
  (3, 'UNO', 'Corredor de Refrigeração de Laticínios', 2.00),
  (4, 'UNO', 'Corredor de Refrigeração de Congelados', 2.00);
  
  SELECT * FROM arduino;
  
  CREATE TABLE DadosArduino (
  idDadosArduino int primary key,
  registroTRCT5000 char(1),
  registroLM35 float,
  dataHoraRegistro datetime);
  
  INSERT INTO DadosArduino VALUES
  (1, '1', 17.5, '2024-03-27 15:30'),
  (2, '1', 18.0, '2024-03-27 15:31'),
  (3, '0', 18.5, '2024-03-27 15:32'),
  (4, '0', 19.0, '2024-03-27 15:33');
  
  SELECT * FROM DadosArduino;
  
  
  
 
 
 
 
 
 





