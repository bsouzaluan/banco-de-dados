
use sprint2;


create table Professor (
idprofessor int primary key auto_increment,
nome varchar(50),
sobrenome varchar(30),
especialidade1 varchar(40),
especialidade2 varchar(40)
);

create table Disciplina (
iddisc int primary key auto_increment,
nomedisc varchar(45)
);

insert into Professor (nome,sobrenome,especialidade1,especialidade2)values
('luan','souza','engenharia mecanica','gestao empresarial'), 
('lucas','souza','gestao empresarial','psicologo'), 
('leonardo','silva','engenharia computacional','gestao empresarial'), 
('bono','barbosa','engenharia civil','economista'), 
('richard','melo','economista','mba'), 
('wilson','teles','engenharia computacional','gestao empresarial');


insert into Disciplina (nomedisc)values
('matematica'),
('portugues'),
('ciencias'),
('geografia');

ALTER TABLE Disciplina add column fkProfessor int;
ALTER TABLE Disciplina add constraint ctFkProfessor foreign key (fkProfessor)references Professor(idProfessor);

select *from Disciplina;
select*from Professor;

UPDATE Disciplina set fkProfessor = 1 WHERE iddisc= 2;
UPDATE Disciplina set fkProfessor = 2 WHERE iddisc= 3;
UPDATE Disciplina set fkProfessor = 3 WHERE iddisc= 4;
UPDATE Disciplina set fkProfessor = 4 WHERE iddisc= 3;
UPDATE Disciplina set fkProfessor = 5 WHERE iddisc= 4;

	SELECT * FROM Disciplina JOIN Professor ON idProfessor = fkProfessor;
    select Professor.nome,Disciplina.nomedisc from Disciplina join Professor;
    select Disciplina.nomedisc,Professor.nome from Disciplina join Professor  where nome ='luan';
    select professor.nome,professor.sobrenome,professor.especialidade1,professor.especialidade2,Disciplina.nomeDisc from Disciplina join Professor where sobrenome = 'souza';
    select professor.especialidade1 ,Disciplina.nomeDisc from Disciplina join Professor where nome ='bono' order by especialidade1 ;
    
    
    -- um curso pode ter varios alunos e um aluno so pode ter um curso --
    create table Curso (
    idCurso int primary key,
    nome varchar(50),
    sigla char(3),
    coodenador varchar(45)
    );
    
    insert into Curso (idCurso,nome,sigla,coodenador)values
		(1,'informatica','inf','léo'),
		(2,'analise e desenvolvimento de sistemas','ads','claudio'),
		(3,'ciencias da computaçao','cdc','wiliam');
      
      create table Aluno (
      idAluno int primary key,
      nome varchar(45),
      ra char (8)
      );
      
      insert into Aluno(idAluno,nome,ra)values
		(1,'luan','01222189'),
		(2,'lucas','01222345'),
		(3,'ana','01222987');
        
        ALTER TABLE Aluno add column fkCurso int;
ALTER TABLE Aluno add constraint ctFkCurso foreign key (fkCurso)references Curso(idCurso);
        
        UPDATE Aluno set fkCurso = 1 WHERE idAluno= 1;
		UPDATE Aluno set fkCurso = 2 WHERE idAluno= 2;
		UPDATE Aluno set fkCurso = 3 WHERE idAluno= 3;
        select * from Aluno join Curso;
        select  Aluno.nome,Curso.nome,Curso.coodenador from Aluno join Curso where Aluno.nome = 'luan';
        
        alter table Aluno add column sexo varchar(40);
        select*from Aluno;
        alter table Aluno add constraint sexo check (sexo in('masculino','feminino'));
        
        update  Aluno set sexo = 'masculino' where idAluno = '1';
		update  Aluno set sexo = 'masculino' where idAluno = '2';
		update  Aluno set sexo = 'feminino' where idAluno = '3';
      
drop 
      
    
    