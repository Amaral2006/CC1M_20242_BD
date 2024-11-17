- Criação da tabela Fornecedores
CREATE TABLE Fornecedores (
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    endereco VARCHAR(255),
    pais VARCHAR(100),
    pessoa_contato VARCHAR(255),
    telefone VARCHAR(50)
);

-- Inserções na tabela Fornecedores
INSERT INTO Fornecedores (nome, endereco, pais, pessoa_contato, telefone) 
VALUES ('Fornecedor A', 'Rua 1, Bairro 1', 'Brasil', 'João Silva', '+55 11 1234-5678');

INSERT INTO Fornecedores (nome, endereco, pais, pessoa_contato, telefone) 
VALUES ('Fornecedor B', 'Av. 2, Centro', 'Estados Unidos', 'Mary Johnson', '+1 212 555-7890');

-- Criação da tabela Produtos
CREATE TABLE Produtos (
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    descricao TEXT,
    especificacoes_tecnicas TEXT,
    unidade_medida VARCHAR(50),
    preco_unitario DECIMAL(10,2),
    estoque_atual INT,
    ponto_ressuprimento INT,
    localizacao_armazem VARCHAR(100)
);

-- Inserções na tabela Produtos
INSERT INTO Produtos (nome, descricao, especificacoes_tecnicas, unidade_medida, preco_unitario, estoque_atual, ponto_ressuprimento, localizacao_armazem) 
VALUES ('Produto 1', 'Descrição do produto 1', 'Especificação 1', 'Unidade', 100.00, 50, 10, 'Armazém A');

INSERT INTO Produtos (nome, descricao, especificacoes_tecnicas, unidade_medida, preco_unitario, estoque_atual, ponto_ressuprimento, localizacao_armazem) 
VALUES ('Produto 2', 'Descrição do produto 2', 'Especificação 2', 'Quilos', 200.00, 100, 20, 'Armazém B');

-- Criação da tabela Filiais
CREATE TABLE Filiais (
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    endereco VARCHAR(255),
    capacidade_armazenamento INT
);

-- Inserções na tabela Filiais
INSERT INTO Filiais (nome, endereco, capacidade_armazenamento) 
VALUES ('Filial 1', 'Rua A, Bairro X', 500);

INSERT INTO Filiais (nome, endereco, capacidade_armazenamento) 
VALUES ('Filial 2', 'Av. B, Centro', 300);

-- Criação da tabela Pedidos de Compra
CREATE TABLE PedidosCompra (
    numero INT AUTO_INCREMENT PRIMARY KEY,
    fornecedor_id INT,
    data_pedido DATE,
    data_entrega DATE,
    status VARCHAR(50),
    FOREIGN KEY (fornecedor_id) REFERENCES Fornecedores(codigo)
);

-- Inserções na tabela Pedidos de Compra
INSERT INTO PedidosCompra (fornecedor_id, data_pedido, data_entrega, status) 
VALUES (1, '2024-11-01', '2024-11-10', 'Em processamento');

INSERT INTO PedidosCompra (fornecedor_id, data_pedido, data_entrega, status) 
VALUES (2, '2024-11-05', '2024-11-15', 'Enviado');

-- Criação da tabela ItensPedidoCompra
CREATE TABLE ItensPedidoCompra (
    pedido_id INT,
    produto_id INT,
    quantidade INT,
    PRIMARY KEY (pedido_id, produto_id),
    FOREIGN KEY (pedido_id) REFERENCES PedidosCompra(numero),
    FOREIGN KEY (produto_id) REFERENCES Produtos(codigo)
);

-- Inserções na tabela ItensPedidoCompra
INSERT INTO ItensPedidoCompra (pedido_id, produto_id, quantidade) 
VALUES (1, 1, 20);

INSERT INTO ItensPedidoCompra (pedido_id, produto_id, quantidade) 
VALUES (1, 2, 10);

-- Criação da tabela RecebimentoMateriais
CREATE TABLE RecebimentoMateriais (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT,
    data_recebimento DATE,
    condicao_material VARCHAR(50),
    motivo_rejeicao TEXT,
    FOREIGN KEY (pedido_id) REFERENCES PedidosCompra(numero)
);

-- Inserções na tabela RecebimentoMateriais
INSERT INTO RecebimentoMateriais (pedido_id, data_recebimento, condicao_material, motivo_rejeicao) 
VALUES (1, '2024-11-12', 'Aceito', NULL);

INSERT INTO RecebimentoMateriais (pedido_id, data_recebimento, condicao_material, motivo_rejeicao) 
VALUES (2, '2024-11-16', 'Rejeitado', 'Material fora das especificações');

-- Criação da tabela TransferenciasFiliais
CREATE TABLE TransferenciasFiliais (
    id INT AUTO_INCREMENT PRIMARY KEY,
    filial_id INT,
    produto_id INT,
    quantidade INT,
    data_transferencia DATE,
    FOREIGN KEY (filial_id) REFERENCES Filiais(codigo),
    FOREIGN KEY (produto_id) REFERENCES Produtos(codigo)
);

-- Inserções na tabela TransferenciasFiliais
INSERT INTO TransferenciasFiliais (filial_id, produto_id, quantidade, data_transferencia) 
VALUES (1, 1, 15, '2024-11-15');

INSERT INTO TransferenciasFiliais (filial_id, produto_id, quantidade, data_transferencia) 
VALUES (2, 2, 10, '2024-11-16');

-- Atualizações e Exclusões
UPDATE PedidosCompra SET status = 'Recebido' WHERE numero = 1;
UPDATE Produtos SET estoque_atual = estoque_atual - 15 WHERE codigo = 1;

DELETE FROM TransferenciasFiliais WHERE id = 2;
