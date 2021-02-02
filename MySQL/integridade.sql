create database integridade;
use integridade;

create table funcionario
(
    funcionario_id integer primary key,
    nome varchar(30) not null,
    cpf char(11) unique,
    salario float check (salario >= 1000),
    comissao float null,
    data_contr date default getdate()
);

insert into funcionario values
(1, 'Alan', '12345678912', 1200.15, NULL, '2020-03-12');

select * from funcionario;
