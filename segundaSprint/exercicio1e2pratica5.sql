create database petShop;
use petShop;

create table Cliente (
idCliente int primary key AUTO_INCREMENT,
nome varchar(45),
sobreNome VARCHAR(45),
telefoneFixo char (12),
telefoneCelular char (12),
cep char (8),
cidade varchar(45),
bairro varchar(45),
rua varchar(45),
numero int,
complemento CHAR(1)
);
create table Pet(
idPet int  AUTO_INCREMENT,
fkCliente int ,
constraint fkidCliente foreign key (fkCliente)references Cliente (idCliente),primary key(idPet,fkCliente),
tipo varchar(45),
nome varchar(45),
raca varchar(45),
dtNascimento DATE
)AUTO_INCREMENT = 101;


insert into Cliente (nome,sobreNome,telefoneFixo,telefoneCelular,cep,cidade,bairro,rua,numero,complemento)values
('luan','souza','11-955766679','11-945766679','09123715','mauá','jdolinda','leonides marques','41','a'),
('lucas','souza','11-915766679','11-985766679','09123715','santo andre','jdelse','sorte','45','a'),
('lenom','maicon','11-945766679','11-995766679','09123715','são bernardo','jdqueridi','wilson tomas','2','a');

insert into Pet values
(NULL,1,'cachorro','astoufo','doberman','2020-05-20'),
(NULL,2,'cachorro','bolt','pincher','2019-05-08'),
(NULL,2,'gato','astoufo','siameses','2018-04-07'),
(NULL,3,'gato','veriz','persa','2020-03-20');

drop database petShop;
-- Exibir todos os dados de cada tabela criada, separadamente.
select*from Cliente;
select*from Pet;

-- Altere o tamanho da coluna nome do cliente
alter table cliente modify column nome varchar(60);
desc cliente;

-- Exibir os dados de todos os pets que são de um determinado tipo (por exemplo: cachorro)
select*from Pet where tipo = 'cachorro'; 

-- Exibir apenas os nomes e as datas de nascimento dos pets.
select nome,dtNascimento from Pet;

-- Exibir os dados dos pets ordenados em ordem crescente pelo nome.
select*from Pet order by nome;

-- Exibir os dados dos clientes ordenados em ordem decrescente pelo bairro.
select*from Cliente order by bairro desc;

-- Exibir os dados dos pets cujo nome comece com uma determinada letra.
select*from Pet where nome like 'a%';

-- Exibir os dados dos clientes que têm o mesmo sobrenome.
select*from Cliente where sobrenome ='souza';

-- Alterar o telefone de um determinado cliente.
update cliente set telefoneCelular= 11-980790058 where idCliente =1;

-- Exibir os dados dos clientes para verificar se alterou.
select*from Cliente;

 -- Exibir os dados dos pets e dos seus respectivos donos.
 select*from Pet join Cliente on idCliente = fkCliente;
 
  -- Exibir os dados dos pets e dos seus respectivos donos, mas somente de um determinado cliente
 select*from Pet join Cliente on idCliente =fkCliente where Cliente.nome = 'luan';
 
   -- Excluir algum pet.
   delete from Pet where idPet =101;
   
   select *from Pet;
   
   drop table Pet;
   drop table Cliente; 
   
   create table Pessoa(
   idPessoa int primary key ,
   nome varchar(45),
   dtNascimento date,
   profissao varchar(45)
   );
   
   create table Gasto (
   idGasto int primary key,
   dataGasto date,
   valor double,
   descriçao varchar(45)
   );
   
   insert into Pessoa values 
	(1,'Luan','2000-02-23','cantor'),
	(2,'Lucas','1999-04-25','gerente'),
	(3,'lenom','2001-05-21','eletricista'),
	(4,'rodson','2002-06-19','soldador');
    
    insert into Gasto values 
	(1,'2022-03-27','9.50','chiclete'),
	(2,'2022-03-28','15.99','energetico'),
	(3,'2022-02-05','4.00','pão'),
	(4,'2022-05-04','30.00','bebidas');
    
    ALTER TABLE Pessoa add column fkGasto int;
	ALTER TABLE Pessoa add constraint ctfkGasto foreign key (fkGasto)
	references gasto(idGasto);
    
		UPDATE Pessoa set fkGasto = 1 WHERE idPessoa = 1;
        UPDATE Pessoa set fkGasto = 2 WHERE idPessoa = 2;
		UPDATE Pessoa set fkGasto = 3 WHERE idPessoa = 3;
		UPDATE Pessoa set fkGasto = 4 WHERE idPessoa = 4;
        
        
    
    
    
    -- Exiba os dados de cada tabela individualmente.
    select*from Pessoa;
    select*from Gasto;
    
    -- Exiba somente os dados de cada tabela, mas filtrando por algum dado da tabela (por exemplo, as pessoas de alguma profissão, etc).
    select*from Pessoa where profissao ='cantor';
    select*from Gasto where descriçao = 'pão';
    
    -- Exiba os dados das pessoas e dos seus gastos correspondentes.
 select*from Pessoa join Gasto on idGasto =fkGasto where Gasto.valor;
 
 -- Exiba os dados de uma determinada pessoa e dos seus gastos correspondentes
  select*from Pessoa join Gasto on idGasto =fkGasto where nome = 'luan';
  
  -- Atualize valores já inseridos na tabela.
  update Pessoa set nome = 'astoufo' where idPessoa =3;
  
 -- Exclua um ou mais registros de alguma tabela
 delete from Pessoa where idPessoa =2;
 
  
  
    
    
    
   

 






