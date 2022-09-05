create database sprint1;
use sprint1;

create table Atleta(
idAtleta int  primary key,
nome varchar (40),
modalidade varchar(40),
qntMedalha int
);

insert into Atleta values
(1,'luan','basket',5),
(2,'enzo','futebol',4),
(3,'wilson','volei',2),
(4,'helisson','volei',3),
(5,'richard','volei',7),
(6,'astoufo','volei',8);

insert into Atleta values
(7,'lucas','basket',5);

select*from Atleta;

select nome,qntMedalha from Atleta;

select*from Atleta where modalidade = 'volei';

select*from Atleta order by modalidade;

select*from Atleta order by qntMedalha desc;

select*from Atleta where nome like '%s%';

select*from Atleta where nome like'l%';

select*from Atleta where nome like'%o';

-- drop table Atleta;

create table Musica (
	idMusica int primary key,
    titulo varchar(40),
    artista varchar(40),
    genero varchar(40)

);

insert into Musica values 
(1,'yes','tevez','rock'),
(2,'yes','paiva','funk'),
(3,'yes','luansb','rap'),
(4,'yes','djonga','rap');

select*from Musica;
select titulo,artista from Musica;
select*from Musica where genero = 'rock';
select*from Musica where artista = 'paiva';
select*from Musica order by titulo;
select*from Musica order by artista desc;
select*from Musica where titulo like 'y%';
select*from Musica where artista like '%a';
select*from Musica where genero like'_a%';
-- drop table Musica;

create table Filme (
idFilme int primary key,
titulo varchar(50),
generof varchar (40),
diretor varchar(40)
);

insert into Filme values
(1,'velozes furiosos','açao','wilton'),
(2,'furia em duas rodas','açao','wilton'),
(3,'american pie','comedia','jhonson'),
(4,'se beber nao case','comedia','jorge'),
(5,'principe da percia','aventura','josh'),
(6,'assasin screed','aventura','trump'),
(7,'it a coisa','terror','hebert');

select*from Filme;
select titulo,diretor from Filme;
select*from Filme where generof = 'açao';
select*from Filme where diretor = 'wilton';
select*from Filme order by titulo;
select*from Filme order by diretor desc;
select*from Filme where titulo like'v%';
select*from Filme where artista like'%h';
select*from Filme where titulo like'_s%';

-- drop table Filme;









