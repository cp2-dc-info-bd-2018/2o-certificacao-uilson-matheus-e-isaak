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
