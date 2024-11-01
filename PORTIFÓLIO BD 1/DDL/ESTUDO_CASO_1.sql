CREATE DATABASE IF NOT EXISTS cadeia_suprimentos;
CREATE TABLE Fornecedor (
    codigo_fornecedor INT PRIMARY KEY,
    nome_empresa VARCHAR(100) NOT NULL,
    endereco VARCHAR(150),
    pais_origem VARCHAR(50),
    pessoa_contato VARCHAR(100),
    telefone VARCHAR(20)
);

CREATE TABLE Produto (
    codigo_produto INT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    descricao TEXT,
    especificacoes_tecnicas TEXT,
    unidade_medida VARCHAR(20),
    preco_unitario DECIMAL(10, 2)
);

CREATE TABLE Fornecedor_Produto (
    codigo_fornecedor INT,
    codigo_produto INT,
    PRIMARY KEY (codigo_fornecedor, codigo_produto),
    FOREIGN KEY (codigo_fornecedor) REFERENCES Fornecedor(codigo_fornecedor),
    FOREIGN KEY (codigo_produto) REFERENCES Produto(codigo_produto)
);

CREATE TABLE Pedido_Compra (
    numero_pedido INT PRIMARY KEY,
    codigo_fornecedor INT,
    data_pedido DATE,
    data_entrega_esperada DATE,
    status_pedido ENUM('em processamento', 'enviado', 'recebido', 'cancelado'),
    FOREIGN KEY (codigo_fornecedor) REFERENCES Fornecedor(codigo_fornecedor)
);

CREATE TABLE Recebimento_Material (
    id_recebimento INT PRIMARY KEY,
    numero_pedido INT,
    data_recebimento DATE,
    condicao_material ENUM('aceito', 'rejeitado'),
    motivo_rejeicao TEXT,
    FOREIGN KEY (numero_pedido) REFERENCES Pedido_Compra(numero_pedido)
);

CREATE TABLE Filial (
    codigo_filial INT PRIMARY KEY,
    nome VARCHAR(100),
    endereco VARCHAR(150),
    capacidade_armazenamento INT
);
CREATE TABLE Estoque (
    codigo_produto INT PRIMARY KEY,
    quantidade_atual INT,
    localizacao_armazem VARCHAR(100),
    ponto_ressuprimento INT,
    FOREIGN KEY (codigo_produto) REFERENCES Produto(codigo_produto)
);

CREATE TABLE Distribuicao_Filial (
    codigo_distribuicao INT PRIMARY KEY,
    codigo_filial INT,
    codigo_produto INT,
    quantidade INT,
    data_distribuicao DATE,
    FOREIGN KEY (codigo_filial) REFERENCES Filial(codigo_filial),
    FOREIGN KEY (codigo_produto) REFERENCES Produto(codigo_produto)
);

ALTER TABLE Fornecedor ADD email VARCHAR(100);
ALTER TABLE Estoque DROP COLUMN localizacao_armazem;
ALTER TABLE Fornecedor MODIFY telefone VARCHAR(30);
ALTER TABLE Filial CHANGE nome nome_filial VARCHAR(100);
DROP TABLE Distribuicao_Filial;
