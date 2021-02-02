create database if not exists faculdade;

use faculdade;

create table if not exists Curso (
	CodCurso integer not null unique auto_increment,
    NomeCurso varchar(30),
    TipoCurso varchar(15),
    CargaHoraria integer,
    CodInstituto integer not null,
    primary key (CodCurso)
);

create table if not exists Disciplina (
	CodDisc integer not null unique auto_increment,
    NomeDisc varchar(30),
    CargaHoraria integer,
    AulasSemana integer,
    IdentProf integer,
    CodCurso integer,
    primary key (CodDisc)
);

create table if not exists Professor (
	IdentProf integer not null unique,
    NomeProf varchar(30),
    DataNasc date,
    EspecProf varchar(30),
    TituloProf varchar(30),
    primary key (IdentProf)
);

create table if not exists EndProf (
	IdentProf integer not null unique,
    Rua varchar(30),
    Numero integer,
    Bairro varchar(15),
    Cidade varchar(15),
    Estado char(2),
    Telfixo varchar(15),
    Celular varchar(15)
);

create table if not exists Aluno (
	Matricula integer not null unique,
    Nome varchar(30),
    DataNasc date,
    CodCurso integer,
    CodDisc integer,
    NP1 double,
    NP2 double,
    Media double,
    Faltas integer,
    primary key (Matricula)
);

insert into Curso (NomeCurso, TipoCurso, CargaHoraria, CodInstituto) values (
    "Ciência da Computação",
    "Bacharelado",
    4,
    1
);

insert into Curso (NomeCurso, TipoCurso, CargaHoraria, CodInstituto) values (
    "Direito",
    "Bacharelado",
    4,
    2
);

insert into Curso (NomeCurso, TipoCurso, CargaHoraria, CodInstituto) values (
    "Administração",
    "Mestrado",
    4,
    2
);

insert into Curso (NomeCurso, TipoCurso, CargaHoraria, CodInstituto) values (
    "Medicina",
    "Bacharelado",
    5,
    3
);

insert into Curso (NomeCurso, TipoCurso, CargaHoraria, CodInstituto) values (
    "Educação Física",
    "Licenciatura",
    3,
    3
);

insert into Disciplina (NomeDisc, CargaHoraria, AulasSemana, IdentProf, CodCurso) values (
    "Matemática",
    6,
    3,
    2,
    1
);

insert into Disciplina (NomeDisc, CargaHoraria, AulasSemana, IdentProf, CodCurso) values (
    "Programação",
    6,
    3,
    1,
    1
);

insert into Disciplina (NomeDisc, CargaHoraria, AulasSemana, IdentProf, CodCurso) values (
    "Sociologia",
    5,
    2,
    5,
    2
);

insert into Disciplina (NomeDisc, CargaHoraria, AulasSemana, IdentProf, CodCurso) values (
    "História",
    5,
    2,
    5,
    2
);

insert into Disciplina (NomeDisc, CargaHoraria, AulasSemana, IdentProf, CodCurso) values (
    "Economia",
    6,
    3,
    4,
    3
);

insert into Disciplina (NomeDisc, CargaHoraria, AulasSemana, IdentProf, CodCurso) values (
    "Finanças",
    4,
    1,
    2,
    3
);

insert into Disciplina (NomeDisc, CargaHoraria, AulasSemana, IdentProf, CodCurso) values (
    "Anatomia",
    5,
    2,
    3,
    4
);

insert into Disciplina (NomeDisc, CargaHoraria, AulasSemana, IdentProf, CodCurso) values (
    "Patogenia",
    5,
    2,
    3,
    4
);

insert into Disciplina (NomeDisc, CargaHoraria, AulasSemana, IdentProf, CodCurso) values (
	"Química",
    5,
    2,
    3,
    5
);

insert into Disciplina (NomeDisc, CargaHoraria, AulasSemana, IdentProf, CodCurso) values (
	"Fisiologia",
    5,
    2,
    3,
    5
);

insert into Professor values (
	1,
    "Lauro",
    "1987-09-23",
    "Programação",
    "Mestrado"
);

insert into Professor values (
	2,
    "Ricardo",
    "1978-11-01",
    "Matemática",
    "Doutorado"
);

insert into Professor values (
	3,
    "Marcelo",
    "1989-03-20",
    "Biologia",
    "Mestrado"
);

insert into Professor values (
	4,
    "Rafael",
    "1965-06-30",
    "Economia",
    "Mestrado"
);

insert into Professor values (
	5,
    "Victor",
    "1982-02-20",
    "Sociais",
    "Doutorado"
);

insert into EndProf values (
	1,
    "Menezes",
    102,
    "Alphabeta",
    "São Paulo",
    'SP',
    "12345678",
    "921346578"
);

insert into EndProf values (
	2,
    "Cubas",
    409,
    "Menestréis",
    "São Paulo",
    'SP',
    "34127856",
    "943128756"
);

insert into EndProf values (
	3,
    "Araras",
    47,
    "Aves",
    "Sorocaba",
    'SP',
    "56781234",
    "965782134"
);

insert into EndProf values (
	4,
    "Vitória",
    316,
    "Vila João",
    "Monte Verde",
    'MG',
    "12785634",
    "921786534"
);

insert into EndProf values (
	5,
    "Jabaquara",
    1043,
    "Soberba",
    "Joinville",
    'RS',
    "18724365",
    "981723465"
);

insert into Aluno values (
	1,
    "João",
    "1999-05-12",
    2,
    3,
    7.0,
    8.0,
    (7.0 + 8.0) / 2,
    3
);

insert into Aluno values (
	2,
    "Pedro",
    "1995-07-22",
    3,
    6,
    5.0,
    4.0,
    (5.0 + 4.0) / 2,
    5
);

insert into Aluno values (
	3,
    "Carlos",
    "1997-01-14",
    1,
    2,
    6.0,
    7.0,
    (6.0 + 7.0) / 2,
    2
);

insert into Aluno values (
	4,
	"Marcos",
    "2000-04-20",
    4,
    7,
    9.0,
    8.0,
    (9.0 + 8.0) / 2,
    1
);

insert into Aluno values (
	5,
    "Maria",
    "1999-08-05",
    5,
    1,
    3.0,
    9.5,
    (3.0 + 9.5) / 2,
    4
);

insert into Aluno values (
	6,
    "Gabriel",
    "1998-11-10",
    1,
    2,
    5.0,
    5.0,
    (5.0 + 5.0) / 2,
    6
);

select * from Curso;

select * from Disciplina;

select * from Professor P, EndProf E where P.IdentProf = E.IdentProf;

select P.IdentProf, P.NomeProf, P.EspecProf, E.Rua, E.Numero, E.Bairro, E.Cidade, E.Estado, D.NomeDisc, C.NomeCurso
from Professor P, EndProf E, Disciplina D, Curso C
where P.IdentProf = E.IdentProf and P.IdentProf = D.IdentProf and D.CodCurso = C.CodCurso
order by P.IdentProf;

select A.Matricula, A.Nome, A.DataNasc, A.CodCurso, C.NomeCurso, A.CodDisc, D.NomeDisc, A.NP1, A.NP2, A.Media, A.Faltas
from Aluno A, Curso C, Disciplina D
where A.CodCurso = C.CodCurso and A.CodDisc = D.CodDisc
order by A.Matricula;

update Aluno set Matricula = 7, Nome = "Josney", DataNasc = "1999-08-29", NP1 = 6.5, CodCurso = 3, CodDisc = 6 where Matricula = 6;

delete from Curso where CodCurso > 5;