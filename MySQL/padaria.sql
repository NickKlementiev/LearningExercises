create database if not exists padaria;

/*drop database padaria;*/

use padaria;

CREATE TABLE IF NOT EXISTS Clientes (
    id INTEGER NOT NULL,
    entrada TIME,
    saida TIME,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Fabricante (
    id INTEGER NOT NULL,
    cnpj INTEGER UNIQUE,
    nome VARCHAR(30),
    rua VARCHAR(20),
    bairro VARCHAR(20),
    cep INTEGER,
    unidade VARCHAR(20),
    especializacao VARCHAR(30),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Vendas (
    n_pedido INTEGER NOT NULL,
    cod_produto INTEGER UNIQUE,
    quantidade integer,
    PRIMARY KEY (n_pedido)
);


CREATE TABLE IF NOT EXISTS Estoque (
    id INTEGER NOT NULL,
    secao VARCHAR(30),
    categoria VARCHAR(20),
    quantidade INTEGER,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Funcionário (
    id INTEGER NOT NULL,
    cliente_id INTEGER,
    cpf VARCHAR(20) UNIQUE,
    especializacao VARCHAR(20),
    nome VARCHAR(30),
    rua VARCHAR(20),
    bairro VARCHAR(20),
    cep VARCHAR(20),
    PRIMARY KEY (id),
    FOREIGN KEY (cliente_id)
        REFERENCES Clientes (id)
);

CREATE TABLE IF NOT EXISTS Produto (
    cod_produto INTEGER NOT NULL,
    fabricante_id INTEGER,
    estoque_id INTEGER,
    cliente_id INTEGER,
    fabricante_cnpj INTEGER,
    nome_produto VARCHAR(20),
    valor_produto DOUBLE,
    PRIMARY KEY (cod_produto),
    FOREIGN KEY (fabricante_id)
        REFERENCES Fabricante (id),
    FOREIGN KEY (estoque_id)
        REFERENCES Estoque (id),
    FOREIGN KEY (cliente_id)
        REFERENCES Clientes (id),
    FOREIGN KEY (fabricante_cnpj)
        REFERENCES Fabricante (cnpj)
);

CREATE TABLE IF NOT EXISTS Funcionário_Produto (
funcionario_cliente_id integer,
funcionario_id integer,
produto_fabricante_cnpj integer,
produto_cliente_id integer,
produto_estoque_id integer,
produto_fabricante_id integer,
produto_cod_produto integer,
primary key (funcionario_id, produto_cod_produto),
foreign key (funcionario_cliente_id) references Funcionário (cliente_id),
foreign key (funcionario_id) references Funcionário (id),
foreign key (produto_fabricante_cnpj) references Produto (fabricante_cnpj),
foreign key (produto_cliente_id) references Produto (cliente_id),
foreign key (produto_estoque_id) references Produto (estoque_id),
foreign key (produto_fabricante_id) references Produto (fabricante_id),
foreign key (produto_cod_produto) references Produto (cod_produto)
);

CREATE TABLE IF NOT EXISTS Produto_Vendas (
    produto_cliente_id INTEGER NOT NULL,
    produto_estoque_id INTEGER,
    produto_fabricante_id INTEGER,
    vendas_n_pedido INTEGER,
    produto_cod_produto INTEGER,
    produto_fabricante_cnpj INTEGER,
    produto_FP_funcionario_cliente_id INTEGER,
    produto_FP_funcionario_id INTEGER,
    vendas_cod_produto INTEGER,
    PRIMARY KEY (vendas_n_pedido , vendas_cod_produto),
    FOREIGN KEY (produto_cliente_id)
        REFERENCES Produto (cliente_id),
    FOREIGN KEY (produto_estoque_id)
        REFERENCES Produto (estoque_id),
    FOREIGN KEY (produto_fabricante_id)
        REFERENCES Produto (fabricante_id),
    FOREIGN KEY (vendas_n_pedido)
        REFERENCES Vendas (n_pedido),
    FOREIGN KEY (produto_cod_produto)
        REFERENCES Produto (cod_produto),
    FOREIGN KEY (produto_fabricante_cnpj)
        REFERENCES Produto (fabricante_cnpj),
    FOREIGN KEY (vendas_cod_produto)
        REFERENCES Vendas (cod_produto)
);

insert into Clientes values 
('1', '07:20', '07:40'),
('2', '09:30', '10:00');

insert into Estoque values
('1','SecaoA','CategoriaA','8'),
('2','SecaoB','CategoriaB','5');

insert into Fabricante values
('1','054321','NomeA','RuaA','BairroA','05432155','UnidadeA','EspecializacaoA'),
('2','012345','NomeB','RuaB','BairroB','01234511','UnidadeB','EspecializacaoB');

insert into Funcionário values
('1','1', '123.456.789-00','EspecializacaoA','NomeA','RuaA','BairroA','04923410'),
('2','2', '098.765.432-11','EspecializacaoB','NomeB','RuaB','BairroB','12321423');

insert into Vendas values
('1','1','50'),
('2','2','30');

insert into Produto values
('1','1','1','1','054321','Chocolate','5.00'),
('2','2','2','2','012345','Pão','2.00');

select * from Produto;

/*INICIO DAS QUERYS*/

Select p.nome_produto as NomeDoProduto, p.estoque_id EstoqueID, p.fabricante_id as FabricanteID, p.cod_produto as CodigoDoProduto, f.nome as NomeDoFuncionario, f.id FuncionarioID, e.id as EstoqueID, e.quantidade as Quantidade
from Produto p, Estoque e, Fabricante f
where p.fabricante_id = f.id
and p.estoque_id = e.id;

Select c.id as ClienteID, c.entrada as HorarioEntrada, c.saida as HorarioSaida, p.nome_produto as NomeDoProduto, p.cod_produto as CodigoDoProduto, p.valor_produto as ValorDoProduto, f.id as FuncionarioID, f.nome as NomeDoFuncionario, v.quantidade * p.valor_produto as TotalGasto
from Produto p, Clientes c, Funcionário f, Vendas v
where p.cliente_id = c.id
and f.cliente_id = c.id
and v.cod_produto = p.cod_produto;

