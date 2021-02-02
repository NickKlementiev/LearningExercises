create database dblab;

use dblab;

create table Professores (
	CodProf integer primary key,
    NomeProf varchar(40) not null,
    Cpf char(11) unique,
    AreaProf varchar(12),
    Carga integer
);

create table Disciplinas (
	CodDisc char(6) primary key,
    NomeDisc varchar(40) not null,
    CodProf integer
);

insert into Professores values
	(1, "Lucas", '11122244455', "BIOLOGICAS", 20),
    (2, "Maria", '44466677788', "EXATAS", 10),
    (3, "Jonas", '11144455532', "HUMANAS", 15),
    (4, "Ana", '99900077745', "EXATAS", 20),
    (5, "Samuel", '45663265462', "EXATAS", 14);
    
insert into Disciplinas values
	('190-E', "Ingles", 3),
    ('222-R', "Frances", 3),
    ('234-H', "Fisica", 5),
    ('432-I', "Matematica", 5),
    ('444-A', "Banco de Dados", 4),
    ('673-B', "Biologia", 1),
    ('876-X', "Fisiologia", 1),
    ('887-W', "Java", 4),
    ('908-X', "Eletricidade", 2);
    
    
select D.CodDisc, D.NomeDisc, P.CodProf, P.NomeProf, P.Cpf, P.AreaProf, P.Carga
from Professores P, Disciplinas D
where P.CodProf = D.CodProf
order by P.CodProf;

alter table Disciplinas
add constraint fk_CodProf foreign key(CodProf)
references Professores(CodProf) on delete no action on update no action;

alter table Professores
add constraint ck_Carga check (Carga >= 10);

alter table Professores
add constraint ck_Area check (AreaProf in ('EXATAS', 'HUMANAS', 'BIOLOGICAS'));

insert into Professores values
	(5, "Luciana", '35646637677', "EXATAS", 12);

insert into Professores values
	(6, "Lourdes", '77777777889', "HUMANAS", 8);

insert into Professores values
	(7, "Sergio", '55555554442', 'TI', 12);

delete from Professores where CodProf = 1;

delete from Disciplinas where CodProf = 1;

