-- 08/04/2026
-- Array
/*Estrutura de dados que armazena uma coleção sequencial e ordenada de elementos,
geralmente do mesmo tipo e sob um único nome de uma variável*/

create database testjson;
use testjson;
truncate x;

create table x (
	y json
);
insert into x values('["a", "b", "c"]');
select * from x;

-- json_array
insert into x values(json_array("a", "b", "c"));
select * from x;

-- json_array_append
-- insere novos elementos dentro do array

update x set y = json_array_append(y, "$[0]", "a1");
update x set y = json_array_append(y, "$[1]", "b1");
update x set y = json_array_append(y, "$[2]", "c1");
update x set y = json_array_append(y, "$", "d"); -- nesse caso é para adicionar na array principal
update x set y = json_array_append(y, "$ [0][0]", "b");

select * from x;

-- json_insert
-- adiciona novos elementos
insert into x values ('{"chave1":"valor1"}');
select * from x;

update x set y = json_insert(y,
"$.chave2", "valor2",
"$.chave3", "valor3",
"$.chave4", "valor4"
);

-- json_replace
-- substitui os elementos
update x set y = json_replace(y,
"$.chave1", "valorx",
"$.chave2", "valorx",
"$.chave4", "valory"
);

-- json_remove
-- remove os elementos

update x set y = json_remove(y,
"$.chave4"
);