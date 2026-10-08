import pandas as pd

df = pd.read_csv("Data/WA_Fn-UseC_-HR-Employee-Attrition.csv")

# Seleção das colunas utilizadas na análise
colunas = [
    "Age",
    "Department",
    "JobRole",
    "MonthlyIncome",
    "OverTime",
    "JobSatisfaction",
    "YearsAtCompany",
    "YearsSinceLastPromotion",
    "JobLevel",
    "DistanceFromHome",
    "Attrition"
]

df = df[colunas]


# Exporta a base tratada para o SQL
df.to_csv(
    "Data/employees_clean.csv",
    index=False
)

print(df.head())
print(df.info())

# Turnover geral
turnover = df["Attrition"].value_counts()

print("\nTurnover:")
print(turnover)

taxa_turnover = (df["Attrition"] == "Yes").mean() * 100

print(f"\nTaxa de turnover: {taxa_turnover:.2f}%")

# Turnover por departamento
turnover_departamento = pd.crosstab(
    df["Department"],
    df["Attrition"],
    normalize="index"
) * 100

print("\nTurnover por departamento:")
print(turnover_departamento["Yes"].sort_values(ascending=False))

# Turnover por horas extras
turnover_horas_extras = pd.crosstab(
    df["OverTime"],
    df["Attrition"],
    normalize="index"
) * 100

print("\nTurnover por horas extras:")
print(turnover_horas_extras["Yes"].sort_values(ascending=False))

# Turnover por tempo de empresa
df["FaixaTempoEmpresa"] = pd.cut(
    df["YearsAtCompany"],
    bins=[-1, 2, 5, 10, float("inf")],
    labels=["Até 2 anos", "3 a 5 anos", "6 a 10 anos", "Mais de 10 anos"]
)

turnover_tempo = pd.crosstab(
    df["FaixaTempoEmpresa"],
    df["Attrition"],
    normalize="index"
) * 100

print("\nTurnover por tempo de empresa:")
print(turnover_tempo["Yes"])