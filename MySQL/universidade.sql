create database if not exists universidade;

use universidade;

-- ETAPA 1: MODELAGEM DO BANCO DE DADOS E SCRIPT DE CRIAÇÃO DO BANCO DE DADOS

create table if not exists Instituto (
	CodInsti integer not null auto_increment,
	NomeInsti varchar(30),
	AreaInsti varchar(20),
	primary key(CodInsti)
);

create table if not exists EndInsti (
	CodInsti integer,
    Rua varchar(20),
    Numero integer,
    Bairro varchar(20),
    Cidade varchar(20),
    Estado char(2),
	foreign key(CodInsti) references Instituto(CodInsti)
);

create table if not exists Curso (
	CodCurso integer not null auto_increment,
	NomeCurso varchar(30),
	TipoCurso varchar(20),
	CargaHoraria integer not null,
	CodInsti integer,
	primary key(CodCurso),
    foreign key(CodInsti) references Instituto(CodInsti)
);

create table if not exists Disciplina (
	CodDisc integer not null auto_increment,
	NomeDisc varchar(30),
	CargaHoraria integer not null,
	AulasSemana integer not null,
	CodCurso integer,
	primary key(CodDisc),
	foreign key(CodCurso) references Curso(CodCurso)
);

create table if not exists Professor (
	CodProf integer not null auto_increment,
	NomeProf varchar(20),
	EspecProf varchar(20),
	TituloProf varchar(20),
	primary key(CodProf)
);

create table if not exists EndProf (
	CodProf integer,
    Rua varchar(20),
    Numero integer,
    Bairro varchar(20),
    Cidade varchar(20),
    Estado char(2),
    Telefone bigint,
    foreign key(CodProf) references Professor(CodProf)
);

create table if not exists CursoProfessor (
    CodCurso integer,
    CodProf integer,
    foreign key(CodCurso) references Curso(CodCurso),
    foreign key(CodProf) references Professor(CodProf)
);

create table if not exists DisciplinaProfessor (
	CodDisc integer,
    CodProf integer,
    foreign key(CodDisc) references Disciplina(CodDisc),
    foreign key(CodProf) references Professor(CodProf)
);

create table if not exists Funcionario (
	CodFunci integer not null auto_increment,
    NomeFunci varchar(20),
    EspecFunci varchar(20),
    CodInsti integer,
    primary key(CodFunci),
    foreign key(CodInsti) references Instituto(CodInsti)
);

create table if not exists EndFunci (
	CodFunci integer,
    Rua varchar(20),
    Numero integer,
    Bairro varchar(20),
    Cidade varchar(20),
    Estado char(2),
    Telefone bigint,
    foreign key(CodFunci) references Funcionario(CodFunci)
);

create table if not exists Aluno (
	MatAluno integer not null auto_increment,
    NomeAluno varchar(20),
    NascAluno date,
    NP1 double,
    NP2 double,
    Media double,
    Faltas integer,
    CodCurso integer,
    CodInsti integer,
    primary key(MatAluno),
    foreign key(CodCurso) references Curso(CodCurso),
    foreign key(CodInsti) references Instituto(CodInsti)
);

create table if not exists EndAluno (
	MatAluno integer,
    Rua varchar(20),
    Numero integer,
    Bairro varchar(20),
    Cidade varchar(20),
    Estado char(2),
    Telefone bigint,
    foreign key(MatAluno) references Aluno(MatAluno)
);

insert into Instituto (NomeInsti, AreaInsti) values (
	"Instituto de Computação",
    "Tecnologia"
);

insert into Instituto (NomeInsti, AreaInsti) values (
	"Instituto de Medicina",
    "Biologia"
);

insert into Instituto (NomeInsti, AreaInsti) values (
	"Instituto de História",
    "Humanas"
);

insert into Curso (NomeCurso, TipoCurso, CargaHoraria, CodInsti) select
	"Ciência da Computação",
    "Bacharelado",
    4,
    CodInsti from Instituto
    where NomeInsti = "Instituto de Computação";
    
insert into Curso (NomeCurso, TipoCurso, CargaHoraria, CodInsti) select
	"Sistemas de Informação",
    "Bacharelado",
    4,
    CodInsti from Instituto
    where NomeInsti = "Instituto de Computação";
    
