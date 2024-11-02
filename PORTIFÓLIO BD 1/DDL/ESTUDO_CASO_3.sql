CREATE DATABASE IF NOT EXISTS TechSolution;
USE TechSolution;
CREATE TABLE Tipo_Endereco (
    codigo_tipo_endereco INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

-- Tabela Produtos
CREATE TABLE Produtos (
    codigo_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cor VARCHAR(30),
    dimensoes VARCHAR(50),
    peso DECIMAL(10, 2),
    preco DECIMAL(10, 2),
    tempo_fabricacao INT,
    desenho_produto TEXT,
    horas_mao_de_obra INT
);

-- Tabela Tipos_Comp
CREATE TABLE Tipos_Comp (
    codigo_tipo_comp INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

-- Tabela Enderecos
CREATE TABLE Enderecos (
    id_endereco INT AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(10),
    logradouro VARCHAR(100),
    complemento VARCHAR(50),
    cep VARCHAR(10),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    estado VARCHAR(50),
    codigo_tipo_endereco INT,
    FOREIGN KEY (codigo_tipo_endereco) REFERENCES Tipo_Endereco(codigo_tipo_endereco)
);

-- Tabela Clientes
CREATE TABLE Clientes (
    codigo_cliente INT AUTO_INCREMENT PRIMARY KEY,
    cnpj VARCHAR(14) NOT NULL UNIQUE,
    razao_social VARCHAR(100) NOT NULL,
    ramo_atividade VARCHAR(50),
    dados_cadastramento DATE,
    pessoa_contato VARCHAR(100)
);

-- Tabela Empregados
CREATE TABLE Empregados (
    matricula INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    carga VARCHAR(20),
    salario DECIMAL(10, 2),
    dados_admissao DATE,
    qualificacoes TEXT,
    id_endereco INT,
    FOREIGN KEY (id_endereco) REFERENCES Enderecos(id_endereco)
);

-- Tabela Empresas
CREATE TABLE Empresas (
    cnpj VARCHAR(14) NOT NULL UNIQUE,
    razao_social VARCHAR(100) NOT NULL,
    pessoa_contato VARCHAR(100),
    id_endereco INT,
    PRIMARY KEY (cnpj),
    FOREIGN KEY (id_endereco) REFERENCES Enderecos(id_endereco)
);

-- Tabela Fornecedores
CREATE TABLE Fornecedores (
    cnpj VARCHAR(14) NOT NULL UNIQUE,
    razao_social VARCHAR(100) NOT NULL,
    pessoa_contato VARCHAR(100),
    id_endereco INT,
    PRIMARY KEY (cnpj),
    FOREIGN KEY (id_endereco) REFERENCES Enderecos(id_endereco)
);

-- Tabela Componentes
CREATE TABLE Componentes (
    codigo_componente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    quantidade_estoque INT,
    preco_unitario DECIMAL(10, 2),
    unidade VARCHAR(20),
    codigo_tipo_comp INT,
    FOREIGN KEY (codigo_tipo_comp) REFERENCES Tipos_Comp(codigo_tipo_comp)
);

-- Tabela Recomendacoes
CREATE TABLE Recomendacoes (
    numero INT AUTO_INCREMENT PRIMARY KEY,
    dados_inclusao DATE,
    valor_total DECIMAL(10, 2),
    valor_desconto DECIMAL(10, 2),
    valor_liquido DECIMAL(10, 2),
    id_forma_pagamento INT,
    quantidade_parcelas INT
);

-- Tabela Maquinas
CREATE TABLE Maquinas (
    id_maquina INT AUTO_INCREMENT PRIMARY KEY,
    tempo_vida INT,
    dados_compra DATE,
    dados_fim_garantia DATE
);

-- Tabela Re (Recursos Especificos)
CREATE TABLE Re (
    id_re INT AUTO_INCREMENT PRIMARY KEY,
    quantidade_necessaria INT,
    unidade VARCHAR(20),
    tempo_uso INT,
    horas_mao_de_obra INT,
    codigo_produto INT,
    FOREIGN KEY (codigo_produto) REFERENCES Produtos(codigo_produto)
);

-- Tabela Rm (Registro de Manutencao)
CREATE TABLE Rm (
    id_rm INT AUTO_INCREMENT PRIMARY KEY,
    dados DATE,
    descricao TEXT,
    id_maquina INT,
    FOREIGN KEY (id_maquina) REFERENCES Maquinas(id_maquina)
);

-- Tabela Rs (Registro de Suprimentos)
CREATE TABLE Rs (
    id_rs INT AUTO_INCREMENT PRIMARY KEY,
    quantidade INT,
    dados_necessidade DATE,
    codigo_componente INT,
    FOREIGN KEY (codigo_componente) REFERENCES Componentes(codigo_componente)
);

-- Exemplo de operações ALTER (Add, Drop, Modify, Change)

-- Adicionar uma coluna email à tabela Clientes
ALTER TABLE Clientes ADD email VARCHAR(100);

-- Remover a coluna pessoa_contato da tabela Fornecedores
ALTER TABLE Fornecedores DROP COLUMN pessoa_contato;

-- Modificar o tipo de dado da coluna carga na tabela Empregados para VARCHAR(50)
ALTER TABLE Empregados MODIFY carga VARCHAR(50);

-- Renomear a coluna razao_social para nome_fantasia na tabela Empresas
ALTER TABLE Empresas CHANGE razao_social nome_fantasia VARCHAR(100);

-- Comando para excluir a tabela Rs
DROP TABLE IF EXISTS Rs;
