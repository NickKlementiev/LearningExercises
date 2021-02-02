use universidade;

-- ETAPA 2: ELABORAÇÃO E IMPLEMENTAÇÃO DE CONSULTAS COMPLEXAS

-- Montar um relatório para a visualização do Código do Instituto,
-- o Nome do Funcionário e com ele a Rua e o Número do endereço do mesmo,
-- mostrando todos funcionários mesmo que não estejam em uma instituição.
SELECT 
    i.NomeInsti, c.NomeCurso, a.NomeAluno
FROM
    Instituto i
        JOIN
    Curso c ON i.CodInsti = c.CodInsti
        LEFT JOIN
    Aluno a ON c.CodCurso = a.CodCurso;

-- Montar um relatório para a visualização do Código do Instituto,
-- o Nome do Funcionário e com ele a Rua e o Número do endereço do mesmo,
-- mostrando todos funcionários mesmo que não estejam em uma instituição.
SELECT 
    i.CodInsti, f.NomeFunci, ef.Rua, ef.Numero
FROM
    Instituto i
        RIGHT JOIN
    Funcionario f ON i.CodInsti = f.CodInsti
        JOIN
    EndFunci ef ON f.CodFunci = ef.CodFunci;
    
-- Desenvolver um relatório que retorne o Nome do Professor,
-- a Especialidade dele, o Título que ele possuí, junto com o Tipo de Curso
-- a que ele está vinculado, seguido do Nome da Disciplina que está atrelada
-- ao curso e a Carga Horária dessa Disciplina.
SELECT 
    P.NomeProf,
    P.EspecProf,
    P.TituloProf,
    C.NomeCurso,
    C.TipoCurso,
    D.NomeDisc,
    D.CargaHoraria
FROM
    Professor P,
    Curso C,
    Disciplina D,
    CursoProfessor CP,
    DisciplinaProfessor DP
WHERE
    P.CodProf = CP.CodProf
        AND C.CodCurso = CP.CodCurso
        AND P.CodProf = DP.CodProf
        AND D.CodDisc = DP.CodDisc
        AND C.CodCurso = (SELECT 
            CodCurso
        FROM
            Curso
        WHERE
            NomeCurso = 'Ciência da Computação');
            
-- ETAPA 3: ELABORAÇÃO E IMPLEMENTAÇÃO DE PROCEDURES, TRIGGERS E FUNCTION

-- Procedure para buscar o Nome do Aluno e o Nome do Curso ao qual ele está participando
delimiter $$
create procedure aluno_curso()
begin
select a.NomeAluno, c.NomeCurso
from Aluno a join Curso c
on a.CodCurso = c.CodCurso;
end $$
delimiter ;

-- Para chamar a procedure:
call aluno_curso;

-- Procedure para visualizar o Nome do Instituto, o Nome do Aluno em questão,
-- a Média dele e as Faltas. A busca é realizada pela inserção do número de Matricula do aluno
delimiter $$
create procedure notas_aluno(vid int)
begin
select i.NomeInsti, a.NomeAluno, a.Media, a.Faltas
from Instituto i join Aluno a
on i.CodInsti = a.CodInsti
where a.MatAluno = vid;
end $$
delimiter ;

-- Para chamar a procedure:
call notas_aluno(2);

-- Criação de três triggers after insert, update e delete para registrar
-- as ações de mudança na tabela Aluno. A nova tabela Registro é criada
-- para armazenar os dados de qualquer alteração feita na tabela Aluno,
-- anotando o código do aluno, a tabela-alvo, a ação, a data de mudança e o usuário responsável
create table Registro (
    Cod integer,
    Tabela varchar(10),
    Acao varchar(10),
    Data date,
    Usuario varchar(20)
);

delimiter //
create trigger insert_Aluno after insert on Aluno for each row
begin
    insert into Registro values (new.MatAluno, "Aluno", "insert", now(), user());
end; //

create trigger update_Aluno after update on Aluno for each row
begin
    insert into Registro values (old.MatAluno, "Aluno", "update", now(), user());
end; //

create trigger delete_Aluno after delete on Aluno for each row
begin
    insert into Registro values (old.MatAluno, "Aluno", "delete", now(), user());
end//
delimiter ;

-- Testando as triggers
insert into Aluno (NomeAluno, NascAluno, CodCurso, CodInsti) select
    "AlunoTeste",
    "1234-01-23",
    CodCurso,
    CodInsti
    from Curso where NomeCurso = "Medicina";

update Aluno set NomeAluno = "Pedro" where NomeAluno = "AlunoTeste";

delete from Aluno where NomeAluno = "Pedro";

select * from Registro;

-- Criação de duas triggers before insert e update na tabela Aluno
-- para verificação de quantidade de faltas maior ou igual a 15,
-- caso positivo, reduzir a média do aluno para que fique impossível de aprová-lo de semestre
-- (considerando nota de corte 7.0)
delimiter //
create trigger insert_faltas_Aluno before insert on Aluno for each row
begin
    if new.Faltas >= 15 then
        set new.Media = new.Media - 4;
    end if;
end; //

create trigger update_faltas_Aluno before update on Aluno for each row
begin
    if new.Faltas >= 15 then
        set new.Media = new.Media - 4;
    end if;
end//
delimiter ;

-- Testando as triggers
insert into Aluno (NomeAluno, NascAluno, Media, Faltas, CodCurso, CodInsti) select
    "AlunoTeste",
    "1234-01-23",
    9.5,
    15,
    CodCurso,
    CodInsti
    from Curso where NomeCurso = "Medicina";

update Aluno set Faltas = 15 where MatAluno = 1;

select * from Aluno;

-- Criação de uma function no formato: pesquisarNome(Código integer, Tabela varchar(10))
-- para pesquisar o nome de um aluno, professor ou funcionário com base no inteiro
-- Código e no varchar Tabela. A função retorna "Nome não encontrado" caso o Código
-- ou a Tabela sejam inexistentes
delimiter //
create function pesquisarNome(Codigo integer, Tabela varchar(10)) returns varchar(20)
begin
    declare Nome varchar(20) default "Nome não encontrado";
    if (Tabela like "alu%") or (Tabela like "Alu%") then
        select NomeAluno into Nome from Aluno where MatAluno = Codigo;
    elseif (Tabela like "pro%") or (Tabela like "Pro%") then
        select NomeProf into Nome from Professor where CodProf = Codigo;
    elseif (Tabela like "funci%") or (Tabela like "Funci%") then
        select NomeFunci into Nome from Funcionario where CodFunci = Codigo;
    end if;
    return Nome;
end//
delimiter ;

-- Testando a function
select (pesquisarNome(1, "aluno"));