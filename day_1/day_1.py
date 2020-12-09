# Problema 1: Achar duas entradas que somam 2020 e multiplicá-las
import pandas as pd
data = pd.read_csv("day_1/data.txt", sep = "\t")

# loop para achar as entradas
import random

soma = 1
while soma != 2020:
    numbers = data['expense'].sample(2)
    soma = numbers.sum()