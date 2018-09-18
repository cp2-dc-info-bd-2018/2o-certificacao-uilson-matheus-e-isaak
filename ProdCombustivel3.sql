use ProdCombustiveis;

create table plataforma(
	id int,
	tipo varchar(30),
	nome varchar(30),
	area_m2 float,
	distanciadapraia float,
	engchaefe int,
	quichefe int,
	primary key(id)
    /*foreign key (engchefe) references engenheiro(id),*/
	/*foreign key (quichefe) references quimico(id),*/
	);

create table manutencao(
	id int,
	nome varchar(30),
	nascimento date,
	idplataforma int
	primary key(id),
	foreign key (idplataforma) references plataforma(id)
	);

create table helicoptero(
	id int,
	modelo varchar(30),
	capacidade float
	primary key(id),
	);

create table plathelicoptero(
	idhelicop int,
	idplataforma int
	primary key (idhelicop,idplataforma),
	foreign key (idhelicop) references helicoptero(id),
	foreign key (idplataforma) references plataforma(id),
	);

create table navio(
	id int,
	nome varchar(30),
	capacidade float
	primary key(id)
	);

	create table refinaria(
	id int,
	localizacao varchar(30),
	engchefe int,
	quichefe int
	primary key(id),
	/*foreign key (engchefe) references engenheiro(id),*/
	/*foreign key (quichefe) references quimico(id),*/
	);

ALTER TABLE Plataforma
ADD foreign key (engchefe) references engenheiro(id);

ALTER TABLE Plataforma
ADD foreign key (quichefe) references quimico(id);

ALTER TABLE Refinaria
ADD foreign key (engchefe) references engenheiro(id);

ALTER TABLE Refinaria
ADD foreign key (quichefe) references quimico(id);



	create table engenheiro(
	id int,
	nome varchar(30),
	nascimento date,
	idplataforma int,
	idrefinaria int,
	primary key(id),
	foreign key (idplataforma) references plataforma(id),
	foreign key (idrefinaria) references refinaria(id),
	);


	create table platoleo(
	idPlataforma int,
    idOleoduto int,
    primary key (idPlataforma,idOleoduto),
    foreign key (idplataforma) references plataforma(id),
    foreign key (idOleoduto) references Oleoduto(id)
	);

create table mergulhador(
	id int,
	nome varchar(30),
	nascimento date,
	idplataforma int,
	primary key(id),
	foreign key (idplataforma) references plataforma(id)
	);
    
create table oleoduto(
	id int,
	comprimento float,
    volume_min float,
    primary key (id)
);
  
create table tanque(
	id int,
    capacidade float,
    idPlataforma int,
    idOleduto int,
    primary key (id),
    foreign key (idplataforma) references plataforma(id)
    foreign key (idOleduto) references oleoduto(id)
);  

create table NavPlat(
	idNavio int,
    idPlataforma int,
    primary key (idNavio,idPlataforma),
    foreign key (idplataforma) references plataforma(id),
    foreign key (idplataforma) references plataforma(id)
);

create table quimico(
	id int,
    nome char(30),
    nascimento date,
    idplataforma int,
    idRefinaria int,
    primary key (id),
    foreign key (idplataforma) references plataforma(id),
    foreign key (idRefinaria) references Refinaria(id)
);

create table OleoRefinaria(
	idOleo int,
    idRefinaria int,
    primary key (idOleo,idRefinaria),
	foreign key (idRefinaria) references Refinaria(id),
    foreign key (idOleo) references Oleo(id)    
);

create table destilador(
	id int,
    capacidade float,
    idRefinaria int,
    primary key (id),
    foreign key (idRefinaria) references refinaria(id)
);

create table transportadora(
	id int,
    nome varchar (30),
    primary key (id)
);

create table diesel(
	id int,
    tipo varchar(30),
    cor varchar(30),
    idDestilador int,
    idTransportadora int,
    primary key (id),
    foreign key (idDestilador) references Destilador(id),
    foreign key (idTransportadora) references Transportadora(id)
);