insert into Curso (NomeCurso, TipoCurso, CargaHoraria, CodInsti) select
	"Medicina",
    "Bacharelado",
    5,
    CodInsti from Instituto
    where NomeInsti = "Instituto de Medicina";
    
insert into Curso (NomeCurso, TipoCurso, CargaHoraria, CodInsti) select
	"Enfermagem",
    "Técnico",
    4,
    CodInsti from Instituto
    where NomeInsti = "Instituto de Medicina";
    
insert into Curso (NomeCurso, TipoCurso, CargaHoraria, CodInsti) select
	"Sociologia",
    "Mestrado",
    1,
    CodInsti from Instituto
    where NomeInsti = "Instituto de História";

insert into Curso (NomeCurso, TipoCurso, CargaHoraria, CodInsti) select
	"Arqueologia",
    "Bacharelado",
    4,
    CodInsti from Instituto
    where NomeInsti = "Instituto de História";

insert into Disciplina (NomeDisc, CargaHoraria, AulasSemana, CodCurso) select
	"Banco de Dados",
    5,
    2,
    CodCurso from Curso
    where NomeCurso = "Ciência da Computação";
    
insert into Disciplina (NomeDisc, CargaHoraria, AulasSemana, CodCurso) select
	"Circuitos Digitais",
    6,
    3,
    CodCurso from Curso
    where NomeCurso = "Ciência da Computação";
    
insert into Disciplina (NomeDisc, CargaHoraria, AulasSemana, CodCurso) select
	"Estatística",
    4,
    1,
    CodCurso from Curso
    where NomeCurso = "Sistemas de Informação";
    
insert into Disciplina (NomeDisc, CargaHoraria, AulasSemana, CodCurso) select
	"Lógica de Programação",
    5,
    2,
    CodCurso from Curso
    where NomeCurso = "Sistemas de Informação";
    
insert into Disciplina (NomeDisc, CargaHoraria, AulasSemana, CodCurso) select
	"Anatomia",
    6,
    2,
    CodCurso from Curso
    where NomeCurso = "Medicina";
    
insert into Disciplina (NomeDisc, CargaHoraria, AulasSemana, CodCurso) select
	"Patologia",
    5,
    1,
    CodCurso from Curso
    where NomeCurso = "Medicina";
    
insert into Disciplina (NomeDisc, CargaHoraria, AulasSemana, CodCurso) select
	"Primeiros Socorros",
    6,
    3,
    CodCurso from Curso
    where NomeCurso = "Enfermagem";
    
insert into Disciplina (NomeDisc, CargaHoraria, AulasSemana, CodCurso) select
	"Química",
    4,
    1,
    CodCurso from Curso
    where NomeCurso = "Enfermagem";
    
insert into Disciplina (NomeDisc, CargaHoraria, AulasSemana, CodCurso) select
	"Homem e Sociedade",
    5,
    2,
    CodCurso from Curso
    where NomeCurso = "Sociologia";
    
insert into Disciplina (NomeDisc, CargaHoraria, AulasSemana, CodCurso) select
	"Revoluções Industriais",
    4,
    1,
    CodCurso from Curso
    where NomeCurso = "Sociologia";

insert into Disciplina (NomeDisc, CargaHoraria, AulasSemana, CodCurso) select
	"Relevos",
    5,
    2,
    CodCurso from Curso
    where NomeCurso = "Arqueologia";

insert into Disciplina (NomeDisc, CargaHoraria, AulasSemana, CodCurso) select
	"Geologia",
    6,
    3,
    CodCurso from Curso
    where NomeCurso = "Arqueologia";
    
insert into Professor (NomeProf, EspecProf, TituloProf) values (
	"Lauro",
    "Informáticas",
    "Mestrado"
);

insert into EndProf (CodProf, Rua, Numero, Bairro, Cidade, Estado, Telefone) select
	CodProf,
    "Braz Leme",
    765,
    "Maravilhas",
    "São Paulo",
    'SP',
    912345678
    from Professor where NomeProf = "Lauro";
    
insert into Professor (NomeProf, EspecProf, TituloProf) values (
	"Machado",
    "Exatas",
    "Doutorado"
);

