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



//*create table tb_vendas(
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
	  GO *//

CREATE TABLE produtos (
   idProduto INT NOT NULL PRIMARY KEY IDENTITY(1,1),
   descricao NVARCHAR(50) NOT NULL,
   estoqueAtual INT NOT NULL DEFAULT 0,
   estoqueMin INT,
   precoVenda DECIMAL(9,2) NOT NULL
);

GO

CREATE TABLE clientes (
   idCliente INT NOT NULL PRIMARY KEY IDENTITY(1,1),
   nomeCliente NVARCHAR(50) NOT NULL
);

GO

CREATE TABLE vendas (
   idVenda INT NOT NULL PRIMARY KEY IDENTITY(1,1),
   idCliente INT NOT NULL,
   data DATE NOT NULL,
   desconto DECIMAL (4,2)
);

GO

CREATE TABLE itemVenda (
   idItVenda INT NOT NULL PRIMARY KEY IDENTITY(1,1),
   idVenda INT NOT NULL,
   idProduto INT NOT NULL,
   qtdItVenda INT NOT NULL
);

GO

CREATE TABLE vendaCancelada (
   idVendaCancelada INT NOT NULL UNIQUE
);

ALTER TABLE vendas ADD CONSTRAINT fk_venda_cli FOREIGN KEY (idCliente) REFERENCES clientes(idCliente);
ALTER TABLE itemVenda ADD CONSTRAINT fk_itemvend_venda FOREIGN KEY (idVenda) REFERENCES vendas(idVenda);
ALTER TABLE itemVenda ADD CONSTRAINT fk_itemvend_prod FOREIGN KEY (idProduto) REFERENCES produtos(idProduto);
ALTER TABLE vendaCancelada ADD CONSTRAINT fk_vendacanc_venda FOREIGN KEY (idVendaCancelada) REFERENCES vendas(idVenda);

INSERT INTO produtos (descricao, estoqueAtual, precoVenda) VALUES ('Item 1', 100, 5.00);
INSERT INTO produtos (descricao, estoqueAtual, precoVenda) VALUES ('Item 2', 100, 10.00);
INSERT INTO produtos (descricao, estoqueAtual, precoVenda) VALUES ('Item 3', 100, 15.00);
INSERT INTO produtos (descricao, estoqueAtual, precoVenda) VALUES ('Item 4', 100, 20.00);
INSERT INTO produtos (descricao, estoqueAtual, precoVenda) VALUES ('Item 5', 100, 25.00);

INSERT INTO clientes (nomeCliente) VALUES ('José');
INSERT INTO clientes (nomeCliente) VALUES ('Maria');
INSERT INTO clientes (nomeCliente) VALUES ('João');
INSERT INTO clientes (nomeCliente) VALUES ('Ana');
INSERT INTO clientes (nomeCliente) VALUES ('Luiz');

INSERT INTO vendas (idCliente, data, desconto) VALUES (1, '2019-08-16', 10);
INSERT INTO vendas (idCliente, data, desconto) VALUES (2, '2019-08-16', 5);
INSERT INTO vendas (idCliente, data, desconto) VALUES (3, '2019-08-16', 8);
INSERT INTO vendas (idCliente, data, desconto) VALUES (4, '2019-08-16', 3);
INSERT INTO vendas (idCliente, data, desconto) VALUES (5, '2019-08-16', 7);

INSERT INTO itemVenda (idVenda, idProduto, qtdItVenda) VALUES (1, 5, 1);
INSERT INTO itemVenda (idVenda, idProduto, qtdItVenda) VALUES (2, 4, 3);
INSERT INTO itemVenda (idVenda, idProduto, qtdItVenda) VALUES (3, 3, 5);
INSERT INTO itemVenda (idVenda, idProduto, qtdItVenda) VALUES (4, 2, 7);
INSERT INTO itemVenda (idVenda, idProduto, qtdItVenda) VALUES (5, 1, 5);
INSERT INTO itemVenda (idVenda, idProduto, qtdItVenda) VALUES (5, 5, 3);

INSERT INTO vendaCancelada (idVendaCancelada) VALUES (3);






-- Professor não oconsegui fazer sozinha 