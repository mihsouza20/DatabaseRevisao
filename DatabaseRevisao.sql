-- Revisão DATABASE 
-- Thamires Souza 


use master;
drop database loja;
go

create database loja;
go

use loja;

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
	idCliente int not null,
	Cancelado int
);
go

create table itensVendidos(
	idItemVenda int primary key not null identity(1,1),
	idProdutos int not null,
	idVenda int not null
);
go

create table vendasCanceladas(
	idVendaCancelada int  not null,
	data date
);
GO	

CREATE TRIGGER BANCOTRIGGER On vendas
FOR INSERT AS  
DECLARE @idVenda int;
DECLARE @idVendaCancelada int;

DECLARE @audit_action varchar(200);

SELECT @idVendaCancelada = i.idVendaCancelada FROM inserted i;

SET @audit_action='Registrado com Sucesso!';

INSERT INTO tb_vendasCanceladas (idVendaCancelada,data)VALUES (@idVendaCancelada, GETDATE());

PRINT 'Venda Cancelada'
GO

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
(1,0),
(2,0),
(3,1),
(4,1),
(5,0);
go

insert into itensVendidos values
(1,5),
(2,4),
(3,3),
(4,2),
(5,2);
go

go


SELECT * FROM vendas;
SELECT * FROM vendasCanceladas;
GO

