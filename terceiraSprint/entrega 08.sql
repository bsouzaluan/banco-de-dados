create database pratica08;

use pratica08;

create table Cliente (
idCliente int primary key auto_increment,
nome varchar(45),
email varchar (45),
cep char (9),
cidade varchar(45),
bairro varchar (45),
rua varchar (45),
numero varchar(45),
complemento varchar(45),
fkClientes int ,constraint ctFkClientes foreign key Cliente (fkClientes) references Cliente(idCliente)
);

create table Produto (
idProduto int primary key auto_increment,
nome varchar(45),
descricao varchar(45),
precoProduto decimal(10,2)
);

create table Venda (
idVenda int primary key auto_increment,
fkCliente int, foreign key (fkCliente) references Cliente (idCliente),
totalVenda decimal (10,2),
dataVenda date 
);

create table carrinho (
fkProduto int , foreign key (fkProduto) references Produto(idProduto),
fkCliente int ,foreign key (fkCliente) references Cliente(idCliente),
primary key(fkProduto,fkCliente),
qntdProdutos varchar (45),
descontoProdutos decimal (10,2)
);

insert into Cliente values 
(null,'luan','luan.barbosa@sptech.school',09330-715,'mauá-sp','jdOlinda','leonide marques de alencar','41','a',null),
(null,'lucas','lucas.barbosa@sptech.school',08530-715,'santo andré-sp','jdMelancia','so os loucos sabem','50','b',null),
(null,'marcelo','marcelo.barbosa@sptech.school',04330-715,'itaquera-sp','jdFlores','é isso ai','32','c',1),
(null,'lenon','lenon.barbosa@sptech.school',07430-715,'mauá-sp','jdFlores','flores coloridas','20','a',2);


insert into Produto values 
(null,'chocolate','chocolate nestle',7.00),
(null,'refrigerante','coca-cola',10.00),
(null,'agua','agua bonafont',2.00),
(null,'chiclete','chiclete trident',3.00);

insert into Venda values
(null,1,15.00,'2022/05/10'),
(null,2,20.00,'2022/06/10'),
(null,3,25.00,'2022/09/13'),
(null,4,18.00,'2022/10/15');

insert into carrinho values 
(1,1,'3',2.00);

insert into carrinho values 
(2,1,'3',2.00),
(3,2,'4',1.00),
(4,1,'5',3.00);

select * from Produto;
select * from Cliente;
select* from Venda;
select*from Carrinho;


select * from Cliente join Venda on idCliente = fkCliente;

select * from Cliente join Venda on idCliente = fkCliente where idCliente =1;

select * from Cliente as principal join Cliente as indicado
    on principal.idCliente = indicado.fkClientes;
    
    select * from Cliente as principal join Cliente as indicado
    on principal.idCliente = indicado.fkClientes where principal.nome = 'luan'; 
    
   select * from Cliente as principal 
   join Cliente as indicado on principal.idCliente = indicado.fkClientes
   join Venda as V on V.idVenda = indicado.fkClientes;
   
   -- max min
   select MAX(PrecoProduto)'maior preço',MIN(precoProduto)'menor preço' from Produto;
   
   -- SUM E AVG
SELECT SUM(precoProduto) 'Soma dos produtos',
	   AVG(precoProduto) 'Média dos produtos'
       FROM Produto;
       
       SELECT nome, precoProduto FROM Produto 
	WHERE precoProduto >= (select avg(precoProduto) from Produto);
    
    select distinct sum(precoProduto) from Produto;
    
  SELECT SUM(precoProduto) 'Soma dos Produtos' from Produto
  join venda
GROUP BY idVenda = '2';
   
   
 
  
   






drop table Produto;
drop table Cliente;
drop table Venda;
drop table Carrinho;