insert into EndProf (CodProf, Rua, Numero, Bairro, Cidade, Estado, Telefone) select
	CodProf,
    "Andorinha",
    365,
    "Alto de Parnaíba",
    "São Paulo",
    'SP',
    998765432
    from Professor where NomeProf = "Machado";
    
insert into Professor (NomeProf, EspecProf, TituloProf) values (
	"Reginaldo",
    "Biológicas",
    "Pós-graduação"
);

insert into EndProf (CodProf, Rua, Numero, Bairro, Cidade, Estado, Telefone) select
	CodProf,
    "Pelegrino",
    987,
    "Vila Guilherme",
    "São Paulo",
    'SP',
    956768345
    from Professor where NomeProf = "Reginaldo";
    
insert into Professor (NomeProf, EspecProf, TituloProf) values (
	"Marcelo",
    "Biológicas",
    "Pós-doutorado"
);

insert into EndProf (CodProf, Rua, Numero, Bairro, Cidade, Estado, Telefone) select
	CodProf,
    "Sabiá",
    4677,
    "Laranjais",
    "Cantareira",
    'SP',
    912358343
    from Professor where NomeProf = "Marcelo";
    
insert into Professor (NomeProf, EspecProf, TituloProf) values (
	"Victor",
    "Humanas",
    "Mestrado"
);

insert into EndProf (CodProf, Rua, Numero, Bairro, Cidade, Estado, Telefone) select
	CodProf,
    "Benevolente",
    1235,
    "Jabaquara",
    "São Paulo",
    'SP',
    998786342
    from Professor where NomeProf = "Victor";

insert into Professor (NomeProf, EspecProf, TituloProf) values (
	"Augusto",
    "Humanas",
    "Doutorado"
);

insert into EndProf (CodProf, Rua, Numero, Bairro, Cidade, Estado, Telefone) select
	CodProf,
    "Paulista",
    998,
    "Quilombolas",
    "São Paulo",
    'SP',
    956837824
    from Professor where NomeProf = "Augusto";
    
insert into CursoProfessor (CodCurso, CodProf) select
	CodCurso,
    CodProf
    from Curso, Professor where
    NomeCurso = "Ciência da Computação" and
    NomeProf = "Lauro";

insert into CursoProfessor (CodCurso, CodProf) select
	CodCurso,
    CodProf
    from Curso, Professor where
    NomeCurso = "Sistemas de Informação" and
    NomeProf = "Lauro";
    
insert into CursoProfessor (CodCurso, CodProf) select
	CodCurso,
    CodProf
    from Curso, Professor where
    NomeCurso = "Ciência da Computação" and
    NomeProf = "Machado";
    
insert into CursoProfessor (CodCurso, CodProf) select
	CodCurso,
    CodProf
    from Curso, Professor where
    NomeCurso = "Sistemas de Informação" and
    NomeProf = "Machado";
    
insert into CursoProfessor (CodCurso, CodProf) select
	CodCurso,
    CodProf
    from Curso, Professor where
    NomeCurso = "Enfermagem" and
    NomeProf = "Reginaldo";
    
insert into CursoProfessor (CodCurso, CodProf) select
	CodCurso,
    CodProf
    from Curso, Professor where
    NomeCurso = "Medicina" and
    NomeProf = "Marcelo";
    
insert into CursoProfessor (CodCurso, CodProf) select
	CodCurso,
    CodProf
    from Curso, Professor where
    NomeCurso = "Sociologia" and
    NomeProf = "Victor";
    
insert into CursoProfessor (CodCurso, CodProf) select
	CodCurso,
    CodProf
    from Curso, Professor where
    NomeCurso = "Arqueologia" and
    NomeProf = "Victor";
    
insert into CursoProfessor (CodCurso, CodProf) select
	CodCurso,
    CodProf
    from Curso, Professor where
    NomeCurso = "Sociologia" and
    NomeProf = "Augusto";

insert into DisciplinaProfessor (CodDisc, CodProf) select
	CodDisc,
    CodProf
    from Disciplina, Professor where
    NomeDisc = "Banco de Dados" and
    NomeProf = "Lauro";
    
