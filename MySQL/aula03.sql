USE rh;

select COUNT(distinct sobre_nome) from funcionarios order by sobre_nome;
select COUNT(all sobre_nome) from funcionarios order by sobre_nome;

select max(max_salario) from cargos;
select min(max_salario) from cargos;

select sum(max_salario) from cargos;
select round((sum(max_salario) + sum(min_salario) / count(cargo_id) * 2), 2) from cargos;