create table gasolina(
	id int,
    tipo varchar(30),
    cor varchar(30),
    idDestilador int,
    idTransportadora int,
    primary key (id),
    foreign key (idDestilador) references Destilador(id),
    foreign key (idTransportadora) references Transportadora(id)
);

create table caminhao(
	id int,
    fabricante varchar(30),
    modelo varchar(30),
    idTransportadora int,
    primary key (id),
    foreign key (idTransportadora) references Transportadora(id)
);
create table posto(
	id int,
    empresa varchar(30),
    lugar varchar(30),
    primary key(id)
);

create table TransPosto(
	idTransportadora int,
    idPosto int,
    primary key (idTransportadora,idPosto),
    foreign key (idTransportadora) references Transportadora(id),
    foreign key (idPosto) references Posto(id)
);

insert into plataforma (id,nome,area_m2,distanciadapraia, engchefe, quichefe) values
	(1, 'Plataforma fixa', 1178.2, 1678.2,'2','1'),
	(2, 'Plataforma autoelevável',2567.2, 2673.2, '1','1'),
	(3, 'Plataforma semissubmersível',2914.2, 3647.2, '1','1'),
	(4, 'Plataforma navio-sonda',4275.2, 6245.2, '1','1'),
	(5, 'Plataforma FPSO', 5246.2, 7452.2,'1', '1'),
	(6, 'Plataforma FPSO Monocoluna', 5243.2, 9632.3, '1', '1'),
	(7, 'Plataforma TLWP', 7253.2, 9824.3, '1', '1');

insert into manutencao (id, nome, nascimento, idplataforma) values
	(1, 'José Pereira da Silva', 1882/02/17, 1),
	(2, 'Marcos da Costa', 1883/03/18, 2),
	(3, 'Joao Macedo de Oliveira', 1884/04/19, 3),
	(4, 'Valdenildo da Silveira', 1885/05/20, 4),
	(5, 'Isaque Silva Santos', 1886/06/21, 5),
	(6, 'Lucas da Rocha', 1887/07/22, 6),
	(7, 'João Lucas Lima', 1888/08/23, 7);

insert into helicoptero (id, modelo, capacidade) values
	(1, 'AW109SP',11),
	(2, 'AW139', 17),
	(3, 'EC225', 15),
	(4, 'EC725', 20),
	(5, 'EC 130 T2', 8);

insert into plathelicoptero (idhelicop, idplataforma) values
	(1,2),
	(1,4),
	(2,5),
	(2,3),
	(1,1),
	(2,6),
	(4,7),
	(5,1);

insert into navio (id, nome, capacidade) values
	(1,'NAVIO-TANQUE 23000', 23600),
	(2,'NAVIO-TANQUE 8000', 7730),
	(3,'NAVIO-TANQUE', 5730),
	(3,'NAVIO-TANQUE 8000 CALADO PARA ÁGUAS RASAS', 7998),
	(3,'ECO LINER 1145', 3100);

insert into refinaria (id, localizacao, engchefe, quichefe) values
	(1, 'Duque de Caxias','1','1'),
	(1, 'Rio de Janeiro','1','1'),
	(1, 'Rio de Janeiro','1','1'),
	(1, 'Rio de Janeiro','1','1'),
	(1, 'Rio de Janeiro','1','1');

insert into engenheiro (id, nome, nascimento, idplataforma, idrefinaria) values
	(1, 'Gabriel Dias Toledo', 1947/06/03, 1,2),
	(2, 'Fernando Coelho Silva', 1948/07/04,2,3),
	(3, 'Gilson Vianna Nogueira', 1949/08/05,3,4),
	(4, 'Jasmine Machado Souto', 1950/09/06,4,5),
	(5, 'Abraão Moisés Pinto', 1951/10/07,5,6),
	(6, 'Benjamin Buttom', 1952/11/08,6,7),
	(7, 'Patrick Souza Souza', 19453/12/09,7,5),
	(8, 'Beatriz Jacinto Richa', 1954/01/10,4,3);

insert into platoleo (idPlataforma, idOleoduto) values
	(1,2),
	(2,3),
	(3,4),
	(4,5),
	(5,1),
	(4,3);

