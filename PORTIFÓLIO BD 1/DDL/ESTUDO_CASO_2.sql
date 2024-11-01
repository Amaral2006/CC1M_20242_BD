CREATE DATABASE flyhigh_airlines;
CREATE TABLE Passageiros (
    id_passageiro SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    cpf VARCHAR(14) UNIQUE,
    telefone VARCHAR(15),
    endereco VARCHAR(255),
    email VARCHAR(100)
);

CREATE TABLE Voos (
    id_voo SERIAL PRIMARY KEY,
    codigo_voo VARCHAR(10) UNIQUE,
    origem VARCHAR(3),
    destino VARCHAR(3),
    horario_partida TIMESTAMP,
    horario_chegada TIMESTAMP
);

CREATE TABLE Aeroportos (
    id_aeroporto SERIAL PRIMARY KEY,
    codigo_aeroporto VARCHAR(3) UNIQUE,
    nome VARCHAR(100),
    localizacao VARCHAR(255)
);

CREATE TABLE Aeronaves (
    id_aeronave SERIAL PRIMARY KEY,
    modelo VARCHAR(100),
    identificador VARCHAR(10) UNIQUE
);

CREATE TABLE Funcionarios (
    id_funcionario SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    cargo VARCHAR(50)
);

CREATE TABLE Reservas (
    id_reserva SERIAL PRIMARY KEY,
    id_passageiro INT REFERENCES Passageiros(id_passageiro),
    id_voo INT REFERENCES Voos(id_voo),
    data_reserva TIMESTAMP
);

INSERT INTO Passageiros (nome, cpf, telefone, endereco, email)
VALUES 
('João da Silva', '123.456.789-00', '99999-9999', 'Rua A, 123', 'joao@exemplo.com'),
('Ana Oliveira', '987.654.321-00', '88888-8888', 'Av. B, 456', 'ana@exemplo.com');

INSERT INTO Voos (codigo_voo, origem, destino, horario_partida, horario_chegada)
VALUES 
('FH123', 'SGP', 'RIO', '2024-11-01 15:00:00', '2024-11-01 18:00:00'),
('FH456', 'RIO', 'SGP', '2024-11-02 09:00:00', '2024-11-02 12:00:00');

SELECT * FROM Passageiros;
SELECT * FROM Voos WHERE destino = 'RIO';
UPDATE Passageiros
SET telefone = '77777-0000', email = 'joao.novo@exemplo.com'
WHERE id_passageiro = 1;
UPDATE Voos
SET horario_chegada = '2024-11-01 18:30:00'
WHERE codigo_voo = 'FH123';
DELETE FROM Passageiros
WHERE id_passageiro = 1;
DELETE FROM Voos
WHERE codigo_voo = 'FH123';
SHOW TABLES;
DESCRIBE Passageiros;