insert into DisciplinaProfessor (CodDisc, CodProf) select
	CodDisc,
    CodProf
    from Disciplina, Professor where
    NomeDisc = "Circuitos Digitais" and
    NomeProf = "Lauro";

insert into DisciplinaProfessor (CodDisc, CodProf) select
	CodDisc,
    CodProf
    from Disciplina, Professor where
    NomeDisc = "Circuitos Digitais" and
    NomeProf = "Machado";
    
insert into DisciplinaProfessor (CodDisc, CodProf) select
	CodDisc,
    CodProf
    from Disciplina, Professor where
    NomeDisc = "Lógica de Programação" and
    NomeProf = "Lauro";
    
insert into DisciplinaProfessor (CodDisc, CodProf) select
	CodDisc,
    CodProf
    from Disciplina, Professor where
    NomeDisc = "Estatística" and
    NomeProf = "Machado";
    
insert into DisciplinaProfessor (CodDisc, CodProf) select
	CodDisc,
    CodProf
    from Disciplina, Professor where
    NomeDisc = "Anatomia" and
    NomeProf = "Marcelo";
    
insert into DisciplinaProfessor (CodDisc, CodProf) select
	CodDisc,
    CodProf
    from Disciplina, Professor where
    NomeDisc = "Patologia" and
    NomeProf = "Marcelo";
    
insert into DisciplinaProfessor (CodDisc, CodProf) select
	CodDisc,
    CodProf
    from Disciplina, Professor where
    NomeDisc = "Primeiros Socorros" and
    NomeProf = "Reginaldo";
    
insert into DisciplinaProfessor (CodDisc, CodProf) select
	CodDisc,
    CodProf
    from Disciplina, Professor where
    NomeDisc = "Química" and
    NomeProf = "Reginaldo";

insert into DisciplinaProfessor (CodDisc, CodProf) select
	CodDisc,
    CodProf
    from Disciplina, Professor where
    NomeDisc = "Homem e Sociedade" and
    NomeProf = "Victor";
    
insert into DisciplinaProfessor (CodDisc, CodProf) select
	CodDisc,
    CodProf
    from Disciplina, Professor where
    NomeDisc = "Revoluções Industriais" and
    NomeProf = "Victor";
    
insert into DisciplinaProfessor (CodDisc, CodProf) select
	CodDisc,
    CodProf
    from Disciplina, Professor where
    NomeDisc = "Homem e Sociedade" and
    NomeProf = "Augusto";
    
insert into DisciplinaProfessor (CodDisc, CodProf) select
	CodDisc,
    CodProf
    from Disciplina, Professor where
    NomeDisc = "Geologia" and
    NomeProf = "Augusto";
    
insert into DisciplinaProfessor (CodDisc, CodProf) select
	CodDisc,
    CodProf
    from Disciplina, Professor where
    NomeDisc = "Relevo" and
    NomeProf = "Augusto";
    
insert into Funcionario (NomeFunci, EspecFunci, CodInsti) select
	"Fabiana",
    "Secretaria",
    CodInsti from Instituto where NomeInsti = "Instituto de Computação";

insert into EndFunci (CodFunci, Rua, Numero, Bairro, Cidade, Estado, Telefone) select
	CodFunci,
    "Gerônimo",
    7657,
    "Tabajaras",
    "Piracicaba",
    'SP',
    987464323
    from Funcionario where NomeFunci = "Fabiana";

insert into Funcionario (NomeFunci, EspecFunci, CodInsti) select
	"José",
    "Jardinagem",
    CodInsti from Instituto where NomeInsti = "Instituto de Medicina";
    
insert into EndFunci (CodFunci, Rua, Numero, Bairro, Cidade, Estado, Telefone) select
	CodFunci,
    "Marajoara",
    985,
    "Perdizes",
    "Itaquaquecetuba",
    'SP',
    943248974
    from Funcionario where NomeFunci = "José";
    
insert into Funcionario (NomeFunci, EspecFunci, CodInsti) select
	"Mário",
    "Biblioteca",
    CodInsti from Instituto where NomeInsti = "Instituto de História";
    
