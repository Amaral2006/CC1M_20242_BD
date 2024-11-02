CREATE SCHEMA inovatechbd;
USE inovatechbd;
CREATE TABLE CLIENTES (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    data_nascimento DATE,
    endereco VARCHAR(255),
    status_fidelidade BOOLEAN DEFAULT FALSE
);

-- 2. Tabela FORNECEDORES
CREATE TABLE FORNECEDORES (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    cnpj VARCHAR(14) UNIQUE NOT NULL,
    razao_social VARCHAR(100) NOT NULL,
    contato VARCHAR(100),
    telefone VARCHAR(15)
);

-- 3. Tabela PRODUTOS
CREATE TABLE PRODUTOS (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL,
    id_fornecedor INT,
    FOREIGN KEY (id_fornecedor) REFERENCES FORNECEDORES(id_fornecedor)
);

-- 4. Tabela VENDAS
CREATE TABLE VENDAS (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_venda DATE,
    valor_total DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES CLIENTES(id_cliente)
);

-- 5. Tabela PAGAMENTOS
CREATE TABLE PAGAMENTOS (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_venda INT,
    valor_pago DECIMAL(10, 2),
    status ENUM('pago', 'pendente') NOT NULL,
    FOREIGN KEY (id_venda) REFERENCES VENDAS(id_venda)
);

-- Exemplos de ALTER TABLE

-- 1. Adicionando uma nova coluna na tabela CLIENTES
ALTER TABLE CLIENTES
ADD COLUMN email VARCHAR(100);

-- 2. Removendo uma coluna na tabela FORNECEDORES
ALTER TABLE FORNECEDORES
DROP COLUMN contato;

-- 3. Modificando o tipo de dado da coluna endereco na tabela CLIENTES
ALTER TABLE CLIENTES
MODIFY COLUMN endereco VARCHAR(300);

-- 4. Renomeando a coluna nome na tabela PRODUTOS para nome_produto
ALTER TABLE PRODUTOS
CHANGE COLUMN nome nome_produto VARCHAR(100);

-- Comando DROP TABLE por schema
DROP TABLE IF EXISTS PAGAMENTOS;

-- Verificando as tabelas criadas
SHOW TABLES;

