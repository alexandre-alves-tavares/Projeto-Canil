use BD_Canil

select * from Animal

/*Forma correta de inserir dados na tabela*/
insert into Animal (bairroRecolhimento, nome, dataEntrada, tipo, sexo, peso, idade, cor, pelagem, raca, agressor, foto, observacao)
values ("Bairro Alto", "Paçoca" , '2011-04-11', "Cachorro", "Fêmea", '2.500', "Adulto", "Marrom", "Longa", "Biggle", "nao", NULL, "Nada a declarar");

/*----------------------------------------------------------------------------------------------*/

select * from Recolhimento;

insert into Recolhimento (codAnimal, endereco, dataRecolhimento)
values (1, "Rua Alferes, 157, Bairro Alto", '2015-04-20');

/*----------------------------------------------------------------------------------------------*/

select * from Prontuario

insert into Prontuario (codAnimal, racao)
values (1, "Media")

/*----------------------------------------------------------------------------------------------*/

insert into Microchipagem (codAnimal, codProntuario, numeroMicrochip, dataAplicacao)
values (1, 1, "1234.567.890", '2015-04-03');

select * from Microchipagem

/*----------------------------------------------------------------------------------------------*/

insert into Medicamento (nomeMedicamento, tipo, doses, descricao)
values ("Bla Bla Bla 20mg", "Medicacao", 4, "Vermifigo, aplicar a cada 8 horas");

select * from Medicamento;

/*----------------------------------------------------------------------------------------------*/

insert into Tratamento (codProntuario, codMedicamento, loteMedicamento, periodo, observacao)
values (1, 1, "456.hij 25-12-2014", 3, "Tratamento feito com sucesso");

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

insert into Castracao (codProntuario, dataCastracao, codVeterinario, observacao)
values (1, '2015-04-20', 1, "Castracao feita com sucesso");

select * from Castracao;

/*----------------------------------------------------------------------------------------------*/

insert into Historico (codProntuario, dataBanho, dataLazer, sociavelPessoas, sociavelAnimais, observacao, codAgente)
values (1, '2015-04-15', '2015-04-17', 1, 1, "animal está feliz nesses ultimos dias", 1);

select * from Historico;

/*----------------------------------------------------------------------------------------------*/

insert into Adotante (nome, cpf, endereco, telefone, email, codAnimal, dataAdocao)
values ("Joana Barbosa", "063.876.667-08", "Rua Governador Joao Paulo, 87, Bairro Alto, Piracicaba", "(019)3425-7570", "joanabarbosa@gmail.com", 1 , '2010-12-01');

select * from Adotante;
