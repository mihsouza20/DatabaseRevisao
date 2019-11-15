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
(1,1),
(1,1),
(2,1),
(2,3),
(5,2);
go

select v.idItemVenda, v.idVenda, v.idProdutos, p.nomeProduto 
	from itensVendidos as v
	inner join produtos as p
	on v.idProdutos = p.idProdutos;
go
----------------------------------------------------------------------------------------------------------
--Criando Procedure 
create procedure aplica_desconto_no_preco(
	@id_do_cliente as decimal(10),
	@_preco as decimal(10, 2),
	@_percentual_desconto as decimal(10, 2) = 0.0,
	@_preco_com_desconto as decimal(10, 2) output,
	@nome_do_produto as varchar(15) output
)
as
	begin
		select @_preco_com_desconto = @_preco - (@_preco * @_percentual_desconto)
		select @_preco_com_desconto as "Preco com desconto"
	end
go

declare @NomeProduto varchar(20);
declare @IdCliente int;
declare @Preco decimal(5,2);
declare @PercentualDeDesconto decimal(5,2);
declare @PrecoComDesconto decimal(5,2);
set @NomeProduto = 'DVD BEYONCE';
set @IdCliente = 1;
set @Preco =100;
set @PercentualDeDesconto = 0.5;

exec aplica_desconto_no_preco @IdCliente, @Preco, @PercentualDeDesconto, @PrecoComDesconto output, @NomeProduto output
--print 'resultado da procedure:'
--print 'valor atribuido para @precoComDesconto'
select @PrecoComDesconto as "Valor da variavel: @PrecoComDesconto"
select @NomeProduto as "Nome do produto q houve desconto:"
select @IdCliente as "Id do cliente que comprou:"

drop procedure aplica_desconto_no_preco
go

