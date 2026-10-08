# Análise de Turnover — RH

Projeto de análise de dados de funcionários utilizando Python, SQL e Power BI. A análise foi feita com o dataset IBM HR Analytics Employee Attrition & Performance, com 1.470 funcionários e 35 variáveis no conjunto original.

Para o projeto, foram selecionadas as informações mais relevantes para analisar o turnover, como departamento, cargo, salário, hora extra, satisfação no trabalho, tempo de empresa, nível hierárquico e distância de casa.

## Ferramentas

* Python (Pandas)
* SQL / MySQL
* Power BI

## Principais indicadores

| Indicador                        |    Resultado |
| -------------------------------- | -----------: |
| Total de funcionários            |        1.470 |
| Funcionários que saíram          |          237 |
| Taxa de turnover                 |       16,12% |
| Salário médio de quem permaneceu | US$ 6.832,74 |
| Salário médio de quem saiu       | US$ 4.787,09 |

## Principais análises

### Turnover por departamento

| Departamento           | Turnover |
| ---------------------- | -------: |
| Sales                  |   20,63% |
| Human Resources        |   19,05% |
| Research & Development |   13,84% |

### Turnover por cargo

O maior turnover foi encontrado entre Sales Representatives, com 39,76%, seguido por Laboratory Technicians, com 23,94%.

### Turnover por hora extra

Funcionários que faziam hora extra apresentaram turnover de 30,53%, enquanto entre os que não faziam hora extra o índice foi de 10,44%.

### Turnover por tempo de empresa

| Tempo de empresa | Turnover |
| ---------------- | -------: |
| Até 2 anos       |   29,82% |
| 3 a 5 anos       |   13,82% |
| 6 a 10 anos      |   12,28% |
| Mais de 10 anos  |    8,13% |

Os dados mostram uma taxa de turnover maior entre funcionários com menos tempo de empresa. A análise também encontrou uma diferença relevante entre funcionários que faziam e não faziam hora extra.

Os resultados representam associações encontradas nos dados e não indicam, por si só, relação de causa e efeito.

## Estrutura do projeto

* `Data/` — arquivos CSV utilizados no projeto
* `Python/` — tratamento dos dados e análises realizadas com Pandas
* `SQL/` — consultas utilizadas para analisar os dados no MySQL
* `PowerBI/` — dashboard com os principais indicadores e análises
* `README.md` — documentação do projeto
