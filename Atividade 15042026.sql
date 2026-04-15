-- Atividade 15/04/2026

/*Crie uma tabela baseada no campo dependentes com uma coluna
para Sexo, Parentesco, Data de Nascimento e Nome do dependente.
Além de utilizar o INNER JOIN para adicionar o nome do departamento
(tb_departamento).*/

select T1.Parentesco, T1.Sexo, T1.DataNascimento, T1.NomeDependente, td.nome_departamento
from tb_object_funcionario
cross join
json_table(
	json_extract(json, "$.Dependentes"), "$[*]"
    columns(Parentesco varchar(20) path "$.Parentesco",
		Sexo varchar(2) path "$.Sexo",
		DataNascimento datetime path "$.Data_Nascimento",
        NomeDependente varchar(50) path "$.Nome_Dependente")
) as T1
inner join tb_departamento as td
on td.numero_departamento = json_unquote(json_extract(json, "$.Numero_Departamento"));

