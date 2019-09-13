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
   nomeCliente NVARCHAR(50) NOT NULL);

GO

CREATE TABLE vendas (
   idVenda INT NOT NULL PRIMARY KEY IDENTITY(1,1),
   idCliente INT NOT NULL,
   data DATE NOT NULL,
   desconto DECIMAL (4,2),
  
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

INSERT INTO produtos (descricao, estoqueAtual, precoVenda) VALUES ('DVD Live at Roseland', 1, 5.00);
INSERT INTO produtos (descricao, estoqueAtual, precoVenda) VALUES ('DVD Experience', 1, 10.00);
INSERT INTO produtos (descricao, estoqueAtual, precoVenda) VALUES ('DVD BEYONCE', 1, 15.00);
INSERT INTO produtos (descricao, estoqueAtual, precoVenda) VALUES ('DVD Lemonade', 2, 20.00);
INSERT INTO produtos (descricao, estoqueAtual, precoVenda) VALUES ('DVD BDAY', 2, 25.00);
INSERT INTO produtos (descricao, estoqueAtual, precoVenda) VALUES ('Queen B', 2, 35.00);

INSERT INTO clientes (nomeCliente) VALUES ('Beyonce');
INSERT INTO clientes (nomeCliente) VALUES ('John Mayer');
INSERT INTO clientes (nomeCliente) VALUES ('Harry Styles');
INSERT INTO clientes (nomeCliente) VALUES ('Shawn Mendes');
INSERT INTO clientes (nomeCliente) VALUES ('Harry Potter');


INSERT INTO vendas (idCliente, data, desconto) VALUES (1, '2019-08-16', 10);
INSERT INTO vendas (idCliente, data, desconto) VALUES (2, '2019-08-16',5 );
INSERT INTO vendas (idCliente, data, desconto) VALUES (3, '2019-08-16', 8);
INSERT INTO vendas (idCliente, data, desconto) VALUES (4, '2019-08-16', 3);
INSERT INTO vendas (idCliente, data, desconto) VALUES (4, '2019-08-16', 3);
INSERT INTO vendas (idCliente, data, desconto) VALUES (4, '2019-08-16', 3);

INSERT INTO itemVenda (idVenda, idProduto, qtdItVenda) VALUES (1, 5, 1);
INSERT INTO itemVenda (idVenda, idProduto, qtdItVenda) VALUES (2, 4, 3);
INSERT INTO itemVenda (idVenda, idProduto, qtdItVenda) VALUES (3, 3, 5);
INSERT INTO itemVenda (idVenda, idProduto, qtdItVenda) VALUES (4, 2, 7);
INSERT INTO itemVenda (idVenda, idProduto, qtdItVenda) VALUES (5, 1, 5);
INSERT INTO itemVenda (idVenda, idProduto, qtdItVenda) VALUES (6, 5, 5);


select * from produtos;
go

select * from itemVenda;
go

--p2 CLIENTES QUE NÃO FIZERAM COMPRAS
SELECT v.idCliente, c.nomeCliente FROM clientes c LEFT JOIN vendas v ON v.idCliente = c.idCliente WHERE v.idCliente IS NULL;



--P3
SELECT c.idProduto, c.descricao FROM produtos c LEFT JOIN vendas v ON v.idProdu = c.idProduto WHERE v.idCliente IS NULL;
