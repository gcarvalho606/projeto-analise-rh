CREATE DATABASE IF NOT EXISTS rh_analytics;
USE rh_analytics;


-- 1. Total de funcionários

SELECT
    COUNT(*) AS total_funcionarios
FROM employees;


-- 2. Taxa geral de turnover

SELECT
    COUNT(*) AS total_funcionarios,
    SUM(Attrition = 'Yes') AS funcionarios_que_sairam,
    ROUND(
        SUM(Attrition = 'Yes') / COUNT(*) * 100,
        2
    ) AS taxa_turnover
FROM employees;


-- 3. Turnover por departamento

SELECT
    Department AS departamento,
    COUNT(*) AS total_funcionarios,
    SUM(Attrition = 'Yes') AS funcionarios_que_sairam,
    ROUND(
        SUM(Attrition = 'Yes') / COUNT(*) * 100,
        2
    ) AS taxa_turnover
FROM employees
GROUP BY Department
ORDER BY taxa_turnover DESC;


-- 4. Turnover por cargo

SELECT
    JobRole AS cargo,
    COUNT(*) AS total_funcionarios,
    SUM(Attrition = 'Yes') AS funcionarios_que_sairam,
    ROUND(
        SUM(Attrition = 'Yes') / COUNT(*) * 100,
        2
    ) AS taxa_turnover
FROM employees
GROUP BY JobRole
ORDER BY taxa_turnover DESC;


-- 5. Turnover por hora extra

SELECT
    OverTime AS hora_extra,
    COUNT(*) AS total_funcionarios,
    SUM(Attrition = 'Yes') AS funcionarios_que_sairam,
    ROUND(
        SUM(Attrition = 'Yes') / COUNT(*) * 100,
        2
    ) AS taxa_turnover
FROM employees
GROUP BY OverTime
ORDER BY taxa_turnover DESC;


-- 6. Salário médio por status de turnover

SELECT
    Attrition AS status,
    COUNT(*) AS total_funcionarios,
    ROUND(AVG(MonthlyIncome), 2) AS salario_medio
FROM employees
GROUP BY Attrition
ORDER BY salario_medio DESC;


-- 7. Turnover por tempo de empresa

SELECT
    CASE
        WHEN YearsAtCompany <= 2 THEN 'Até 2 anos'
        WHEN YearsAtCompany BETWEEN 3 AND 5 THEN '3 a 5 anos'
        WHEN YearsAtCompany BETWEEN 6 AND 10 THEN '6 a 10 anos'
        ELSE 'Mais de 10 anos'
    END AS tempo_de_empresa,
    COUNT(*) AS total_funcionarios,
    SUM(Attrition = 'Yes') AS funcionarios_que_sairam,
    ROUND(
        SUM(Attrition = 'Yes') / COUNT(*) * 100,
        2
    ) AS taxa_turnover
FROM employees
GROUP BY tempo_de_empresa
ORDER BY taxa_turnover DESC;