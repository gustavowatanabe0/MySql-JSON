#Lista 1 - Correção de Sintaxe JSON

# Exercício 1
/*Analise a sintaxe (escrita) das variáveis 
que possuem como valor dados no formato JSON e corrija
os erros de sintaxe. Reescreva os códigos ou adicione a linha correta
utilizando um comentário, como no exemplo na alternativa a)*/

-- a)
 
aluno = { #falta } no final
		"nome""Maria", #Falta : entre a chave e valor
		"idade": 30, 
        "data_nascimento": 1995-02-02, #Falta "" na data
			"endereco: #Falta " no endereco e abertura da { 
				"rua":"Rua dos Fundos",
				"numero":123 #falta , para separar bairro e cep
				"bairro"; "Centro", # ; está errado
				"cep":77830000
			}
			"contato":{
				"telefone":"99999999",
				"email":"maria@dominio.com"
			}
		

-- b)

cidade = # falta { no início
		"nome":"Londrina", 
		"idade": 90, 
        "data_fundacao": 1934-12-10, #falta ""
		"":581000, #possui somente o valor da chave
		"estado": "Paraná",
        "territorio":{ # falta } no final
			"area":1652569,
			"relevo": "Predominantemente Plano",
            "altitude_maxima":840 #falta ,
            "altitude_minima":570, # não precisa da , por ser a última chave
			
		}

-- c)

funcionario = {
    "Cpf": "33344555587",
    "Sexo": "M",
    "Salario": 40000.0 #falta ,
    "Endereco": Rua da Lapa 34 São Paulo SP #falta "" e ,
    "Nome_Meio": "T",
    "Dependentes": [ #falta fechar ]
        {
            "Sexo": "F",
            "Parentesco": "Filha",
            "Data_Nascimento": "1986-01-05T00:04:00",
            "Nome_Dependente": "Alicia"
        } #falta virgula
        {
            "Sexo": "F",
            "Parentesco": "Esposa",
            "Data_Nascimento": "1958-01-03T00:05:00",
            "Nome_Dependente": "Janaína"
        },
        {
            "Sexo": "M",
            "Parentesco": "Filho",
            "Data_Nascimento" "1983-01-25T00:10:00",
            "Nome_Dependente": "Tiago"
        }, # não precisa da ,
    "Ultimo_Nome": "Wong",
    "Primeiro_Nome": "Fernando",
    "Cpf_Supervisor: "88866555576", #falta " no supervisor
    "Data_Nascimento": "1955-01-12T00:08:00",
    "Numero_Departamento": "5"
}
} #possue uma } a mais

# Exercício 2

/*Analise as consultas SQL abaixo e aponte os erros de sintaxe. Tanto 
as estruturas JSON quanto os comandos SQL podem estar erradas.*/

-- a)

SELECT 
	JSON_EXTRACT("$.Primeiro_Nome", 
    "$.Data_Nascimento", "$.Salario")
WHERE tb_object_funcionario;
#o erro está no where pois dessa forma não está sendo especificado de onde são os dados para consultar, deveria ser from

-- b)

SELECT 
	JSON_UNQUOTE(JSON_EXTRACT(JSON,"$.Primeiro_Nome")) #falta ,
    JSON_UNQUOTE(JSON_EXTRACT(JSON,"$.Data_Nascimento"), #falta fechar um )
    JSON_EXTRACT(JSON,"$.Salario")
FROM empresa; #empresa nesse caso seria a database, no lugar deveria ser utilizado o nome da tabela

-- c)

SELECT T1.PARENTESCO, T1.SEXO FROM tb_object_funcionario
CROSS JOIN
JSON_TABLE (
	JSON_EXTRACT(JSON, "$.Dependentes"), "$[*]"
    COLUMNS (PARENTESCO VARCHAR(50) "$.Parentesco", #falta path
			SEXO VARCHAR(50) PATH "$.Sexo")
) AS T2; #o apelido está errado, deveria ser T1

-- d)

SELECT JSON_KEYS(doc, "geography") FROM countryinfo #falta $ no "geography"
WHERE _id = 'BRA';

-- e)

SELECT JSON_EXTRACT(doc, "$.GNP") as GNP
  , JSON_EXTRACT(doc, "$.Code") as Code
  , JSON_EXTRACT(doc, "$.Name") as Name
  , JSON_EXTRACT(doc, "$.IndepYear") as IndepYear
  , JSON_EXTRACT(doc, "$.geography.Region") as Region
  , JSON_EXTRACT(doc, "$.geography.Continent") as Continent
  , JSON_EXTRACT(doc, "$.geography[0]") as SurfaceArea
  , JSON_EXTRACT(doc, "$.government.HeadOfState") as HeadOfState
  , JSON_EXTRACT(doc, "$.government.GovernmentForm") as GovernmentForm
  , JSON_EXTRACT(doc, "$.demographics") as Population
    JSON_EXTRACT(doc, "$.demographics.LifeExpectancy") as LifeExpectancy #falta uma ,
  FROM countryinfo;
  
-- f)

SELECT JSON_EXTRACT("$.geography.Continent") as Continent, #falta doc dentro dos parenteses
(JSON_EXTRACT(doc, "$.demographics.Population")) as Population, #possui um ) a mais
AVG(JSON_EXTRACT(doc, "$.demographics.LifeExpectancy")) as LifeExpectancy 
WHERE JSON_EXTRACT(doc, "$.government.") LIKE('%Monarchy%'), # a condicional deve ir após o from
FROM countryinfo
GROUP BY JSON_EXTRACT(doc, "$.geography")# falta ,
ORDER BY 2;