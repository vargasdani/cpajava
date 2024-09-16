-- Removendo tabelas na ordem correta para evitar conflitos de chaves estrangeiras
DROP TABLE IF EXISTS Predicao;
DROP TABLE IF EXISTS DadosProducao;
DROP TABLE IF EXISTS DadosClimaticos;
DROP TABLE IF EXISTS Colheita;
DROP TABLE IF EXISTS Fazenda;
DROP TABLE IF EXISTS Imagem;

-- Criando a tabela Fazenda
CREATE TABLE Fazenda (
    id INT IDENTITY PRIMARY KEY,
    dono VARCHAR(255),
    latitude VARCHAR(50),
    longitude VARCHAR(50),
    tamanho DECIMAL(10,2)
);

-- Criando a tabela Colheita
CREATE TABLE Colheita (
    id INT IDENTITY PRIMARY KEY,
    nome VARCHAR(255),
    tipo VARCHAR(50),
    estacao_do_ano VARCHAR(50),
    fazenda_id INT,
    CONSTRAINT fk_fazenda_colheita FOREIGN KEY (fazenda_id) REFERENCES Fazenda(id)
);

-- Criando a tabela Predicao
CREATE TABLE Predicao (
    id INT IDENTITY PRIMARY KEY,
    colheita_id INT,
    fazenda_id INT,
    data_predicao DATE,
    qtd_prevista DECIMAL(10,2),
    CONSTRAINT fk_colheita_predicao FOREIGN KEY (colheita_id) REFERENCES Colheita(id),
    CONSTRAINT fk_fazenda_predicao FOREIGN KEY (fazenda_id) REFERENCES Fazenda(id)
);

-- Criando a tabela Imagem
CREATE TABLE Imagem (
    id INT IDENTITY PRIMARY KEY,
    nome VARCHAR(255),
    tipo VARCHAR(50),
    dados VARBINARY(MAX), -- Adaptando de BLOB para VARBINARY(MAX)
    data_upload DATETIME
);

-- Criando a tabela DadosProducao
CREATE TABLE DadosProducao (
    id INT IDENTITY PRIMARY KEY,
    colheita_id INT,
    data_colheita DATE,
    qtd_produzida DECIMAL(10,2),
    lista_fertilizantes NVARCHAR(MAX), -- Utilizando NVARCHAR(MAX) para strings longas
    CONSTRAINT fk_colheita_dadosproducao FOREIGN KEY (colheita_id) REFERENCES Colheita(id)
);

-- Criando a tabela DadosClimaticos
CREATE TABLE DadosClimaticos (
    id INT IDENTITY PRIMARY KEY,
    data_local DATE,
    temperatura_graus DECIMAL(5,2),
    umidade INT,
    precipitacao DECIMAL(5,2),
    fazenda_id INT,
    CONSTRAINT fk_fazenda_dadosclimaticos FOREIGN KEY (fazenda_id) REFERENCES Fazenda(id)
);

-- Inserindo dados na tabela Fazenda
INSERT INTO Fazenda (dono, latitude, longitude, tamanho) 
VALUES ('Danizinha', '-22.1234', '-47.5678', 150);
INSERT INTO Fazenda (dono, latitude, longitude, tamanho) 
VALUES ('Nathinha', '-23.9876', '-48.6543', 200);
INSERT INTO Fazenda (dono, latitude, longitude, tamanho) 
VALUES ('Marcela', '-23.9876', '-48.6543', 200);

-- Inserindo dados na tabela Colheita
INSERT INTO Colheita (nome, tipo, estacao_do_ano, fazenda_id) 
VALUES ('Milho', 'Cereal', 'Primavera', 1);
INSERT INTO Colheita (nome, tipo, estacao_do_ano, fazenda_id) 
VALUES ('Soja', 'Grão', 'Verão', 2);

-- Inserindo dados na tabela Predicao
INSERT INTO Predicao (colheita_id, fazenda_id, data_predicao, qtd_prevista) 
VALUES (1, 1, '2024-09-15', 1200);
INSERT INTO Predicao (colheita_id, fazenda_id, data_predicao, qtd_prevista) 
VALUES (2, 2, '2024-10-20', 1500);

-- Inserindo dados na tabela Imagem
INSERT INTO Imagem (nome, tipo, dados, data_upload) 
VALUES ('Imagem1.jpg', 'image/jpeg', NULL, SYSDATETIME());
INSERT INTO Imagem (nome, tipo, dados, data_upload) 
VALUES ('Imagem2.jpg', 'image/png', NULL, SYSDATETIME());

-- Inserindo dados na tabela DadosProducao
INSERT INTO DadosProducao (colheita_id, data_colheita, qtd_produzida, lista_fertilizantes) 
VALUES (1, '2024-03-01', 1000, 'Nitrogênio, Potássio');
INSERT INTO DadosProducao (colheita_id, data_colheita, qtd_produzida, lista_fertilizantes) 
VALUES (2, '2024-03-10', 800, 'Fósforo, Cálcio');

-- Inserindo dados na tabela DadosClimaticos
INSERT INTO DadosClimaticos (data_local, temperatura_graus, umidade, precipitacao, fazenda_id) 
VALUES ('2024-01-01', 25.5, 75, 100.2, 1);
INSERT INTO DadosClimaticos (data_local, temperatura_graus, umidade, precipitacao, fazenda_id) 
VALUES ('2024-02-15', 22.3, 60, 50.5, 2);

-- Consultas de leitura
SELECT * FROM Fazenda;
SELECT * FROM Colheita;
SELECT * FROM Predicao;
SELECT id, nome, tipo, data_upload FROM Imagem;
SELECT * FROM DadosProducao;
SELECT * FROM DadosClimaticos;

-- Consulta com JOIN
SELECT c.nome, c.tipo, f.dono 
FROM Colheita c 
JOIN Fazenda f ON c.fazenda_id = f.id 
WHERE f.dono = 'Danizinha';

-- Atualizando dados
UPDATE Fazenda 
SET dono = 'Daniele' 
WHERE id = 1;

UPDATE Colheita 
SET nome = 'Morango' 
WHERE id = 1;

-- Deletando registros

-- Deletar predições associadas a colheitas da fazenda 
DELETE FROM Predicao 
WHERE colheita_id IN (SELECT id FROM Colheita WHERE fazenda_id = 2);

-- Deletar dados de produção associados a colheitas da fazenda
DELETE FROM DadosProducao 
WHERE colheita_id IN (SELECT id FROM Colheita WHERE fazenda_id = 2);

DELETE FROM Colheita 
WHERE fazenda_id = 2;

