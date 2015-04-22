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

/* Sera que é melhor cadastrar o MicroChip como dado do animal?
Pois há poucos dados na tabela Michochipação, e não faz sentido o numero do microchip do animal ficar lá.
Para associar o animal com o numero do chip terá de acessar o prontuario do animal + Microchipação, não faz sentido. */
create table IF NOT EXISTS Animal(
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
create table IF NOT EXISTS Recolhimento(
	codRecolhimento int not null auto_increment,
    codAnimal int not null,
    endereco varchar(50),
    dataRecolhimento date,
    primary key (codRecolhimento),
    foreign key (codAnimal) references Animal (codAnimal)
);

/*----------------------------------------------------------------------------------------------*/

/* Tipo de racao deve ficar em Prontuario */ 
create table IF NOT EXISTS Prontuario(
	codProntuario int not null auto_increment,
    codAnimal int not null,
    racao varchar(10),
    primary key (codProntuario),
    foreign key (codAnimal) references Animal (codAnimal)
);

/*----------------------------------------------------------------------------------------------*/

create table IF NOT EXISTS Microchipagem(
	codMicro int not null auto_increment,
	codAnimal int not null,
    codProntuario int not null,
    numeroMicrochip varchar(30) not null,
    dataAplicacao date not null,
    primary key (codMicro),
    foreign key (codAnimal) references Animal (codAnimal),
    foreign key (codProntuario) references Prontuario (codProntuario)
);

/*----------------------------------------------------------------------------------------------*/

/*Ver como vamos tratar as doses, ou modo de aplicaçao (posologia do medicamento) */
create table IF NOT EXISTS Medicamento (
	codMedicamento int not null auto_increment,
    nomeMedicamento varchar(20) not null,
    tipo varchar(15) not null,
    doses int(5),
    descricao varchar(80),
    primary key (codMedicamento)
);

/*----------------------------------------------------------------------------------------------*/

/* Ver se o dado Periodo é necessário e se for ver como tratar periodo de aplicacao, 
se vai ser em dias ou em horas, pois isso ficará nas atividades futuras */
create table IF NOT EXISTS Tratamento (
	codTratamento int not null auto_increment,
    codProntuario int not null,
    codMedicamento int not null,
    loteMedicamento varchar(20),
    periodo int,
    observacao varchar(80),
    primary key (codTratamento),
    foreign key (codProntuario) references Prontuario (codProntuario),
    foreign key (codMedicamento) references Medicamento (codMedicamento)
);

/*----------------------------------------------------------------------------------------------*/

create table IF NOT EXISTS Castracao(
	codCastracao int not null auto_increment,
    codProntuario int not null,
    dataCastracao date,
    codVeterinario int not null,
    observacao varchar(80),
    primary key (codCastracao),
    foreign key (codProntuario) references Prontuario (codProntuario),
    foreign key (codVeterinario) references Veterinario (codVeterinario)
);

/*----------------------------------------------------------------------------------------------*/

/* Não sei uma forma eficiente de criar isso, pois vamos pesquisar por data... 
se criar um histórico para cada coisa vai ter muitos campos em NULL, isso seria pouco eficiente.
Precisa ver uma forma eficiente de fazer isso pois é o que vai agendar como proxima atividade de banho, por exemplo */
create table IF NOT EXISTS Historico (
	codHistorico int not null auto_increment,
    codProntuario int not null,
    dataBanho date,
    dataLazer date,
    sociavelPessoas boolean,
    sociavelAnimais boolean,
    observacao varchar(80),
    codAgente int,
    primary key (codHistorico),
    foreign key (codAgente) references Agente (codAgente)
);
