#Auka 01/04/2026
use world_x;

select *  from countryinfo;

select json_extract(doc, '$.Name') from countryinfo where json_search(doc, 'all', 'North America');

select json_extract(doc, '$.Name') as Países,
json_extract(doc,'$.geography.Continent') as Continente from countryinfo 
where json_contains(doc, '"North America"','$.geography.Continent') = 1;