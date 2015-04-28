use BD_Canil

select * from Animal

/*Forma correta de inserir dados na tabela*/
insert into Animal (nome, bairroRecolhimento, dataEntrada, tipo, sexo, peso, idade, cor, pelagem, raca, agressor, racao, foto, observacao)
values ("Paçoca", "Bairro Alto", '2011-04-11', "Cachorro", "Fêmea", '2.500', "Adulto", "Marrom", "Longa", "Biggle", "nao", "Media", NULL, "Nada a declarar");

/*----------------------------------------------------------------------------------------------*/

select * from Recolhimento;

insert into Recolhimento (codAnimal, endereco, dataRecolhimento)
values (1, "Rua Alferes, 157, Bairro Alto", '2015-04-20');

/*----------------------------------------------------------------------------------------------*/

insert into Microchipagem (codAnimal, numeroMicrochip, dataAplicacao)
values (1, "1234.567.890", '2015-04-03');

select * from Microchipagem

/*----------------------------------------------------------------------------------------------*/

insert into Medicamento (nomeMedicamento, tipo, doses, descricao)
values ("Bla Bla Bla 20mg", "Medicacao", 4, "Vermifigo, aplicar a cada 8 horas");

select * from Medicamento;

/*----------------------------------------------------------------------------------------------*/

insert into Tratamento (codAnimal, codMedicamento, loteMedicamento, quantidade, intervalo, duracao, observacao)
values (1, 1, "456.hij 25-12-2014", 3, 8, 3, "Tratamento feito com sucesso");

select * from Tratamento;

/*----------------------------------------------------------------------------------------------*/
    
insert into Veterinario (nome, crm, cpf, endereco, telefone, email, dataContratacao, usuario, senha)
values ("José Augusto da Costa", "123456", "981.887.667-12", "Rua da Graça, 567, Jardim Nova Iguaçu, Piracicaba", "(019)3435-9867", "josecosta@gmail.com", '2005-08-03', "jose.costa", "123456");

select * from Veterinario;

/*----------------------------------------------------------------------------------------------*/

insert into Agente (nome, cpf, endereco, telefone, email, dataContratacao, usuario, senha)
values ("Roberto dos Santos Oliveira", "432.556.771-12", "Avenida Francisco de Souza, 995, Vila Rezende, Piracicaba", "(019)3467-1755", "rob.santos@gmail.com", '2010-12-01', "robsa", "98765")

select * from Agente;

/*----------------------------------------------------------------------------------------------*/

insert into Castracao (codAnimal, dataCastracao, codVeterinario, observacao)
values (1, '2015-04-20', 1, "Castracao feita com sucesso");

select * from Castracao;

/*----------------------------------------------------------------------------------------------*/

insert into Adotante (nome, cpf, endereco, telefone, email, codAnimal, dataAdocao)
values ("Joana Barbosa", "063.876.667-08", "Rua Governador Joao Paulo, 87, Bairro Alto, Piracicaba", "(019)3425-7570", "joanabarbosa@gmail.com", 1 , '2010-12-01');

select * from Adotante;

/*----------------------------------------------------------------------------------------------*/

insert into Baia (nomeBaia, codAnimal) 
values ("A1", 1);

Select * from Baia;

/*----------------------------------------------------------------------------------------------*/

insert into Banho (codAnimal, dataBanho, sociavelPessoas, sociavelAnimais)
values (1, '2015-04-27', 1, 1);

select * from Banho;

/*----------------------------------------------------------------------------------------------*/

insert into Lazer (codAnimal, dataLazer, sociavelPessoas, sociavelAnimais)
values (1, '2015-04-27', 1, 1);

/*----------------------------------------------------------------------------------------------*/