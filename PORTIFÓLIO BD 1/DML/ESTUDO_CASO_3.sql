CREATE DATABASE SistemaGestaoEmpresarial;
USE SistemaGestaoEmpresarial;
-- Tabela CLIENTES
CREATE TABLE CLIENTES (
    Codigo INT PRIMARY KEY,
    CNPJ VARCHAR(18),
    RazaoSocial VARCHAR(100),
    RamoAtividade VARCHAR(50),
    DadosCadastro DATE,
    Telefone VARCHAR(15),
    Endereco VARCHAR(255),
    PessoaContato VARCHAR(100)
);

-- Tabela EMPREGADOS
CREATE TABLE EMPREGADOS (
    Matricula INT PRIMARY KEY,
    Nome VARCHAR(100),
    Telefone VARCHAR(15),
    CargaHoraria INT,
    Salario DECIMAL(10, 2),
    DataAdmissao DATE,
    Qualificacoes TEXT,
    Endereco VARCHAR(255)
);

-- Tabela EMPRESAS
CREATE TABLE EMPRESAS (
    CNPJ VARCHAR(18) PRIMARY KEY,
    RazaoSocial VARCHAR(100),
    Telefone VARCHAR(15),
    PessoaContato VARCHAR(100),
    Endereco VARCHAR(255)
);

-- Tabela FORNECEDORES
CREATE TABLE FORNECEDORES (
    CNPJ VARCHAR(18) PRIMARY KEY,
    RazaoSocial VARCHAR(100),
    Endereco VARCHAR(255),
    Telefone VARCHAR(15),
    PessoaContato VARCHAR(100)
);

-- Tabela TIPOS_DE_ENDERECO
CREATE TABLE TIPOS_DE_ENDERECO (
    Codigo INT PRIMARY KEY,
    Nome VARCHAR(50)
);

-- Tabela ENDEREÇOS
CREATE TABLE ENDEREÇOS (
    Numero INT PRIMARY KEY,
    Logradouro VARCHAR(100),
    Complemento VARCHAR(100),
    CEP VARCHAR(10),
    Bairro VARCHAR(50),
    Cidade VARCHAR(50),
    Estado VARCHAR(50),
    TipoEndereco INT,
    FOREIGN KEY (TipoEndereco) REFERENCES TIPOS_DE_ENDERECO(Codigo)
);

-- Tabela RECOMENDACOES
CREATE TABLE RECOMENDACOES (
    Numero INT PRIMARY KEY,
    DataInclusao DATE,
    ValorTotal DECIMAL(10, 2),
    ValorDesconto DECIMAL(10, 2),
    ValorLiquido DECIMAL(10, 2),
    FormaPagamento VARCHAR(50),
    QuantidadeParcelas INT
);

-- Tabela PRODUTOS
CREATE TABLE PRODUTOS (
    Codigo INT PRIMARY KEY,
    Nome VARCHAR(100),
    Cor VARCHAR(50),
    Dimensoes VARCHAR(50),
    Peso DECIMAL(10, 2),
    Preco DECIMAL(10, 2),
    TempoFabricacao INT,
    DesenhoProduto TEXT,
    HorasMaoDeObra INT
);

-- Tabela TIPOS_DE_COMPONENTE
CREATE TABLE TIPOS_DE_COMPONENTE (
    Codigo INT PRIMARY KEY,
    Nome VARCHAR(50)
);

-- Tabela COMPONENTES
CREATE TABLE COMPONENTES (
    Codigo INT PRIMARY KEY,
    Nome VARCHAR(100),
    QuantidadeEstoque INT,
    PrecoUnitario DECIMAL(10, 2),
    Unidade VARCHAR(20),
    TipoComponente INT,
    FOREIGN KEY (TipoComponente) REFERENCES TIPOS_DE_COMPONENTE(Codigo)
);

-- Tabela MAQUINAS
CREATE TABLE MAQUINAS (
    Codigo INT PRIMARY KEY,
    TempoVida INT,
    DataCompra DATE,
    DataFimGarantia DATE
);

-- Tabela RECURSOS_ESPECIFICOS
CREATE TABLE RECURSOS_ESPECIFICOS (
    Codigo INT PRIMARY KEY,
    QuantidadeNecessaria INT,
    Unidade VARCHAR(20),
    TempoUso INT,
    HorasMaoDeObra INT
);

-- Tabela REGISTRO_DE_MANUTENCAO
CREATE TABLE REGISTRO_DE_MANUTENCAO (
    Codigo INT PRIMARY KEY,
    DataManutencao DATE,
    Descricao TEXT
);

-- Tabela REGISTRO_DE_SUPRIMENTOS
CREATE TABLE REGISTRO_DE_SUPRIMENTOS (
    Codigo INT PRIMARY KEY,
    Quantidade INT,
    DataNecessidade DATE
);

