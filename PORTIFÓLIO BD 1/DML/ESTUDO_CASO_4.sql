CREATE DATABASE Academia_de_Saude_de_Movimento;
USE Academia_de_Saude_de_Movimento;
-- Tabela CLIENTES
CREATE TABLE CLIENTES (
    Codigo VARCHAR(10) PRIMARY KEY,
    CNPJ VARCHAR(20),
    Razao_Social VARCHAR(100),
    Ramo_Atividade VARCHAR(50),
    Dados_Cadastramento DATE,
    Pessoa_Contato VARCHAR(100)
);

-- Tabela TIPO_DE_ENDERECO
CREATE TABLE TIPO_DE_ENDERECO (
    Codigo INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50)
);

-- Tabela ENDEREÇOS
CREATE TABLE ENDEREÇOS (
    Codigo INT AUTO_INCREMENT PRIMARY KEY,
    Numero VARCHAR(10),
    Logradouro VARCHAR(100),
    Complemento VARCHAR(50),
    CEP VARCHAR(10),
    Bairro VARCHAR(50),
    Cidade VARCHAR(50),
    Estado VARCHAR(2),
    Tipo_Endereco_Codigo INT,
    Codigo_Cliente VARCHAR(10),
    FOREIGN KEY (Tipo_Endereco_Codigo) REFERENCES TIPO_DE_ENDERECO(Codigo),
    FOREIGN KEY (Codigo_Cliente) REFERENCES CLIENTES(Codigo)
);

-- Tabela TELEFONES
CREATE TABLE TELEFONES (
    Codigo INT AUTO_INCREMENT PRIMARY KEY,
    Telefone VARCHAR(15),
    Codigo_Cliente VARCHAR(10),
    FOREIGN KEY (Codigo_Cliente) REFERENCES CLIENTES(Codigo)
);

-- Tabela EMPREGADOS
CREATE TABLE EMPREGADOS (
    Matricula VARCHAR(10) PRIMARY KEY,
    Nome VARCHAR(100),
    Telefone VARCHAR(15),
    Carga VARCHAR(10),
    Salario DECIMAL(10, 2),
    Dados_Admissao DATE,
    Qualificacoes VARCHAR(255),
    Endereco VARCHAR(255)
);

-- Tabela FORNECEDORES
CREATE TABLE FORNECEDORES (
    CNPJ VARCHAR(20) PRIMARY KEY,
    Razao_Social VARCHAR(100),
    Endereco VARCHAR(255),
    Telefone VARCHAR(15),
    Pessoa_Contato VARCHAR(100)
);

-- Tabela PRODUTOS
CREATE TABLE PRODUTOS (
    Codigo VARCHAR(10) PRIMARY KEY,
    Nome VARCHAR(100),
    Cor VARCHAR(50),
    Dimensoes VARCHAR(50),
    Peso DECIMAL(10, 2),
    Preco DECIMAL(10, 2),
    Tempo_Fabricacao INT,
    Desenho_Produto VARCHAR(255),
    Horas_Producao DECIMAL(10, 2)
);

-- Tabela COMPONENTES
CREATE TABLE COMPONENTES (
    Codigo VARCHAR(10) PRIMARY KEY,
    Nome VARCHAR(100),
    Quantidade_Estoque INT,
    Preco_Unitario DECIMAL(10, 2),
    Unidade VARCHAR(50),
    Codigo_Fornecedor VARCHAR(20),
    FOREIGN KEY (Codigo_Fornecedor) REFERENCES FORNECEDORES(CNPJ)
);

-- Tabela RECOMENDACOES (Pedidos)
CREATE TABLE RECOMENDACOES (
    Numero VARCHAR(10) PRIMARY KEY,
    Data_Inclusao DATE,
    Valor_Total DECIMAL(10, 2),
    Valor_Desconto DECIMAL(10, 2),
    Valor_Liquido DECIMAL(10, 2),
    Forma_Pagamento VARCHAR(50),
    Quantidade_Parcelas INT,
    Codigo_Cliente VARCHAR(10),
    FOREIGN KEY (Codigo_Cliente) REFERENCES CLIENTES(Codigo)
);

