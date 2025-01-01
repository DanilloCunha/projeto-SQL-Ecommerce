-- criação do banco de dados para o cenario e-commerce 
-- DROP database ecommerce;
create database ecommerce;
use ecommerce;

-- Tabela Cliente
CREATE TABLE Cliente (
    idCliente INT auto_increment PRIMARY KEY,
    PNome VARCHAR(10),
    NmeioInicial CHAR(3),
    Sobrenome VARCHAR(25),
    cpf CHAR(11) not null UNIQUE,
    endereco VARCHAR(30),
    data_nascimento DATE,
    clientecol VARCHAR(45),
    Tipo ENUM('PJ', 'PF')
);

-- Tabela Pedido
CREATE TABLE Pedido (
    idPedido INT auto_increment primary KEY,
    status_pedido ENUM('Pendente', 'Concluído', 'Cancelado')not null,
    descricao VARCHAR(445),
    Cliente_idCliente INT,
    frete FLOAT,
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente)
);

-- Tabela Produto
CREATE TABLE Produto (
    idProduto INT auto_increment primary KEY,
    Pname varchar(10),
    classification_kids bool,
    categoria enum ('Eletronico', 'brinquedos', 'roupa', 'Alimentos', 'Móveis') ,
    descricao VARCHAR(45),
    valor DECIMAL(10, 2),
    avaliação float default 0,
    size varchar (10),
    relacao_produto_servico VARCHAR(45)
);

-- Tabela Fornecedor
CREATE TABLE Fornecedor (
    idFornecedor INT PRIMARY KEY,
    razao_social VARCHAR(45),
    CNPJ CHAR(15) not null UNIQUE,
    contato varchar (11) not null
);

-- Tabela Disponibilizando_Produto
CREATE TABLE Disponibilizando_Produto (
    Fornecedor_idFornecedor INT,
    Produto_idProduto INT,
    PRIMARY KEY (Fornecedor_idFornecedor, Produto_idProduto),
    FOREIGN KEY (Fornecedor_idFornecedor) REFERENCES Fornecedor(idFornecedor),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
);

-- Tabela Estoque
CREATE TABLE Estoque (
    idEstoque INT PRIMARY KEY,
    local VARCHAR(45),
    quantity int default 0
);

-- Tabela Produto_has_Estoque
CREATE TABLE Produto_has_Estoque (
    Produto_idProduto INT,
    Estoque_idEstoque INT,
    quantidade INT,
    PRIMARY KEY (Produto_idProduto, Estoque_idEstoque),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto),
    FOREIGN KEY (Estoque_idEstoque) REFERENCES Estoque(idEstoque)
);

-- Tabela Relacao_Produto_Pedido
CREATE TABLE Relacao_Produto_Pedido (
    Produto_idProduto INT,
    Pedido_idPedido INT,
    quantidade INT,
    status ENUM('Pendente', 'Em processo', 'Entregue'),
    PRIMARY KEY (Produto_idProduto, Pedido_idPedido),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto),
    FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido)
);

-- Tabela Terceiro_Vendedor
CREATE TABLE Terceiro_Vendedor (
    idTerceiro_Vendedor INT PRIMARY KEY,
    razao_social VARCHAR(45),
    NomeFantasia varchar (45),
    local VARCHAR(45),
    CNPJ CHAR(15) UNIQUE,
    contato VARCHAR(15),
    cpf char(11),
    constraint unique_cnpj_seller unique (cnpj),
    constraint unique_cpf_seller unique (cpf)
);

-- Tabela Produtos_por_Vendedor
CREATE TABLE Produtos_por_Vendedor (
    Terceiro_Vendedor_idTerceiro_Vendedor INT,
    Produto_idProduto INT,
    quantidade INT,
    PRIMARY KEY (Terceiro_Vendedor_idTerceiro_Vendedor, Produto_idProduto),
    FOREIGN KEY (Terceiro_Vendedor_idTerceiro_Vendedor) REFERENCES Terceiro_Vendedor(idTerceiro_Vendedor),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
);

-- Tabela Pagamento
CREATE TABLE Pagamento (
    Cliente_idCliente INT,
    Pedido_idPedido INT,
    metodo_pagamento enum('Boleto', 'cartão', 'dois cartões'),
    limitAvailable float
    PRIMARY KEY (Cliente_idCliente, Pedido_idPedido),
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido)
);

-- Tabela Entrega
CREATE TABLE Entrega (
    idEntrega INT PRIMARY KEY,
    Pedido_idPedido INT,
    status_entrega VARCHAR(45),
    codigo_rastreio VARCHAR(45),
    FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido)
);
show tables;

show databases;
 