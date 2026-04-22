use world_x;
#Consulta 1
select json_extract(doc, "$.Name") as nome,
json_extract(doc, "$.demographics.LifeExpectancy") as expectativa_vida,
json_extract(doc, "$.geography.Continent") as continente
from countryinfo
where json_extract(doc, "$.geography.Continent") like ("%South America%");

#Consulta 2
select json_extract(doc, "$.Name") as nome,
json_extract(doc, "$.GNP") as gnp,
cl.language as idioma
from countryinfo
inner join countrylanguage as cl
on cl.countrycode = json_extract(doc, "$.Code")
where cl.language like("%English%") and json_extract(doc, "$.GNP") > 500000;

use empresa;
#Consulta 3
select primeiro_nome as nome, json_extract(json, "$") as info
from tb_funcionario as tf
inner join tb_object_funcionario  as tof
on tf.cpf = tof.cpf
inner join tb_dependente as td
on tf.cpf = td.cpf_funcionario
where td.sexo like "%F%";

#Consulta 4
select T1.Nome, T1.Parentesco, T1.DataNascimento, tf.primeiro_nome as nome_funcionario
from tb_object_funcionario
cross join
json_table(
	json_extract(json, "$.Dependentes"), "$[*]"
    columns(Nome varchar(30) path "$.Nome_Dependente",
		Parentesco varchar(20) path "$.Parentesco",
		DataNascimento datetime path "$.Data_Nascimento")
) as T1
inner join tb_funcionario as tf
on tf.cpf = json_unquote(json_extract(json, "$.Cpf"));