insert into mergulhador (id, nome, nascimento, idplataforma) values
        (1, 'Stuart Little', 21/12/1990, 1),
	(2, 'Luis Felipe', 12/03/1986, 2),
	(3, 'Esdras', 01/01/1983, 3),
	(4, 'Tito', 03/05/1985, 4),
	(5, 'Filemon', 17/12/1989, 5),
	(6, 'Turutreu', 23/12/1986, 6),
	(7, 'Morfeu', 13/12/1983, 7);

insert into oleoduto (id, comprimento, volume_min) values
	(1, 235, 5),
	(2, 121, 3),
	(3, 83, 2);

insert into tanque (id, capacidade, idPlataforma, idOleoduto) values
    (1, 3526.3 ,1,2),
    (2, 4637.3, 2,4),
    (3, 7354.3, 5,3),
    (4,2463.3,3,4);

insert into NavPlat (idNavio, idPlataforma) values
	(1,4),
	(4,1),
	(3,2),
	(2,3),
	(3,1);
insert into quimico (id, nome, nascimento, idplataforma, idRefinaria) values
	(1, 'Jacinto Nogueria', 1892/03/15, 1, 1),
	(2, 'Valdisney Oliveira', 1893/04/16, 3, 2),
	(3, 'Gustavo Brabo', 1895/05/17, 4, 3),
	(4, 'João Gustavo Silva', 1894/04/16, 5, 4),
    (5, 'John Dalton', 1988/06/14, 2, 3),
	(6, 'Antoine Lavousier', 1979/03/12, 3,4);

insert into OleoRefinaria (idOleo, idRefinaria) values
	(1,4),
	(3,2),
	(5,2),
	(5,1),
	(2,1),
	(5,4),
	(1,5);

insert into destilador (id,capacidade,idrefinaria) values
	(1,5362.3,1),
	(2,2536.3,2),
	(3,7345.3,3),
	(4,6152.3,4);

insert into transportadora (id, nome) values
	(1,'Falcão'),
	(2,'Transp. Nacional'),
	(3,'Transbet'),
	(4,'Prisma'),
        (5,'COBRASCAM'),
        (6,'Eureka Transportes'); 

insert into diesel (id, tipo, cor ,iddestilador, idtransportadora) values
	(1,'Óleo Diesel Comum e Extra Aditivado S10 e S50', 'Incolor' ,1, 2),
	(2,'Óleo Diesel Comum e Extra Aditivado S500', 'Vermelha' ,2, 3),
	(3,'Óleo Diesel Comum e Extra Aditivado S1800', 'Amarela, Laranja' ,3, 4),
	(4,'Óleo Diesel Marítimo DMA / DMB', 'Vermelha' ,4, 5);

insert into gasolina (id,tipo,cor,iddestilador,idtransportadora) values
	(1,'Gasolina comum','Incolor',1,2),
	(2,'Gasolina aditivada','Verde',2,3),
	(3,'Gasolina premium','Laranja',3,4),
	(4,'Etanol','Incolor',4,5);

insert into caminhao (id, fabricante, modelo, idTransportadora) values
	(1, 'Volks', 24250,'1'),
        (2, 'Volks', 8150, '2'),
        (3, 'Mercedes', 710, '3'),
        (4, 'Volks', 9150, '4'),
        (5, 'Volvo', 'FH 460', '5'),
        (6, 'Mercedes', 'Accelo 815', '6');

insert into posto (id, empresa, lugar) values
	(1, 'Posto Ipiranga', 'Av.Dr. Manoel Teles'),
    (2, 'BR Petrobras', 'Avenida Governador Leonel'),
    (3, 'Shell', 'Duque de Caxias'),
    (4, 'Posto Lord', 'Rua Marechal Floriando'),
    (5, 'Shell', 'Nilo Peçanha'),
    (6, 'Posto Ipiranga', 'Av.Brg. Lima e Silva'); 

insert into TransPosto (idTransportadora, idPosto) values
	(1,1),
    (1,3),
    (1,5),
    (2,2),
    (2,6),
    (3,1),
    (3,2),
	(3,5),
	(4,3),
	(4,4),
	(5,2),
	(5,6),
	(6,5),
	(6,6);