insert into EndFunci (CodFunci, Rua, Numero, Bairro, Cidade, Estado, Telefone) select
	CodFunci,
    "Bonício",
    2138,
    "Jundiaí",
    "Lauzane",
    'SP',
    944763822
    from Funcionario where NomeFunci = "Mário";

insert into Aluno (NomeAluno, NascAluno, NP1, NP2, Media, Faltas, CodCurso, CodInsti) select
	"Francisco",
    "1999-05-22",
    8.5,
    9.3,
    (8.5 + 9.3) / 2,
    3,
    C.CodCurso,
    C.CodInsti
    from Curso C where
    C.NomeCurso = "Ciência da Computação";

insert into EndAluno (MatAluno, Rua, Numero, Bairro, Cidade, Estado, Telefone) select
	MatAluno,
    "Merida",
    903,
    "Sacis",
    "São Paulo",
    'SP',
    984356678
    from Aluno where NomeAluno = "Francisco";
    
insert into Aluno (NomeAluno, NascAluno, NP1, NP2, Media, Faltas, CodCurso, CodInsti) select
	"Júnior",
    "1989-10-05",
    7.5,
    6.9,
    (7.5 + 6.9) / 2,
    7,
    C.CodCurso,
    C.CodInsti
    from Curso C where
    C.NomeCurso = "Sistemas de Informação";

insert into EndAluno (MatAluno, Rua, Numero, Bairro, Cidade, Estado, Telefone) select
	MatAluno,
    "Galápago",
    45,
    "Girardia",
    "São Paulo",
    'SP',
    999875432
    from Aluno where NomeAluno = "Júnior";
    
insert into Aluno (NomeAluno, NascAluno, NP1, NP2, Media, Faltas, CodCurso, CodInsti) select
	"Leonardo",
    "1998-11-17",
    9.0,
    8.75,
    (9.0 + 8.75) / 2,
    5,
    C.CodCurso,
    C.CodInsti
    from Curso C where
    C.NomeCurso = "Medicina";

insert into EndAluno (MatAluno, Rua, Numero, Bairro, Cidade, Estado, Telefone) select
	MatAluno,
    "Chaves",
    95,
    "Arvorada",
    "Vila Guaves",
    'SP',
    956879467
    from Aluno where NomeAluno = "Leonardo";
    
insert into Aluno (NomeAluno, NascAluno, NP1, NP2, Media, Faltas, CodCurso, CodInsti) select
	"Larissa",
    "1994-05-20",
    7.5,
    9.3,
    (7.5 + 9.3) / 2,
    6,
    C.CodCurso,
    C.CodInsti
    from Curso C where
    C.NomeCurso = "Enfermagem";

insert into EndAluno (MatAluno, Rua, Numero, Bairro, Cidade, Estado, Telefone) select
	MatAluno,
    "Boêmia",
    8091,
    "Farrapos",
    "São Paulo",
    'SP',
    948739843
    from Aluno where NomeAluno = "Larissa";

insert into Aluno (NomeAluno, NascAluno, NP1, NP2, Media, Faltas, CodCurso, CodInsti) select
	"Raimundo",
    "1995-08-02",
    7.0,
    6.5,
    (7.0 + 6.5) / 2,
    9,
    C.CodCurso,
    C.CodInsti
    from Curso C where
    C.NomeCurso = "Sociologia";

insert into EndAluno (MatAluno, Rua, Numero, Bairro, Cidade, Estado, Telefone) select
	MatAluno,
    "Germânico",
    376,
    "Botucatu",
    "São Paulo",
    'SP',
    912304956
    from Aluno where NomeAluno = "Raimundo";

insert into Aluno (NomeAluno, NascAluno, NP1, NP2, Media, Faltas, CodCurso, CodInsti) select
	"Giovani",
    "1997-09-27",
    8.0,
    9.25,
    (8.0 + 9.25) / 2,
    6,
    C.CodCurso,
    C.CodInsti
    from Curso C where
    C.NomeCurso = "Arqueologia";

insert into EndAluno (MatAluno, Rua, Numero, Bairro, Cidade, Estado, Telefone) select
	MatAluno,
    "Garrincha",
    332,
    "Mariposas",
    "São Paulo",
    'SP',
    944775889
    from Aluno where NomeAluno = "Giovani";