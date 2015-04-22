create database BD_Canil

use BD_Canil
create table IF NOT EXISTS Animal(
	registro_animal int auto_increment not null,
	nome varchar(20),
	bairro_recolhimento varchar(15),
	data_entrada date,
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
	primary key (registro_animal)
);

select * from Animal

/*Forma correta de inserir dados na tabela*/
insert into Animal (bairro_recolhimento, nome, data_entrada, tipo, sexo, peso, idade, cor, pelagem, raca, agressor, foto, observacao)
values ("Bairro Alto", "Paçoca" , '2011-04-11', "Cachorro", "Fêmea", '2.500', "Adulto", "Marrom", "Longa", "Biggle", "nao", NULL, "Nada a declarar");

/*Não sei como cadastrar recolhimento, se vai cadastrar antes de cadastrar animal ou depoius. E se o animal vai ser referenciado em Recolhimento, ou se Recolhimento vai ser referenciado em Animal */
create table if not exists Recolhimento(
	codRecolhimento int not null auto_increment,
    codAnimal int not null,
    endereco varchar(50),
    dataRecolhimento date,
    primary key (codRecolhimento),
    foreign key (codAnimal) references Animal (registro_animal)
);

select * from Recolhimento;

insert into Recolhimento (codAnimal, endereco, dataRecolhimento)
values (2, "Rua Alferes, 157, Bairro Alto", '2015-04-20');


create table IF NOT EXISTS Prontuario(
	codProntuario int not null auto_increment,
    codAnimal int not null,
    racao varchar(10),
    microchip varchar(30),
    primary key (codProntuario),
    foreign key (codAnimal) references Animal (registro_animal)
);

select * from Prontuario