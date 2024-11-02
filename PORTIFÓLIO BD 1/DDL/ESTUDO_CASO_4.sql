CREATE DATABASE IF NOT EXISTS SaudeEmMovimento;
USE SaudeEmMovimento;
CREATE TABLE Modalidades (
    id_modalidade INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Tabela Instrutores
CREATE TABLE Instrutores (
    id_instrutor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100) NOT NULL
);

-- Tabela Alunos
CREATE TABLE Alunos (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
    endereco VARCHAR(255)
);

-- Tabela Planos_Treinamento
CREATE TABLE Planos_Treinamento (
    id_plano INT AUTO_INCREMENT PRIMARY KEY,
    descricao TEXT NOT NULL,
    id_instrutor INT,
    FOREIGN KEY (id_instrutor) REFERENCES Instrutores(id_instrutor)
);

-- Tabela Aulas
CREATE TABLE Aulas (
    id_aula INT AUTO_INCREMENT PRIMARY KEY,
    id_modalidade INT,
    id_instrutor INT,
    horario TIME NOT NULL,
    capacidade INT NOT NULL,
    FOREIGN KEY (id_modalidade) REFERENCES Modalidades(id_modalidade),
    FOREIGN KEY (id_instrutor) REFERENCES Instrutores(id_instrutor)
);

-- Tabela Pagamentos
CREATE TABLE Pagamentos (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    valor DECIMAL(10, 2) NOT NULL,
    data_pagamento DATE NOT NULL,
    status ENUM('pago', 'pendente') NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno)
);

-- Tabela Matrículas (Associativa entre Alunos e Modalidades)
CREATE TABLE Matriculas (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    id_modalidade INT,
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno),
    FOREIGN KEY (id_modalidade) REFERENCES Modalidades(id_modalidade)
);

-- Exemplo de operações ALTER (Add, Drop, Modify, Change)

-- Adicionar uma coluna "telefone" à tabela Alunos
ALTER TABLE Alunos ADD telefone VARCHAR(15);

-- Remover a coluna "especialidade" da tabela Instrutores
ALTER TABLE Instrutores DROP COLUMN especialidade;

-- Modificar o tipo de dado da coluna "descricao" na tabela Planos_Treinamento para VARCHAR(255)
ALTER TABLE Planos_Treinamento MODIFY descricao VARCHAR(255);

-- Renomear a coluna "horario" para "hora_aula" na tabela Aulas
ALTER TABLE Aulas CHANGE horario hora_aula TIME NOT NULL;

-- Comando para excluir a tabela Pagamentos
DROP TABLE IF EXISTS Pagamentos;

