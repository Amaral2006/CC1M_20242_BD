CREATE DATABASE cadeia de suplementos;
USE cadeiadesuplementos;
-- Criar a tabela Fornecedor
CREATE TABLE Fornecedor (
    fornecedor_id INT PRIMARY KEY,
    nome_empresa VARCHAR(255),
    endereco VARCHAR(255),
    pais_origem VARCHAR(255),
    pessoa_contato VARCHAR(255),
    telefone VARCHAR(50),
    historico_fornecimento TEXT
);
-- Criar a tabela Produto
CREATE TABLE Produto (
    produto_id INT PRIMARY KEY,
    nome_produto VARCHAR(255),
    descricao TEXT,
    unidade_medida VARCHAR(50),
    preco_unitario DECIMAL(10, 2)
);

-- Criar a tabela PedidoCompra
CREATE TABLE PedidoCompra (
    pedido_id INT PRIMARY KEY,
    data_pedido DATE,
    data_estimativa_entrega DATE,
    status_pedido VARCHAR(50),
    fornecedor_id INT,
    FOREIGN KEY (fornecedor_id) REFERENCES Fornecedor(fornecedor_id)
);

-- Criar a tabela RecebimentoMateriais
CREATE TABLE RecebimentoMateriais (
    recebimento_id INT PRIMARY KEY,
    data_recebimento DATE,
    quantidade_recebida INT,
    condicao_material VARCHAR(50),
    motivo_rejeicao TEXT,
    pedido_id INT,
    FOREIGN KEY (pedido_id) REFERENCES PedidoCompra(pedido_id)
);

-- Criar a tabela Filial
CREATE TABLE Filial (
    filial_id INT PRIMARY KEY,
    nome VARCHAR(255),
    endereco VARCHAR(255),
    capacidade_armazenamento INT
);

-- Criar a tabela Estoque
CREATE TABLE Estoque (
    estoque_id INT PRIMARY KEY,
    quantidade_em_estoque INT,
    localizacao_armazenagem VARCHAR(255),
    ponto_ressuprimento INT,
    produto_id INT,
    filial_id INT,
    FOREIGN KEY (produto_id) REFERENCES Produto(produto_id),
    FOREIGN KEY (filial_id) REFERENCES Filial(filial_id)
);

-- Criar a tabela TransferenciaProdutos
CREATE TABLE TransferenciaProdutos (
    transferencia_id INT PRIMARY KEY,
    data_transferencia DATE,
    quantidade_transferida INT,
    filial_origem_id INT,
    filial_destino_id INT,
    produto_id INT,
    FOREIGN KEY (filial_origem_id) REFERENCES Filial(filial_id),
    FOREIGN KEY (filial_destino_id) REFERENCES Filial(filial_id),
    FOREIGN KEY (produto_id) REFERENCES Produto(produto_id)
);

-- Inserir dados na tabela Fornecedor
INSERT INTO Fornecedor (fornecedor_id, nome_empresa, endereco, pais_origem, pessoa_contato, telefone, historico_fornecimento)
VALUES 
(1, 'Fornecedor A', 'Rua ABC, 123', 'Brasil', 'João Silva', '1111-1111', 'Entrega contínua de matéria-prima'),
(2, 'Fornecedor B', 'Av. XYZ, 456', 'EUA', 'Maria Oliveira', '2222-2222', 'Fornecedor de peças eletrônicas'),
(3, 'Fornecedor C', 'Rua DEF, 789', 'China', 'Li Wei', '3333-3333', 'Fornecimento esporádico de componentes');

-- Inserir dados na tabela Produto
INSERT INTO Produto (produto_id, nome_produto, descricao, unidade_medida, preco_unitario)
VALUES
(1, 'Produto A', 'Produto básico para fabricação', 'kg', 50.00),
(2, 'Produto B', 'Peça eletrônica de alta qualidade', 'unidade', 100.00),
(3, 'Produto C', 'Componente mecânico', 'kg', 30.00);

-- Inserir dados na tabela PedidoCompra
INSERT INTO PedidoCompra (pedido_id, data_pedido, data_estimativa_entrega, status_pedido, fornecedor_id)
VALUES
(1, '2024-10-10', '2024-10-20', 'Em Processamento', 1),
(2, '2024-11-05', '2024-11-15', 'Em Processamento', 2),
(3, '2024-11-10', '2024-11-20', 'Em Processamento', 3);

-- Inserir dados na tabela RecebimentoMateriais
INSERT INTO RecebimentoMateriais (recebimento_id, data_recebimento, quantidade_recebida, condicao_material, motivo_rejeicao, pedido_id)
VALUES
(1, '2024-10-21', 100, 'Aceito', NULL, 1),
(2, '2024-11-16', 50, 'Rejeitado', 'Danos no transporte', 2),
(3, '2024-11-18', 150, 'Aceito', NULL, 3);

-- Inserir dados na tabela Filial
INSERT INTO Filial (filial_id, nome, endereco, capacidade_armazenamento)
VALUES
(1, 'Filial A', 'Av. Principal, 100', 1000),
(2, 'Filial B', 'Rua Secundária, 200', 500),
(3, 'Filial C', 'Estrada do Norte, 300', 750);

-- Inserir dados na tabela Estoque
INSERT INTO Estoque (estoque_id, quantidade_em_estoque, localizacao_armazenagem, ponto_ressuprimento, produto_id, filial_id)
VALUES
(1, 200, 'A1', 50, 1, 1),
(2, 100, 'B2', 30, 2, 2),
(3, 300, 'C3', 100, 3, 3);

-- Inserir dados na tabela TransferenciaProdutos
INSERT INTO TransferenciaProdutos (transferencia_id, data_transferencia, quantidade_transferida, filial_origem_id, filial_destino_id, produto_id)
VALUES
(1, '2024-11-05', 50, 1, 2, 1),
(2, '2024-11-10', 75, 2, 3, 2),
(3, '2024-11-15', 100, 3, 1, 3);

-- Atualizar o status do PedidoCompra
UPDATE PedidoCompra
SET status_pedido = 'Enviado'
WHERE pedido_id = 1;

-- Atualizar a quantidade em estoque
UPDATE Estoque
SET quantidade_em_estoque = 180
WHERE estoque_id = 1;

-- Deletar um fornecedor
DELETE FROM Fornecedor
WHERE fornecedor_id = 2;

-- Deletar um produto
DELETE FROM Produto
WHERE produto_id = 3;






