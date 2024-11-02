CREATE DATABASE IF NOT EXISTS FlyHighAirlines;
USE FlyHighAirlines;
CREATE TABLE Passageiro (
    id_passageiro INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    endereco VARCHAR(255)
);

-- Tabela Aeroporto
CREATE TABLE Aeroporto (
    codigo_aeroporto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(50) NOT NULL
);

-- Tabela Aeronave
CREATE TABLE Aeronave (
    id_aeronave INT AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR(100) NOT NULL,
    capacidade INT NOT NULL
);

-- Tabela Funcionario
CREATE TABLE Funcionario (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    telefone VARCHAR(20)
);

-- Tabela Voo
CREATE TABLE Voo (
    id_voo INT AUTO_INCREMENT PRIMARY KEY,
    codigo_voo VARCHAR(20) NOT NULL UNIQUE,
    origem INT NOT NULL,
    destino INT NOT NULL,
    horario_partida DATETIME NOT NULL,
    horario_chegada DATETIME NOT NULL,
    FOREIGN KEY (origem) REFERENCES Aeroporto(codigo_aeroporto),
    FOREIGN KEY (destino) REFERENCES Aeroporto(codigo_aeroporto)
);

-- Tabela Reserva
CREATE TABLE Reserva (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_passageiro INT NOT NULL,
    id_voo INT NOT NULL,
    FOREIGN KEY (id_passageiro) REFERENCES Passageiro(id_passageiro),
    FOREIGN KEY (id_voo) REFERENCES Voo(id_voo)
);

-- Tabela Operacao_Voo
CREATE TABLE Operacao_Voo (
    id_operacao INT AUTO_INCREMENT PRIMARY KEY,
    id_voo INT NOT NULL,
    id_funcionario INT NOT NULL,
    data_operacao DATE NOT NULL,
    FOREIGN KEY (id_voo) REFERENCES Voo(id_voo),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id_funcionario)
);

-- Exemplo de operações ALTER (Add, Drop, Modify, Change)

-- Adicionar uma coluna email à tabela Passageiro
ALTER TABLE Passageiro ADD email VARCHAR(100);

-- Remover a coluna telefone da tabela Funcionario
ALTER TABLE Funcionario DROP COLUMN telefone;

-- Modificar o tipo de dado da coluna cpf na tabela Passageiro para VARCHAR(15)
ALTER TABLE Passageiro MODIFY cpf VARCHAR(15);

-- Renomear a coluna nome para nome_funcionario na tabela Funcionario
ALTER TABLE Funcionario CHANGE nome nome_funcionario VARCHAR(100);

-- Comando para excluir a tabela Operacao_Voo
DROP TABLE IF EXISTS Operacao_Voo;