-- Comandos de INSERT

-- CLIENTES
INSERT INTO CLIENTES (Codigo, CNPJ, RazaoSocial, RamoAtividade, DadosCadastro, Telefone, Endereco, PessoaContato)
VALUES (1, '12345678000123', 'TechSolution Ltda.', 'Desenvolvimento de Software', '2024-11-01', '1234-5678', 'Rua A, 123', 'João Silva');

-- EMPREGADOS
INSERT INTO EMPREGADOS (Matricula, Nome, Telefone, CargaHoraria, Salario, DataAdmissao, Qualificacoes, Endereco)
VALUES (1, 'Carlos Pereira', '9876-5432', 40, 3000.00, '2023-01-15', 'Programador', 'Rua B, 456');

-- EMPRESAS
INSERT INTO EMPRESAS (CNPJ, RazaoSocial, Telefone, PessoaContato, Endereco)
VALUES ('98765432000198', 'Parceiros Tech Ltda.', '4321-8765', 'Maria Souza', 'Rua C, 789');

-- FORNECEDORES
INSERT INTO FORNECEDORES (CNPJ, RazaoSocial, Endereco, Telefone, PessoaContato)
VALUES ('11122233000111', 'Fornecedor ABC', 'Rua D, 101', '5555-5555', 'Carlos Martins');

-- TIPOS_DE_ENDERECO
INSERT INTO TIPOS_DE_ENDERECO (Codigo, Nome) VALUES (1, 'Comercial'), (2, 'Residencial');

-- ENDEREÇOS
INSERT INTO ENDEREÇOS (Numero, Logradouro, Complemento, CEP, Bairro, Cidade, Estado, TipoEndereco)
VALUES (1, 'Rua E, 123', 'Apto 101', '12345-678', 'Centro', 'São Paulo', 'SP', 1);

-- RECOMENDACOES
INSERT INTO RECOMENDACOES (Numero, DataInclusao, ValorTotal, ValorDesconto, ValorLiquido, FormaPagamento, QuantidadeParcelas)
VALUES (1, '2024-11-01', 1000.00, 100.00, 900.00, 'Cartão de Crédito', 3);

-- PRODUTOS
INSERT INTO PRODUTOS (Codigo, Nome, Cor, Dimensoes, Peso, Preco, TempoFabricacao, DesenhoProduto, HorasMaoDeObra)
VALUES (1, 'Produto X', 'Azul', '10x20x30', 2.5, 100.00, 5, 'Desenho 1', 20);

-- TIPOS_DE_COMPONENTE
INSERT INTO TIPOS_DE_COMPONENTE (Codigo, Nome) VALUES (1, 'Plástico'), (2, 'Metal');

-- COMPONENTES
INSERT INTO COMPONENTES (Codigo, Nome, QuantidadeEstoque, PrecoUnitario, Unidade, TipoComponente)
VALUES (1, 'Componente A', 100, 10.00, 'Unidade', 1);

-- MAQUINAS
INSERT INTO MAQUINAS (Codigo, TempoVida, DataCompra, DataFimGarantia)
VALUES (1, 5, '2020-06-15', '2023-06-15');

-- RECURSOS_ESPECIFICOS
INSERT INTO RECURSOS_ESPECIFICOS (Codigo, QuantidadeNecessaria, Unidade, TempoUso, HorasMaoDeObra)
VALUES (1, 50, 'Unidade', 10, 30);

-- REGISTRO_DE_MANUTENCAO
INSERT INTO REGISTRO_DE_MANUTENCAO (Codigo, DataManutencao, Descricao)
VALUES (1, '2024-11-10', 'Troca de peças na máquina X');

-- REGISTRO_DE_SUPRIMENTOS
INSERT INTO REGISTRO_DE_SUPRIMENTOS (Codigo, Quantidade, DataNecessidade)
VALUES (1, 200, '2024-11-15');

-- Comandos de UPDATE

-- CLIENTES
UPDATE CLIENTES SET Telefone = '1111-2222' WHERE Codigo = 1;

-- EMPREGADOS
UPDATE EMPREGADOS SET Salario = 3500.00 WHERE Matricula = 1;

-- FORNECEDORES
UPDATE FORNECEDORES SET Endereco = 'Rua F, 202' WHERE CNPJ = '11122233000111';

-- Comandos de DELETE

-- CLIENTES
DELETE FROM CLIENTES WHERE CNPJ = '12345678000123';

-- EMPREGADOS
DELETE FROM EMPREGADOS WHERE Matricula = 1;

-- FORNECEDORES
DELETE FROM FORNECEDORES WHERE CNPJ = '11122233000111';
