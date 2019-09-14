-- Revisão DATABASE 
-- Thamires Souza 


use master;
drop database revisao;
go

create database revisao;
go

use revisao;

create table produtos(
	idProdutos int primary key not null identity(1,1),
	nomeProduto varchar(50)
);
go

create table clientes(
	idCliente int primary key not null identity(1,1),
	nomeCliente varchar(50)
);
go

create table vendas(
	idVenda int primary key not null identity(1,1),
	idCliente int not null
);
go

create table itensVendidos(
	idItemVenda int primary key not null identity(1,1),
	idProdutos int not null,
	idVenda int not null
);
go

create table vendasCanceladas(
	idVendaCancelada int unique not null
);
go

alter table vendas 
	add constraint fkVendaCliente
	foreign key(idCliente) references clientes(idCliente);

alter table itensVendidos 
	add constraint fkProduto
	foreign key(idProdutos) references produtos(idProdutos);

alter table itensVendidos
	add constraint fkVenda
	foreign key(idVenda) references vendas(idVenda);
go

alter table vendasCanceladas
	add constraint fkVendaCancelada
	foreign key(idVendaCancelada) references vendas(idVenda);
go

insert into clientes values
('Beyonce'),
('John Mayer'),
('Emma Watson'),
('Jennifer Aniston'),
('Bon Jovi'),
('Harry Styles');
go

insert into produtos values
('DVD Beyonce'),
('DVD John Mayer'),
('Harry Potter'),
('Friends'),
('Glee'),
('Gossip Girl'),
('Stranger Things');
go

insert into vendas values
(1),
(2),
(3),
(4),
(5);
go

insert into itensVendidos values
(1,5),
(2,4),
(3,3),
(4,2),
(5,2);
go

insert into vendasCanceladas values
(2),
(5);
go

select * from itensVendidos;
select * from clientes;
select * from vendas;

select v.idVenda, v.idCliente, c.nomeCliente 
	from vendas as v 
	inner join clientes as c 
	on c.idCliente = v.idCliente;
go	

select v.idItemVenda, v.idVenda, v.idProdutos, p.nomeProduto 
	from itensVendidos as v
	inner join produtos as p
	on v.idProdutos = p.idProdutos;
go

select c.idCliente, c.nomeCliente
	from clientes as c  
	left join vendas as v
	on  c.idCliente = v.idCliente where v.idVenda is null;
go

select v.idProdutos, p.nomeProduto 
	from itensVendidos as v
	right join produtos as p
	on v.idProdutos = p.idProdutos --where v.idVenda is null;	
 go

