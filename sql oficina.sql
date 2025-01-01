-- criação banco de dados para cenario oficina

create database oficina ; 
use oficina;


-- Table para Oficina

CREATE TABLE Mecânicos (
    idMecânicos INT PRIMARY KEY,
    Nome VARCHAR(45),
    Endereço VARCHAR(45),
    Especialidade VARCHAR(45)
);

-- Table for Clients
CREATE TABLE Clientes (
    idClientes INT PRIMARY KEY,
    Nome VARCHAR(45),
    Telefone VARCHAR(20),
    Endereço VARCHAR(45)
);

-- Table for Vehicles
CREATE TABLE Veículos (
    idVeículos INT PRIMARY KEY,
    Placa VARCHAR(45),
    Marca VARCHAR(45),
    Modelo VARCHAR(45),
    Ano INT(4),
    Código_Cliente INT,
    FOREIGN KEY (Código_Cliente) REFERENCES Clientes(idClientes)
);

-- Table for Labor Costs
CREATE TABLE tabela_mão_obra (
    idtabela_mão_obra INT PRIMARY KEY,
    Descrição_serviço VARCHAR(45),
    Valor_serviço DECIMAL(10,2)
);

-- Table for Parts
CREATE TABLE Peças (
    idPeças INT PRIMARY KEY,
    Nome_Peça VARCHAR(45),
    Valor_Peça DECIMAL(10,2),
    Estoque INT
);

-- Table for Service Orders
CREATE TABLE Ordem_de_Serviço (
    idOrdem_de_Serviço INT PRIMARY KEY,
    Data_Emissão DATE,
    Status VARCHAR(45),
    Placa_Veículo VARCHAR(10),
    Código_Cliente INT,
    FOREIGN KEY (Código_Cliente) REFERENCES Clientes(idClientes)
);

-- Junction Table for Mechanics and Service Orders
CREATE TABLE Mecânicos_has_Ordem_de_Serviço (
    Mecânicos_idMecânicos INT,
    Mecânicos_Ordem_de_Serviço_idOrdem_de_Serviço INT,
    FOREIGN KEY (Mecânicos_idMecânicos) REFERENCES Mecânicos(idMecânicos),
    FOREIGN KEY (Mecânicos_Ordem_de_Serviço_idOrdem_de_Serviço) REFERENCES Ordem_de_Serviço(idOrdem_de_Serviço)
);

-- Junction Table for Parts and Service Orders
CREATE TABLE Peças_has_Ordem_de_Serviço (
    Peças_idPeças INT,
    Peças_Ordem_de_Serviço_idOrdem_de_Serviço INT,
    FOREIGN KEY (Peças_idPeças) REFERENCES Peças(idPeças),
    FOREIGN KEY (Peças_Ordem_de_Serviço_idOrdem_de_Serviço) REFERENCES Ordem_de_Serviço(idOrdem_de_Serviço)
);

-- Junction Table for Labor Costs and Service Orders
CREATE TABLE tabela_mão_obra_has_Ordem_de_Serviço (
    tabela_mão_obra_idtabela_mão_obra INT,
    tabela_mão_obra_Ordem_de_Serviço_idOrdem_de_Serviço INT,
    FOREIGN KEY (tabela_mão_obra_idtabela_mão_obra) REFERENCES tabela_mão_obra(idtabela_mão_obra),
    FOREIGN KEY (tabela_mão_obra_Ordem_de_Serviço_idOrdem_de_Serviço) REFERENCES Ordem_de_Serviço(idOrdem_de_Serviço)
);

show databases;
