import random
from datetime import datetime

# Configuração inicial e final do ano
start_year = 1900
end_year = 2023

def generate_random_date():
    # Gera uma data aleatória.
    year = random.randint(start_year, end_year)
    month = random.randint(1, 12)
    day = random.randint(1, 31)  # Agora usamos 31 para permitir a geração de datas inválidas
    return "{:02d}/{:02d}/{}".format(day, month, year)

# Número de datas a serem geradas
num_dates = 100000

with open("datas.txt", "w") as f:
    for _ in range(num_dates):
        f.write(generate_random_date() + "\n")

