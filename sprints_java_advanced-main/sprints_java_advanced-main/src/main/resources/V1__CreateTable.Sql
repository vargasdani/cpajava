CREATE TABLE Predicao (
    id NUMBERnot  not null auto_increment,
    colheita_id NUMBER,
    fazenda_id NUMBER,
    data_predicao DATE,
    qtd_prevista NUMBER,
    FOREIGN KEY (colheita_id) REFERENCES Colheita(id),
    FOREIGN KEY (fazenda_id) REFERENCES Fazenda(id)
);

CREATE TABLE Imagem (
    id NUMBER not null auto_increment,
    nome VARCHAR2(255),
    tipo VARCHAR2(50),
    dados BLOB,
    data_upload TIMESTAMP
    primary key (id)
);

CREATE TABLE Fazenda (
    id NUMBER not null auto_increment,
    dono VARCHAR2(255),
    latitude VARCHAR2(50),
    longitude VARCHAR2(50),
    tamanho NUMBER
    primary key (id)
);

CREATE TABLE DadosProducao (
    id NUMBER not null auto_increment,
    colheita_id NUMBER,
    data_colheita DATE,
    qtd_produzida NUMBER,
    lista_fertilizantes CLOB, 
    primary key (id),
    FOREIGN KEY (colheita_id) REFERENCES Colheita(id)
);

CREATE TABLE DadosClimaticos (
    id NUMBER not null auto_increment,
    data_local DATE,
    temperatura_graus NUMBER(5, 2), -- Temperatura com precisão
    umidade NUMBER,
    precipitacao NUMBER(5, 2), -- Precipitação com precisão
    fazenda_id NUMBER,
    primary key (id),
    FOREIGN KEY (fazenda_id) REFERENCES Fazenda(id)
);

-- Referencia
CREATE TABLE Colheita (
    id NUMBER not null auto_increment,
    nome VARCHAR2(255),
    tipo VARCHAR2(50),
    estacao_do_ano VARCHAR2(50),
    fazenda_id NUMBER,
    -- Primary key
    primary key(id),
    -- Sem constraint
    FOREIGN KEY (fazenda_id) REFERENCES Fazenda(id)
);