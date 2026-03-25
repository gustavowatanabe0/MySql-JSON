#Aula 25/03/2026 - Introdução MySQL e JSON
create schema exemplos_json;
use exemplos_json;

create table palavra(
json_palavra varchar(350));

insert into palavra values(
'{
  "nome": "Aldair",
  "sobrenome": "Chaves",
  "ID": "001"
}'
);

select * from palavra;

create table palavra2(
json_palavra2 json
);

insert into palavra2 values(
'{
  "nome": "Aldair",
  "sobrenome": "Chaves",
  "ID": "001"
}'
);

select * from palavra2;

