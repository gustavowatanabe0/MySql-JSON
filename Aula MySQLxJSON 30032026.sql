-- Aula 30/03/2026
create schema exemplosJSON;
use exemplosJSON;

create table x (y json);
insert into x values ('{"nome": "Roberto", "telefone":"1234-5678"}');
insert into x values ('{"nome": "Maria"}');
insert into x values ('{"nome": "Alberto", "endereco":"Rua x numero Y"}');
insert into x values ('{"nome": "Leticia", "endereco":"Rua x numero Y", "telefone":"1234-5678"}');

select y from x;

#JSON_CONTAINS
/*Permite procurar o VALOR das propriedades/chaves dentro do JSON*/
select json_contains_path(y, 'one', '$.nome', '$.endereco') from x;
select json_contains_path(y, 'all', '$.nome', '$.endereco') from x;

select json_contains(y, '"1234-5678"', '$.telefone') from x;
select  * from x where json_contains(y, '"1234-5678"', '$.telefone') = 1;

#JSON_SEARCH
/*Permite encontrar um VALOR em qualquer propriedade*/
select json_search(y, 'one', 'Rua x numero Y') from x;
select json_search(y, 'all', 'Rua x numero Y') from x;