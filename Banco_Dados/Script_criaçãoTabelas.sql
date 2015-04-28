create database BD_Canil

use BD_Canil

/*----------------------------------------------------------------------------------------------*/

create table IF NOT EXISTS Veterinario (
	codVeterinario int not null auto_increment,
    nome varchar(30) not null,
    crm varchar(10),
    cpf varchar(14),
    endereco varchar(100),
    telefone varchar(15),
    email varchar(30) not null,
    dataContratacao date,
    usuario varchar(10) not null,
    senha varchar(10) not null,
    primary key (codVeterinario)
);

/*----------------------------------------------------------------------------------------------*/

create table IF NOT EXISTS Agente (
	codAgente int not null auto_increment,
    nome varchar(30) not null,
    cpf varchar(14),
    endereco varchar(100),
    telefone varchar(15),
    email varchar(30) not null,
    dataContratacao date,
    usuario varchar(10) not null,
    senha varchar(10) not null,
    primary key (codAgente)
);

/*----------------------------------------------------------------------------------------------*/

create table IF NOT EXISTS Animal (
	codAnimal int auto_increment not null,
	nome varchar(20),
	bairroRecolhimento varchar(15),
	dataEntrada date,
	tipo varchar(8),
	sexo varchar(5),
	peso float,
	idade varchar(10),
	cor varchar(10),
	pelagem varchar(10),
	raca varchar(20),
	agressor varchar(3),
    racao varchar(10),
	observacao varchar (80),
	foto blob,
	primary key (codAnimal)
);

/*----------------------------------------------------------------------------------------------*/

create table IF NOT EXISTS Adotante (
	codAdotante int not null auto_increment,
    nome varchar(30) not null,
    cpf varchar(14),
    endereco varchar(100),
    telefone varchar(15),
    email varchar(30),
    codAnimal int not null,
    dataAdocao date,
	primary key (codAdotante),
    foreign key (codAnimal) references Animal (codAnimal)
);

/*----------------------------------------------------------------------------------------------*/

/*Não sei como cadastrar recolhimento, se vai cadastrar antes de cadastrar animal ou depois. 
Ou seja, o animal vai ser referenciado em Recolhimento, ou o Recolhimento vai ser referenciado em Animal? */
create table IF NOT EXISTS Recolhimento (
	codRecolhimento int not null auto_increment,
    codAnimal int not null,
    endereco varchar(50),
    dataRecolhimento date,
    primary key (codRecolhimento),
    foreign key (codAnimal) references Animal (codAnimal)
);

/*----------------------------------------------------------------------------------------------*/

create table IF NOT EXISTS Microchipagem (
	codMicro int not null auto_increment,
	codAnimal int not null,
    numeroMicrochip varchar(30) not null,
    dataAplicacao date not null,
    primary key (codMicro),
    foreign key (codAnimal) references Animal (codAnimal)
);

/*----------------------------------------------------------------------------------------------*/

create table IF NOT EXISTS Medicamento (
	codMedicamento int not null auto_increment,
    nomeMedicamento varchar(20) not null,
    tipo varchar(15) not null,
    doses int(5),
    descricao varchar(80),
    primary key (codMedicamento)
);

/*----------------------------------------------------------------------------------------------*/

create table IF NOT EXISTS Tratamento (
	codTratamento int not null auto_increment,
    codAnimal int not null,
    codMedicamento int not null,
    loteMedicamento varchar(20),
    quantidade int, 
    intervalo int, /*tempo entre uma aplicação e outra */
    duracao int, /* em dias*/
    observacao varchar(80),
    primary key (codTratamento),
    foreign key (codAnimal) references Animal (codAnimal),
    foreign key (codMedicamento) references Medicamento (codMedicamento)
);

/*----------------------------------------------------------------------------------------------*/

create table IF NOT EXISTS Castracao (
	codCastracao int not null auto_increment,
    codAnimal int not null,
    dataCastracao date,
    codVeterinario int not null,
    observacao varchar(80),
    primary key (codCastracao),
    foreign key (codAnimal) references Animal (codAnimal),
    foreign key (codVeterinario) references Veterinario (codVeterinario)
);

/*----------------------------------------------------------------------------------------------*/

create table IF NOT EXISTS Baia (
	codBaia int not null auto_increment,
    nomeBaia varchar(10),
    codAnimal int not null,
    primary key (codBaia),
    foreign key (codAnimal) references Animal (codAnimal)
);

/*----------------------------------------------------------------------------------------------*/

create table IF NOT EXISTS Banho (
	codBanho int not null auto_increment,
    codAnimal int not null,
    dataBanho date not null,
    sociavelPessoas boolean,
    sociavelAnimais boolean,
    primary key (codBanho),
    foreign key (codAnimal) references Animal (codAnimal)
);

/*----------------------------------------------------------------------------------------------*/

create table IF NOT EXISTS Lazer (
	codLazer int not null auto_increment,
    codAnimal int not null,
    dataLazer date not null,
    sociavelPessoas boolean,
    sociavelAnimais boolean,
    primary key (codLazer),
    foreign key (codAnimal) references Animal (codAnimal)
);

/*----------------------------------------------------------------------------------------------*/