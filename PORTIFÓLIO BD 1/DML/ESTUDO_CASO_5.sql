CREATE DATABASE InovaTech;
USE InovaTech;
-- Tabela Cliente
INSERT INTO Clientes (id_cliente, nome, cpf, data_nascimento, endereco, status_fidelidade) 
VALUES (1, 'João Silva', '123.456.789-00', '1985-05-20', 'Rua A, 123', 'Ativo');

INSERT INTO Clientes (id_cliente, nome, cpf, data_nascimento, endereco, status_fidelidade) 
VALUES (2, 'Maria Oliveira', '987.654.321-00', '1990-10-15', 'Avenida B, 456', 'Inativo');

INSERT INTO Clientes (id_cliente, nome, cpf, data_nascimento, endereco, status_fidelidade) 
VALUES (3, 'Carlos Souza', '321.654.987-00', '1995-02-25', 'Rua C, 789', 'Ativo');

INSERT INTO Clientes (id_cliente, nome, cpf, data_nascimento, endereco, status_fidelidade) 
VALUES (4, 'Ana Costa', '159.753.486-00', '1988-07-30', 'Avenida D, 101', 'Ativo');

INSERT INTO Clientes (id_cliente, nome, cpf, data_nascimento, endereco, status_fidelidade) 
VALUES (5, 'Lucas Almeida', '654.123.987-00', '1993-11-05', 'Rua E, 202', 'Ativo');

-- Comandos UPDATE
UPDATE Clientes 
SET status_fidelidade = 'Ativo' 
WHERE id_cliente = 2;

UPDATE Clientes 
SET endereco = 'Rua F, 303' 
WHERE id_cliente = 4;

-- Comando DELETE
DELETE FROM Clientes 
WHERE id_cliente = 5;

-- Tabela Produtos
-- Comandos INSERT
INSERT INTO Produtos (id_produto, nome_produto, categoria, preco, estoque, id_fornecedor) 
VALUES (1, 'Computador HP', 'Computador', 3500.00, 50, 1);

INSERT INTO Produtos (id_produto, nome_produto, categoria, preco, estoque, id_fornecedor) 
VALUES (2, 'Smartphone Samsung', 'Celular', 2500.00, 100, 2);

INSERT INTO Produtos (id_produto, nome_produto, categoria, preco, estoque, id_fornecedor) 
VALUES (3, 'Mouse Logitech', 'Acessório', 150.00, 200, 3);

INSERT INTO Produtos (id_produto, nome_produto, categoria, preco, estoque, id_fornecedor) 
VALUES (4, 'Windows 10', 'Software', 500.00, 75, 4);

INSERT INTO Produtos (id_produto, nome_produto, categoria, preco, estoque, id_fornecedor) 
VALUES (5, 'Teclado Razer', 'Acessório', 350.00, 150, 3);

-- Comandos UPDATE
UPDATE Produtos 
SET estoque = 60 
WHERE id_produto = 1;

UPDATE Produtos 
SET preco = 3000.00 
WHERE id_produto = 2;

-- Comando DELETE
DELETE FROM Produtos 
WHERE id_produto = 5;

-- Tabela Fornecedores
-- Comandos INSERT
INSERT INTO Fornecedores (id_fornecedor, nome_fornecedor, contato) 
VALUES (1, 'Tech Supplies', 'techsupplies@fornecedor.com');

INSERT INTO Fornecedores (id_fornecedor, nome_fornecedor, contato) 
VALUES (2, 'MobileTech', 'mobiletech@fornecedor.com');

INSERT INTO Fornecedores (id_fornecedor, nome_fornecedor, contato) 
VALUES (3, 'Logitech Store', 'logitech@fornecedor.com');

INSERT INTO Fornecedores (id_fornecedor, nome_fornecedor, contato) 
VALUES (4, 'Microsoft', 'microsoft@fornecedor.com');

INSERT INTO Fornecedores (id_fornecedor, nome_fornecedor, contato) 
VALUES (5, 'Razer Store', 'razer@fornecedor.com');

-- Comandos UPDATE
UPDATE Fornecedores 
SET contato = 'contact@techsupplies.com' 
WHERE id_fornecedor = 1;

UPDATE Fornecedores 
SET nome_fornecedor = 'Samsung Electronics' 
WHERE id_fornecedor = 2;

-- Comando DELETE
DELETE FROM Fornecedores 
WHERE id_fornecedor = 5;

-- Tabela Vendas
-- Comandos INSERT
INSERT INTO Vendas (id_venda, id_cliente, data_venda, id_pagamento) 
VALUES (1, 1, '2024-11-01', 1);

INSERT INTO Vendas (id_venda, id_cliente, data_venda, id_pagamento) 
VALUES (2, 3, '2024-11-02', 2);

INSERT INTO Vendas (id_venda, id_cliente, data_venda, id_pagamento) 
VALUES (3, 4, '2024-11-03', 3);

INSERT INTO Vendas (id_venda, id_cliente, data_venda, id_pagamento) 
VALUES (4, 2, '2024-11-04', 4);

INSERT INTO Vendas (id_venda, id_cliente, data_venda, id_pagamento) 
VALUES (5, 5, '2024-11-05', 5);

-- Comandos UPDATE
UPDATE Vendas 
SET data_venda = '2024-11-06' 
WHERE id_venda = 3;

UPDATE Vendas 
SET id_cliente = 1 
WHERE id_venda = 4;

-- Comando DELETE
DELETE FROM Vendas 
WHERE id_venda = 5;

-- Tabela Pagamentos
-- Comandos INSERT
INSERT INTO Pagamentos (id_pagamento, id_cliente, valor, status_pagamento) 
VALUES (1, 1, 3500.00, 'Pago');

INSERT INTO Pagamentos (id_pagamento, id_cliente, valor, status_pagamento) 
VALUES (2, 3, 2500.00, 'Pendente');

INSERT INTO Pagamentos (id_pagamento, id_cliente, valor, status_pagamento) 
VALUES (3, 4, 500.00, 'Pago');

INSERT INTO Pagamentos (id_pagamento, id_cliente, valor, status_pagamento) 
VALUES (4, 2, 1500.00, 'Pendente');

INSERT INTO Pagamentos (id_pagamento, id_cliente, valor, status_pagamento) 
VALUES (5, 5, 350.00, 'Pago');

-- Comandos UPDATE
UPDATE Pagamentos 
SET status_pagamento = 'Pago' 
WHERE id_pagamento = 2;

UPDATE Pagamentos 
SET valor = 1700.00 
WHERE id_pagamento = 4;

-- Comando DELETE
DELETE FROM Pagamentos 
WHERE id_pagamento = 5;

