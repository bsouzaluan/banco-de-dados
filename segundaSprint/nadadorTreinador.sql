/*Fazer a modelagem lógica de um sistema para cadastrar os treinadores de
nadadores, que participarão de vários campeonatos, representando o Brasil.
- Cada treinador treina mais de um nadador.
- Cada nadador tem apenas um treinador.
- Sobre cada nadador, o sistema guarda um identificador, que identifica de forma
única cada um deles. Esse identificador começa com o valor 100 e é inserido de
forma automática. Além desse identificador, o sistema guarda o nome, o estado de
origem e a data de nascimento do nadador.
*/


/*
Sobre cada treinador, o sistema guarda um identificador, que identifica de forma
única cada treinador. Esse identificador começa com o valor 10 e é inserido de forma
automática. O sistema também guarda o nome do treinador, o telefone (apenas um
número de telefone) e o e-mail do treinador.
*/


/*Um treinador mais experiente orienta outros treinadores novatos. Cada treinador
novato é orientado apenas por um treinador.
*/

create database treinadorNadador;
use treinadorNadador;

create table treinador(
idtreinador int primary key auto_increment,
nome varchar (45),
telefone char(11),
email varchar(50),
fktreinadorOrientador int , foreign key treinadorOrientador (fktreinadororientador)references treinador (idtreinador)
);


create table nadador(
idnadador int primary key auto_increment,
nome varchar (45),
uf char(2),
dtnasc date,
fktreinador int, foreign key fktreinador (fktreinador) references treinador (idtreinador)
);

drop table nadador;
drop table treinador;

insert into treinador (nome,telefone,email,fktreinadorOrientador) values
('luan','95213465489','luan@email.com',null),
('lucas','95213465489','lucas@email.com',null),
('wilson','95213465489','wilson@email.com',null),
('jhon','95213465489','jhon@email.com',null);

insert into treinador (nome,telefone,email,fktreinadorOrientador) value
('alex','95213465489','alex@email.com',1);

insert into treinador (nome,telefone,email,fktreinadorOrientador) value
('rafael','95213465489','rafael@email.com',2);

insert into treinador (nome,telefone,email,fktreinadorOrientador) value
('vivian','95213465489','vivian@email.com',3);


insert into nadador (nome,uf,dtnasc,fktreinador)values
('Paul Macdnonald', 'SP', '1942-06-18',1),
('Ringo King', 'RJ', '1940-07-07',1), 
('John Hut', 'MG', '1940-10-09',2), 
('Jorge Bell', 'ES', '1943-02-25',2),
('Zakk FC', 'PR', '1983-04-22',3),
('Josh Pop', 'RS', '1962-03-02',3);

select*from treinador;
select*from nadador;

select nadador.nome ,treinador.nome from treinador join nadador on treinador.idtreinador = nadador.fktreinador;

-- update nadador set fktreinador = 10 where idnadador between 100 and 102;
-- update nadador set fktreinador = 11 where idnadador = 103;

-- d) Inserir dados nas tabelas, de forma que exista mais de um nadador para algum
-- treinador, e mais de um treinador sendo orientado por algum treinador mais
-- experiente.


-- e) Exibir todos os dados de cada tabela criada, separadamente.
select * from treinador;

select * from nadador;

-- f) Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação das tabelas.
-- -- Alter na treinador
		-- alter table treinador add column fktreinadorexp int;
		-- alter table treinador add  foreign key fktreinadorexp (fktreinadorexp) references treinador (idtreinador);

-- -- Alter na nadador
-- alter table nadador add column fktreinador int;
-- alter table treinador add  foreign key fktreinador (fktreinador) references treinador (idtreinador);

-- g) Exibir os dados dos treinadores e os dados de seus respectivos nadadores.
select
	treinador.nome,
	nadador.nome
	from treinador 
		join nadador 
			on treinador.idtreinador = nadador.fktreinador;
	
-- h) Exibir os dados de um determinado treinador (informar o nome do treinador na consulta) e os dados de seus respectivos nadadores.
select
	treinador.nome,
	nadador.nome
	from treinador 
		join nadador 
			on treinador.idtreinador = nadador.fktreinador
	where treinador.nome = 'Rafael';

		
-- i) Exibir os dados dos treinadores e os dados dos respectivos treinadores orientadores.
select
	orientador.nome as treinador_orientador,
	treinador.nome as treinador
	from treinador 
		join treinador orientador
			on orientador.idtreinador = treinador.fktreinadororientador; 
		
		
		-- exemplo com left join
		select
	treinador.nome as treinador,
	orientador.nome as treinador_orientador
	from treinador 
		left join treinador orientador
			on orientador.idtreinador = treinador.fktreinadororientador; 
		
	
-- j) Exibir os dados dos treinadores e os dados dos respectivos treinadores orientadores, 
-- porém somente de um determinado treinador orientador (informar o nome do treinador na consulta).
select
	orientador.nome as treinador_orientador,
	treinador.nome as treinador
	from treinador 
		join treinador orientador
			on orientador.idtreinador = treinador.fktreinadororientador
	where orientador.nome = 'Vivian';
		
		
-- l) Exibir os dados dos treinadores, os dados dos respectivos nadadores e os dados dos respectivos treinadores orientadores.
select
	-- orientador.nome as treinador_orientador,
	treinador.nome as treinador,
	nadador.nome
	from treinador 		
		join nadador 
			on nadador.fktreinador = treinador.idtreinador;
	

select
	orientador.nome as treinador_orientador,
	treinador.nome as treinador,
	nadador.nome as nadador
	from treinador 		
		join nadador 
			on nadador.fktreinador = treinador.idtreinador
		join treinador orientador
			on treinador.fktreinadororientador = orientador.idtreinador;




