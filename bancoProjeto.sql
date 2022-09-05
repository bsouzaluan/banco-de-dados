create database bancoProjeto;

use bancoProjeto;

create table empresa(
idempresa int primary key,
nome varchar(40),
endereco varchar(255),
responsavel varchar(40),
cnpj char(14),
tipo varchar(7) constraint chktipo check(tipo in ("Matriz", "Filial" )));

create table sensor(
idsensor int primary key,
sensor varchar(20),
numerodeserie char(24),
statussensor varchar(10) constraint chkstatus check(statussensor in ("ativo","inativo")));

create table silo(
idsilo int primary key,
nomesilo varchar(40),
quantidadeSilo varchar(50));

CREATE TABLE Usuarios(
		IdUsuario INT PRIMARY KEY ,
		Email VARCHAR (200) ,
		Senha VARCHAR (200));
        
        select*from Usuarios;
		select*from silo;
		select*from sensor;
        select*from empresa;
        
        
        