-- Tabela TIPOS_DE_COMPONENTE
CREATE TABLE TIPOS_DE_COMPONENTE (
    Codigo VARCHAR(10) PRIMARY KEY,
    Nome VARCHAR(50)
);

-- Inserir dados nas tabelas

-- Inserir dados na tabela CLIENTES
INSERT INTO CLIENTES (Codigo, CNPJ, Razao_Social, Ramo_Atividade, Dados_Cadastramento, Pessoa_Contato)
VALUES 
('001', '12345678000199', 'Academia de Saúde Ltda.', 'Saúde e Bem-Estar', '2024-11-17', 'João Silva');

-- Inserir dados na tabela TIPO_DE_ENDERECO
INSERT INTO TIPO_DE_ENDERECO (Nome)
VALUES 
('Comercial'), 
('Residencial');

-- Inserir dados na tabela ENDEREÇOS
INSERT INTO ENDEREÇOS (Numero, Logradouro, Complemento, CEP, Bairro, Cidade, Estado, Tipo_Endereco_Codigo, Codigo_Cliente)
VALUES 
('123', 'Rua Principal', 'Apto 101', '12345678', 'Centro', 'São Paulo', 'SP', 1, '001');

-- Inserir dados na tabela TELEFONES
INSERT INTO TELEFONES (Telefone, Codigo_Cliente)
VALUES 
('123456789', '001');

-- Inserir dados na tabela EMPREGADOS
INSERT INTO EMPREGADOS (Matricula, Nome, Telefone, Carga, Salario, Dados_Admissao, Qualificacoes, Endereco)
VALUES 
('E001', 'Maria Souza', '987654321', '40h', 3000.00, '2024-10-01', 'Desenvolvedor', 'Rua Secundária, 100, SP');

-- Inserir dados na tabela FORNECEDORES
INSERT INTO FORNECEDORES (CNPJ, Razao_Social, Endereco, Telefone, Pessoa_Contato)
VALUES 
('98765432000123', 'Fornecedor XYZ', 'Rua dos Fornecedores, 500, SP', '999888777', 'Carlos Lima');

-- Inserir dados na tabela PRODUTOS
INSERT INTO PRODUTOS (Codigo, Nome, Cor, Dimensoes, Peso, Preco, Tempo_Fabricacao, Desenho_Produto, Horas_Producao)
VALUES 
('P001', 'Produto A', 'Vermelho', '30x30', 1.2, 100.00, 10, 'Desenho_Produto_A', 5);

-- Inserir dados na tabela COMPONENTES
INSERT INTO COMPONENTES (Codigo, Nome, Quantidade_Estoque, Preco_Unitario, Unidade, Codigo_Fornecedor)
VALUES 
('C001', 'Componente A', 100, 10.00, 'Unidade', '98765432000123');

-- Inserir dados na tabela RECOMENDACOES (Pedidos)
INSERT INTO RECOMENDACOES (Numero, Data_Inclusao, Valor_Total, Valor_Desconto, Valor_Liquido, Forma_Pagamento, Quantidade_Parcelas, Codigo_Cliente)
VALUES 
('R001', '2024-11-17', 500.00, 50.00, 450.00, 'Cartão de Crédito', 3, '001');

-- Inserir dados na tabela TIPOS_DE_COMPONENTE
INSERT INTO TIPOS_DE_COMPONENTE (Codigo, Nome)
VALUES 
('T001', 'Eletrônico'), 
('T002', 'Mecânico');

-- Atualizar dados nas tabelas

-- Atualizar dados na tabela CLIENTES
UPDATE CLIENTES
SET Razao_Social = 'Academia de Saúde de Movimento Ltda.'
WHERE Codigo = '001';

-- Atualizar dados na tabela PRODUTOS
UPDATE PRODUTOS
SET Preco = 110.00
WHERE Codigo = 'P001';

-- Deletar dados das tabelas

-- Deletar Cliente
DELETE FROM CLIENTES WHERE Codigo = '001';

-- Deletar Produto
DELETE FROM PRODUTOS WHERE Codigo = 'P001';
