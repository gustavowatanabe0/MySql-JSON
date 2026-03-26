-- Aula 25/03/2026 - Comandos JSON utilizando o banco de dados 'world_x'
select * from countryinfo
where _id = 'GBR';

-- JSON_KEYS(doc, '$.')
select json_keys(doc) from countryinfo
where _id = 'BRA';
select json_keys(doc, '$.government') from countryinfo
where _id = 'BRA';

-- JSON_EXTRACT(doc, '$.')
select json_extract(doc, '$.government') from countryinfo
where _id = 'BRA';
select json_extract(doc, '$.IndepYear') from countryinfo
where _id = 'BRA';
select json_extract(doc, '$.geography') from countryinfo
where _id = 'BRA';
select json_extract(doc, '$.geography.Continent') as Continente,
json_extract(doc, '$.demographics.Population') as População
from countryinfo;

/*Questão 1:
Exibam uma tabela com a população total e a média
da expectativa de vida de cada continente para os
países que são monarquias. Agrupe e ordene
os dados exibidos*/

select json_extract(doc, '$.geography.Continent') as continente,
sum(json_extract(doc, '$.demographics.Population')) as população,
avg(json_extract(doc, '$.demographics.LifeExpectancy')) as expectativa_vida
from countryinfo
where json_extract(doc, '$.government.GovernmentForm') like '%Monarchy%'
group by continente
order by população;