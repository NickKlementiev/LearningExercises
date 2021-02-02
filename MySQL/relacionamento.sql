USE rh;

SELECT f.funcionario_id, f.pre_nome, f.sobre_nome, d.departamento_nome, c.cargo_id
FROM funcionarios f, departamentos d, cargos c
ORDER BY departamento_nome
WHERE d.departamento_id = f.departamento_id
AND f.cargo = c.cargo_id;
