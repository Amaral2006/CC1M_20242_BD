CREATE DATABASE FlyHigh;
USE FlyHigh;
-- Criação da tabela Passageiros
CREATE TABLE Passageiros (
    cpf CHAR(11) PRIMARY KEY,
    nome VARCHAR(255),
    telefone VARCHAR(15),
    endereco VARCHAR(255)
);

-- Criação da tabela Aeroportos
CREATE TABLE Aeroportos (
    codigo CHAR(3) PRIMARY KEY,
    nome VARCHAR(255),
    cidade VARCHAR(100),
    pais VARCHAR(100)
);

-- Criação da tabela Aeronaves
CREATE TABLE Aeronaves (
    id INT AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR(100),
    capacidade INT,
    ano_fabricacao INT
);

-- Criação da tabela Funcionários
CREATE TABLE Funcionarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    funcao VARCHAR(100)
);

-- Criação da tabela Voos
CREATE TABLE Voos (
    codigo VARCHAR(10) PRIMARY KEY,
    aeroporto_origem CHAR(3),
    aeroporto_destino CHAR(3),
    horario_partida DATETIME,
    horario_chegada DATETIME,
    aeronave_id INT,
    FOREIGN KEY (aeroporto_origem) REFERENCES Aeroportos(codigo),
    FOREIGN KEY (aeroporto_destino) REFERENCES Aeroportos(codigo),
    FOREIGN KEY (aeronave_id) REFERENCES Aeronaves(id)
);

-- Criação da tabela Reservas
CREATE TABLE Reservas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cpf_passageiro CHAR(11),
    voo_codigo VARCHAR(10),
    data_reserva DATETIME,
    FOREIGN KEY (cpf_passageiro) REFERENCES Passageiros(cpf),
    FOREIGN KEY (voo_codigo) REFERENCES Voos(codigo)
);

-- Criação da tabela OperacoesVoo
CREATE TABLE OperacoesVoo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    voo_codigo VARCHAR(10),
    funcionario_id INT,
    funcao_tripulacao VARCHAR(100),
    FOREIGN KEY (voo_codigo) REFERENCES Voos(codigo),
    FOREIGN KEY (funcionario_id) REFERENCES Funcionarios(id)
);

-- Inserções na tabela Passageiros
INSERT INTO Passageiros (cpf, nome, telefone, endereco) 
VALUES ('12345678901', 'Carlos Silva', '+55 11 91234-5678', 'Rua A, São Paulo, Brasil');

INSERT INTO Passageiros (cpf, nome, telefone, endereco) 
VALUES ('23456789012', 'Ana Costa', '+55 21 98765-4321', 'Av. B, Rio de Janeiro, Brasil');

INSERT INTO Passageiros (cpf, nome, telefone, endereco) 
VALUES ('34567890123', 'João Lima', '+55 31 91234-5678', 'Estrada C, Belo Horizonte, Brasil');

INSERT INTO Passageiros (cpf, nome, telefone, endereco) 
VALUES ('45678901234', 'Maria Souza', '+55 41 98765-4321', 'Rua D, Curitiba, Brasil');

INSERT INTO Passageiros (cpf, nome, telefone, endereco) 
VALUES ('56789012345', 'Lucas Pereira', '+55 51 91234-5678', 'Av. E, Porto Alegre, Brasil');

-- Inserções na tabela Aeroportos
INSERT INTO Aeroportos (codigo, nome, cidade, pais) 
VALUES ('GRU', 'Aeroporto Internacional de São Paulo', 'São Paulo', 'Brasil');

INSERT INTO Aeroportos (codigo, nome, cidade, pais) 
VALUES ('GIG', 'Aeroporto Internacional do Rio de Janeiro', 'Rio de Janeiro', 'Brasil');

INSERT INTO Aeroportos (codigo, nome, cidade, pais) 
VALUES ('BSB', 'Aeroporto Internacional de Brasília', 'Brasília', 'Brasil');

INSERT INTO Aeroportos (codigo, nome, cidade, pais) 
VALUES ('MIA', 'Miami International Airport', 'Miami', 'Estados Unidos');

INSERT INTO Aeroportos (codigo, nome, cidade, pais) 
VALUES ('JFK', 'John F. Kennedy International Airport', 'Nova York', 'Estados Unidos');

-- Inserções na tabela Aeronaves
INSERT INTO Aeronaves (modelo, capacidade, ano_fabricacao) 
VALUES ('Boeing 737', 160, 2015);

INSERT INTO Aeronaves (modelo, capacidade, ano_fabricacao) 
VALUES ('Airbus A320', 180, 2017);

INSERT INTO Aeronaves (modelo, capacidade, ano_fabricacao) 
VALUES ('Embraer E195', 124, 2019);

INSERT INTO Aeronaves (modelo, capacidade, ano_fabricacao) 
VALUES ('Boeing 787', 250, 2020);

INSERT INTO Aeronaves (modelo, capacidade, ano_fabricacao) 
VALUES ('Airbus A350', 300, 2022);

-- Inserções na tabela Funcionários
INSERT INTO Funcionarios (nome, funcao) 
VALUES ('Pedro Almeida', 'Piloto');

INSERT INTO Funcionarios (nome, funcao) 
VALUES ('Rafael Souza', 'Copiloto');

INSERT INTO Funcionarios (nome, funcao) 
VALUES ('Carla Lima', 'Comissário de Bordo');

INSERT INTO Funcionarios (nome, funcao) 
VALUES ('Fernanda Dias', 'Comissário de Bordo');

INSERT INTO Funcionarios (nome, funcao) 
VALUES ('Jorge Santos', 'Equipe de Solo');

-- Inserções na tabela Voos
INSERT INTO Voos (codigo, aeroporto_origem, aeroporto_destino, horario_partida, horario_chegada, aeronave_id) 
VALUES ('FH1001', 'GRU', 'JFK', '2024-11-20 08:00:00', '2024-11-20 16:00:00', 1);

INSERT INTO Voos (codigo, aeroporto_origem, aeroporto_destino, horario_partida, horario_chegada, aeronave_id) 
VALUES ('FH1002', 'GIG', 'MIA', '2024-11-20 09:00:00', '2024-11-20 17:00:00', 2);

-- Inserções na tabela Reservas
INSERT INTO Reservas (cpf_passageiro, voo_codigo, data_reserva) 
VALUES ('12345678901', 'FH1001', '2024-11-15 10:00:00');

INSERT INTO Reservas (cpf_passageiro, voo_codigo, data_reserva) 
VALUES ('23456789012', 'FH1002', '2024-11-15 11:00:00');

-- Inserções na tabela OperacoesVoo
INSERT INTO OperacoesVoo (voo_codigo, funcionario_id, funcao_tripulacao) 
VALUES ('FH1001', 1, 'Piloto');

INSERT INTO OperacoesVoo (voo_codigo, funcionario_id, funcao_tripulacao) 
VALUES ('FH1001', 2, 'Copiloto');

-- Atualizações (exemplo por tabela)
UPDATE Passageiros SET telefone = '+55 11 98765-4321' WHERE cpf = '12345678901';
UPDATE Voos SET horario_partida = '2024-11-20 09:30:00' WHERE codigo = 'FH1001';

-- Exclusões (exemplo por tabela)
DELETE FROM Reservas WHERE id = 1;
