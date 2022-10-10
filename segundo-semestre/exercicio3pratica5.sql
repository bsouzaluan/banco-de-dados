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

     
     

