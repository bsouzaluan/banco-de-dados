create database praticaFuncionario;
use praticaFuncionario;

create table Setor(
idSetor int primary key,
nomeSetor varchar(45),
numeroAndar int
);

create table Funcionario (
idFuncionario int primary key,
nomeFuncionario varchar(45),
telefone char (12),
salario double (10,2), constraint  CK_salario
CHECK (salario >0)
);

create table Acompanhante (
idAcompanhante int primary key,
nomeAcompanhante varchar(45),
tipoRelacao varchar(45),
dtNascimento date
);

insert into Setor values
(1,'solda','2'),
(2,'corte','3'),
(3,'medimento','4');

insert into Funcionario values
(1,'luan','11-945766679','3.000'),
(2,'lucas','11-945866679','3.000'),
(3,'luis','11-974256321','2.500'),
(4,'lenom','11-912365498','2.500'),
(5,'rodrigo','11-942536984','2.300'),
(6,'erick','11-925300288','2.300');

insert into Acompanhante values
(1,'astoufo','primo','2000-04-25'),
(2,'leonardo','amigo','1999-02-05'),
(3,'rafael','irmão','2003-08-01'),
(4,'guilherme','tio','1995-03-22'),
(5,'gustavo','primo','2000-06-20'),
(6,'vitor','amigo','2002-06-18'),
(7,'rafaela','irmão','2000-02-15'),
(8,'wilton','tio','1985-03-24');


select*from Setor;
select*from Funcionario;
select*from Acompanhante;

	ALTER TABLE Funcionario add column fkAcompanhante int;
	ALTER TABLE Funcionario add column fkSetor int;
    
	ALTER TABLE Funcionario add constraint ctfkAcompanhante foreign key (fkAcompanhante)
	references Acompanhante(idAcompanhante);
    
	ALTER TABLE Funcionario add constraint ctfkSetor foreign key (fkSetor)
	references Setor(idSetor);
    
	UPDATE Funcionario set fkSetor = 1 WHERE idFuncionario = 1 ;
    UPDATE Funcionario set fkSetor = 1 WHERE idFuncionario = 2 ;
    UPDATE Funcionario set fkSetor = 2 WHERE idFuncionario = 3 ;
    UPDATE Funcionario set fkSetor = 2 WHERE idFuncionario = 4;
    UPDATE Funcionario set fkSetor = 3 WHERE idFuncionario = 5 ;
    UPDATE Funcionario set fkSetor = 3 WHERE idFuncionario = 6 ;
    
    UPDATE Funcionario set fkAcompanhante = 1 WHERE idFuncionario = 1 ;
    UPDATE Funcionario set fkAcompanhante = 2 WHERE idFuncionario = 2 ;
    UPDATE Funcionario set fkAcompanhante = 3 WHERE idFuncionario = 3 ;
    UPDATE Funcionario set fkAcompanhante = 4 WHERE idFuncionario = 4 ;
    UPDATE Funcionario set fkAcompanhante = 5 WHERE idFuncionario = 5 ;
    UPDATE Funcionario set fkAcompanhante = 6 WHERE idFuncionario = 6 ;
    UPDATE Funcionario set fkAcompanhante = 7 WHERE idFuncionario = 1 ;
    UPDATE Funcionario set fkAcompanhante = 8 WHERE idFuncionario = 2 ;
    
    -- Exibir todos os dados de cada tabela criada, separadamente
    select*from Funcionario;
    select*from Acompanhante;
    select*from Setor;
    
    -- Exibir os dados dos setores e dos seus respectivos funcionários
    select*from Setor join Funcionario;
    
    -- Exibir os dados de um determinado setor (informar o nome do setor na consulta) e dos seus respectivos funcionários.
    select*from Setor join Funcionario where Setor.nomeSetor ='solda';
    
    -- Exibir os dados dos funcionários e de seus acompanhantes.
    select*from Funcionario join Acompanhante ;
    
     -- Exibir os dados de apenas um funcionário (informar o nome do funcionário) e os dados de seus acompanhantes.
     select*from Funcionario join Acompanhante where Funcionario.nomeFuncionario ='luan';
     
     -- Exibir os dados dos funcionários, dos setores em que trabalham e dos seus acompanhantes.
     select*from Funcionario join Setor join Acompanhante;
     
     drop database praticaFuncionario;

     
     
     
     
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




    
    

