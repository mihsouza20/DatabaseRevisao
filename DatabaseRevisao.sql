-- Revisão DATABASE 
-- Thamires Souza 

  
use master
GO

drop database loja
GO

create database loja
GO

use loja
GO



create table tb_vendas(
       id_venda int primary key IDENTITY(1,1),
       id_cliente int not null,
	   id_item_vendido int not null,
       data date not null,
       desconto decimal(2,2)
)
GO

create table tb_clientes(
 id_cliente int PRIMARY KEY IDENTITY(1,1),
 nome nvarchar(50) not null,
 endereco nvarchar(100),
 idade int NOT NULL,
 sexo char(1) NOT NULL,
 tel nvarchar(15),
 email nvarchar(70),
)
GO
create table tb_item_vendido(
 id_item_venda int PRIMARY KEY identity(1,1),
 id_produto int not null,
 id_hardware int not null,
 qtde_item int not null,
  pco_vda decimal(8,2) not null
	   
)
GO
create table tb_vendas_canceladas(
 id_venda_canc int PRIMARY KEY identity(1,1),
 id_item_venda int not null,
       
)
GO
create table tb_produtos(
 id_produto int PRIMARY KEY IDENTITY(1,1),
 descricao nvarchar(50) not null,
 preco_unit decimal NOT NULL,
 qtde_atual int NOT NULL, 
 qtde_minima int,
)
GO


alter table tb_item_vendido
      ADD CONSTRAINT fk_id_produto
      FOREIGN KEY (id_produto) REFERENCES tb_produtos(id_produto)
	  GO

	  alter table tb_vendas
      ADD CONSTRAINT fk_id_item_venda
      FOREIGN KEY (id_item_venda) REFERENCES tb_item_vendido(id_item_venda)
	  GO

	  alter table tb_vendas_canceladas
      ADD CONSTRAINT fk_item_vendido
      FOREIGN KEY (id_item_venda) REFERENCES tb_item_vendido(id_item_venda)
	  GO

	  alter table tb_clientes
      ADD CONSTRAINT fk_id_cliente
      FOREIGN KEY (id_cliente) REFERENCES tb_clientes(id_cliente)
	  GO

	  

-- Professor não oconsegui fazer sozinha 