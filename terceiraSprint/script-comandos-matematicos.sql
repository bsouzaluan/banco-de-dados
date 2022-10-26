create database relacaonn;

use relacaonn;

create table pessoa(
idpessoa int primary key auto_increment,
nome varchar(45),
salario decimal(10,2)
);

create table endereco(
idEnd int primary key auto_increment,
cep char(9),
bairro varchar(45),
cidade varchar(45)
)auto_increment=100;

create table enderecoCompleto(
fkpessoa int , foreign key (fkpessoa) references pessoa (idpessoa),
fkEnd int,foreign key (fkEnd)references endereco (idEnd),
primary key (fkpessoa,fkEnd),
complemento varchar(45)
);

insert into pessoa values
(null,'vivian','1.99'),
(null,'rafael','2.99'),
(null,'paula','3.99');

insert into endereco values
(null,'01144-905','cerqueira cesar','São Paulo'),
(null,'03144-905','sacomã','São Paulo'),
(null,'08844-905','Paraiso','São Paulo');

select*from pessoa;

select*from endereco;

select*from enderecoCompleto;

alter table enderecoCompleto add column numero varchar(45);

insert into enderecoCompleto values
(1,101,'apto 101',1500),
(2,100,'10 andar',595),
(3,100,'10 andar',595);

insert into pessoa values (null,'jonathan',0.99);


select*from pessoa right join enderecoCompleto on idpessoa =fkpessoa 
right join endereco on idEnd =fkEnd
where fkEnd is null
union
select*from pessoa left join enderecoCompleto on idpessoa =fkpessoa 
left join endereco on idEnd =fkEnd
where fkpessoa is null;

-- funçoes matematicas

-- count()

select COUNT(*) from pessoa;

insert into pessoa values (null,'raul',null);
select COUNT(salario) from pessoa;

-- max e min
select MAX(salario), 'maior salario' ,MIN(salario)'menor salario' from pessoa;

-- sum e AVG
select SUM(salario) 'soma dos salarios',
AVG(salario) 'media dos salarios'
from pessoa;

select ROUND(avg(salario),2)'arredondando',
AVG(salario) 'media dos salarios'
from pessoa;

select truncate(avg(salario),2)'Truncado',
AVG(salario) 'media dos salarios'
from pessoa;

insert into pessoa values (null,'lucas',0.19);

select truncate(avg(salario),2)'Truncado',
ROUND(avg(salario),2)'arredondando',
AVG(salario) 'media dos salarios'
from pessoa;

-- limit

select *from pessoa limit 1;
select *from pessoa limit 2,3;

-- group by

select avg(salario) 'media dos salários',
bairro
from pessoa
join enderecoCompleto on idpessoa =fkpessoa
join endereco on idEnd =fkEnd
group by bairro;

select nome, salario from pessoa
 where salario >(select avg(salario)from pessoa); 
















