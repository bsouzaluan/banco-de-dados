create database sprint2;
use sprint2;

create table Atleta (
idAtleta int primary key,
nome varchar (40),
modalidade varchar(40),
qntMedalha int
);


create table Pais (
idPais int primary key,
nome varchar(40),
capital varchar(40)
);

insert into Atleta (idAtleta,nome,modalidade,qntMedalha)values 
('1','vivian','nataçao','2'),
('2','rafa','nataçao','1'),
('3','luan','basquete','3'),
('4','lucas','futebol','2'),
('5','lenon','futebol','2');

insert into Pais (idPais,nome,capital)values
('1','brasil','brasilia'),
('2','canada','ottawa'),
('3','japao','toquio'),
('4','brasil','brasilia'),
('5','japao','toquio');

select*from Pais;
select*from Atleta;

alter table Atleta add column fkPais int;

alter table Atleta add constraint FKPais foreign key(fkPais)references Pais(idPais);


update Atleta set fkPais = 1 where idAtleta in(1,2,3,4,5);

select*from Atleta;

select Atleta.nome,Pais.nome from Atleta join Pais on idPais = fkPais where idAtleta =2;
select Atleta.nome,Atleta.modalidade,Atleta.qntmedalha,Pais.nome ,Pais.capital from Atleta join pais on idPais =fkPais where idAtleta =3 ;
select*from Atleta join Pais on idPais = fkPais;




create table Musica(
	idMusica int primary key, 
    titulo varchar (40),
    artista varchar(40),
    genero varchar(40)
);

create table Album (
idAlbum int primary key,
nome varchar(40),
tipo varchar (40)constraint ctTipoAlbum check (tipo in('digital','fisico')),
dtLancamento date
);

insert into Musica(idMusica,titulo,artista,genero)values
(1,'opçao','kevin','funk'),
(2,'balmain','earkid','trap'),
(3,'maturidade','kayblac','trap'),
(4,'junçao venenosa','kevin','funk'),
(5,'misterio','kevin','funk');

insert into Album(idAlbum,nome,tipo,dtLancamento)values
(1,'passado e presente','digital','2021-05-21'),
(2,'é isso ai','digital','2010-04-17'),
(3,'nada como um dia após o outro','fisico','2002-10-27');

select*from Musica;
select*from Album;

alter table Album add column fkMusica int;

alter table Album add constraint fkMusica foreign key(fkMusica)references Musica(idMusica);

update Album set fkMusica = 1 where idAlbum =2;
update Album set fkMusica = 2 where idAlbum =1;
update Album set fkMusica = 3 where idAlbum =3;
update Album set fkMusica = 4 where idAlbum =3;
update Album set fkMusica = 5 where idAlbum =1;

select*from Musica join Album;
select Musica.titulo,Album.nome from Musica join Album on idMusica = fkMusica where idAlbum ;
select Musica.titulo,Musica.artista,Musica.genero,Album.nome,Album.tipo from Musica join Album on idMusica = fkMusica where tipo = 'digital';

select*from Album where tipo ='digital';













drop database sprint2;