# Problema 1: Achar duas entradas que somam 2020 e multiplicá-las
data = read.delim("day_1/data.txt")

# loop para achar as entradas
numbers = 1
while (sum(numbers) != 2020) {
    numbers = sample(data$expense, 2)
    sum(numbers)
}

# multiplicando
prod(numbers)

#################################################################

# Problema 2: Achar três entradas que somam 2020 e multiplicá-las

# loop para achar as entradas
numbers <- 1
while (sum(numbers) != 2020) {
    numbers <- sample(data$expense, 3)
    sum(numbers)
}

# multiplicando
prod(numbers)