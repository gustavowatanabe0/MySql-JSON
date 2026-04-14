-- Aula 13/04/2026

select * from tb_object_funcionario;

select json_unquote(json_extract(json, "$.Primeiro_Nome", "$.Data_Nascimento",
"$.Numero_Departamento")) from  tb_object_funcionario;

select json_unquote(json_extract(json,"$.Primeiro_Nome")) as nome,
json_unquote(json_extract(json,"$.Data_Nascimento")) as dt_nascimento,
json_unquote(json_extract(json,"$.Salario")) as salário
from tb_object_funcionario;

select json_type(json_extract(json, "$.Data_Nascimento")),
json_type(json_extract(json, "$.Salario")),
json_type(json_extract(json, "$.Primeiro_Nome"))
from tb_object_funcionario
where year(json_extract(json, "$.Data_Nascimento"))
>= 1980;

select json_extract(json, "$.Dependentes[0].Sexo")
from tb_object_funcionario;

select json_extract(json, "$.Dependentes[0].Parentesco")
from tb_object_funcionario;

select json_extract(json, "$.Dependentes[0].Parentesco")
from tb_object_funcionario
union
select json_extract(json, "$.Dependentes[1].Parentesco")
from tb_object_funcionario;

select T1.parentesco, T1.sexo from tb_object_funcionario
cross join
json_table(
	json_extract(json, "$.Dependentes"), "$[*]"
    columns(parentesco varchar(20) path "$.Parentesco",
		sexo varchar(2) path "$.Sexo")
) as T1;

/*Crie uma tabela baseada no campo dependentes com uma coluna
para Sexo, Parentesco, Data de Nascimento e Nome do dependente.
Além de utilizar o INNER JOIN para adicionar o nome do departamento
(tb_departamento).*/

select T1.Sexo, T1.Parentesco, T1.DataNascimento, T1.NomeDependente
from tb_object_funcionario
cross join
json_table(
	json_extract(json, "$.Dependentes"), "$[*]"
    columns(Sexo varchar(2) path "$.Sexo",
		Parentesco varchar(20) path "$.Parentesco",
		DataNascimento varchar(30) path "$.Data_Nascimento",
        NomeDependente varchar(20) path "$.Nome_Dependente")
) as T1;
