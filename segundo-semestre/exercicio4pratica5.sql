create database Treinador;
use Treinador;

create table treinador (
idTreinador int primary key auto_increment,
nomeTreinador varchar (45),
telefone char(12),
email varchar (45)
)auto_increment =10;

create table nadador (
idNadador int primary key auto_increment,
estadoOrigem varchar(40),
dtNascimento date,
nome varchar(45)
) auto_increment =100;

create table treinadorIniciante(
idTreinadorIniciante int primary key,
nome varchar(45),
telefone char(12),
email varchar(45)
);

insert into treinador values
(11,'wilian','11-925462310','wilian@gmail.com'),
(12,'wendel','11-925464356','wendel@gmail.com'),
(13,'luan','11-925462150','luan@gmail.com'),
(14,'lucas','11-910236525','lucas@gmail.com');

insert into nadador values
(101,'Paraiba','2000-08-20','wilson'),
(102,'Pernambuco','2007-09-19','wilson'),
(103,'São Paulo','2006-08-01','wilson'),
(104,'Amazonas','2005-04-02','wilson');

insert into treinadorIniciante values
(1,'lucas','11-980462310','lucas@gmail.com'),
(2,'rafael','11-954562310','rafael@gmail.com'),
(3,'gustavo','11-946239094','gustavo@gmail.com'),
(4,'lenom','11-975698431','lenom@gmail.com');

select*from treinador;
select*from nadador;
select*from treinadorIniciante;

	ALTER TABLE nadador add column fktreinador int;
	ALTER TABLE treinador add column fktreinadorIniciante int;
    
	ALTER TABLE nadador add constraint ctfktreinador foreign key (fktreinador)
	references treinador(idtreinador);
    
	ALTER TABLE treinador add constraint ctfktreinadorIniciante foreign key (fktreinadorIniciante)
	references treinadorIniciante(idtreinadorIniciante);
    
    update Nadador set fktreinador =11 where idNadador =101;
	update Nadador set fktreinador =11 where idNadador =102;
	update Nadador set fktreinador =12 where idNadador =103;
	update Nadador set fktreinador =13 where idNadador =104;
    
    update treinador set fktreinadorIniciante =1 where idtreinador =11;
    update treinador set fktreinadorIniciante =2 where idtreinador =12;
    update treinador set fktreinadorIniciante =3 where idtreinador =13;
    update treinador set fktreinadorIniciante =4 where idtreinador =14;


-- Exibir os dados dos treinadores e os dados de seus respectivos nadadores.
select*from treinador join Nadador;

-- exibir os dados de um determinado treinador (informar o nome do treinador na consulta) e os dados de seus respectivos nadadores

select*from treinador join Nadador where treinador.nomeTreinador = 'luan';

-- Exibir os dados dos treinadores e os dados dos respectivos treinadores orientadores
select*from treinador join treinadorIniciante;

-- Exibir os dados dos treinadores e os dados dos respectivos treinadores
-- orientadores, porém somente de um determinado treinador orientador (informar o 
-- nome do treinador na consulta).
select *from treinador join treinadorIniciante where treinador.nomeTreinador ='lucas';

 -- Exibir os dados dos treinadores, os dados dos respectivos nadadores e os dados 
-- dos respectivos treinadores orientadores.
select *from treinador join Nadador join treinadorIniciante;

-- Exibir os dados de um treinador (informar o seu nome na consulta), os dados dos 
-- respectivos nadadores e os dados do seu treinador orientador.

Select*from treinador join Nadador join treinadorIniciante where treinador.nomeTreinador ='lucas';




    
    