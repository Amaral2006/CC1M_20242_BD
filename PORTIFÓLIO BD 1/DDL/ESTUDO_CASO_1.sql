CREATE DATABASE CadeiaSuprimentos;
USE CadeiaSuprimentos;

-- Tabela Fornecedor (somente chave primária)
CREATE TABLE Fornecedor (
    codigo_fornecedor INT PRIMARY KEY,
    nome_empresa VARCHAR(100) NOT NULL,
    endereco VARCHAR(150),
    pais_origem VARCHAR(50),
    pessoa_contato VARCHAR(100),
    telefone VARCHAR(20),
    historico_fornecimento TEXT
);

-- Tabela Produto (somente chave primária)
CREATE TABLE Produto (
    codigo_produto INT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    descricao TEXT,
    especificacoes_tecnicas TEXT,
    unidade_medida VARCHAR(20),
    preco_unitario DECIMAL(10, 2)
);

-- Tabela Filial (somente chave primária)
CREATE TABLE Filial (
    codigo_filial INT PRIMARY KEY,
    nome VARCHAR(100),
    endereco VARCHAR(150),
    capacidade_armazenamento INT
);

-- Tabela Estoque (chave primária e chave estrangeira)
CREATE TABLE Estoque (
    codigo_produto INT PRIMARY KEY,
    quantidade_atual INT,
    localizacao_armazem VARCHAR(100),
    ponto_ressuprimento INT,
    FOREIGN KEY (codigo_produto) REFERENCES Produto(codigo_produto)
);

-- Tabela Pedido_Compra (chave primária e chave estrangeira)
CREATE TABLE Pedido_Compra (
    numero_pedido INT PRIMARY KEY,
    codigo_fornecedor INT,
    data_pedido DATE,
    data_entrega_esperada DATE,
    status_pedido ENUM('em processamento', 'enviado', 'recebido', 'cancelado'),
    FOREIGN KEY (codigo_fornecedor) REFERENCES Fornecedor(codigo_fornecedor)
);

-- Tabela Recebimento_Material (chave primária e chave estrangeira)
CREATE TABLE Recebimento_Material (
    id_recebimento INT PRIMARY KEY,
    numero_pedido INT,
    data_recebimento DATE,
    quantidade_recebida INT,
    condicao_material ENUM('aceito', 'rejeitado'),
    motivo_rejeicao TEXT,
    FOREIGN KEY (numero_pedido) REFERENCES Pedido_Compra(numero_pedido)
);

-- Tabela Distribuicao_Filial (chave primária e chave estrangeira)
CREATE TABLE Distribuicao_Filial (
    codigo_distribuicao INT PRIMARY KEY,
    codigo_filial INT,
    codigo_produto INT,
    quantidade INT,
    data_distribuicao DATE,
    FOREIGN KEY (codigo_filial) REFERENCES Filial(codigo_filial),
    FOREIGN KEY (codigo_produto) REFERENCES Produto(codigo_produto)
);

-- Exemplos de operações ALTER (ADD, DROP, MODIFY, CHANGE)

-- Exemplo de ALTER para adicionar uma coluna na tabela Fornecedor
ALTER TABLE Fornecedor ADD email VARCHAR(100);

-- Exemplo de ALTER para remover uma coluna da tabela Estoque
ALTER TABLE Estoque DROP COLUMN localizacao_armazem;

-- Exemplo de ALTER para modificar o tipo de dado da coluna 'telefone' na tabela Fornecedor
ALTER TABLE Fornecedor MODIFY telefone VARCHAR(30);

-- Exemplo de ALTER para renomear a coluna 'nome' para 'nome_filial' na tabela Filial
ALTER TABLE Filial CHANGE nome nome_filial VARCHAR(100);

-- Comando DROP para excluir uma tabela completa no esquema
DROP TABLE IF EXISTS Distribuicao_Filial;

-- Exemplo de comando DROP para excluir o esquema (se aplicável)
DROP SCHEMA IF EXISTS CadeiaSuprimentos;
