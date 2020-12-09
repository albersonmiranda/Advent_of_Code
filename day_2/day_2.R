# Problema 1: verificar validade da senha
data = read.delim("day_2/data.txt", sep = ":")

# Pacotes
library(tidyverse)
library(RVerbalExpressions)

# Número mínimo da política
regex_minimo = rx() %>%
    rx_digit() %>%
    rx_multiple() %>%
    rx_seek_suffix("-")

# Número máximo da política
regex_maximo = rx() %>%
    rx_seek_prefix("-") %>%
    rx_digit() %>%
    rx_multiple()

# letra a ser avaliada
regex_letra = rx() %>%
    rx_alpha()

 # dataframe
 data = data %>%
     mutate(
         minimo = as.integer(str_extract(policy, regex_minimo)),
         maximo = as.integer(str_extract(policy, regex_maximo)),
         letra = str_extract(policy, regex_letra)
     )

# contagem
data = data %>%
    mutate(
        contagem = str_count(password, letra),
        aval = ifelse(contagem <= maximo & contagem >= minimo, 1, 0)
    )

# total
sum(data$aval)

# Problema 2: Outra policy
data <- data %>%
    mutate(
        pos_1 = as.integer(str_extract(policy, regex_minimo)),
        pos_2 = as.integer(str_extract(policy, regex_maximo)),
        letra = str_extract(policy, regex_letra)
    )

# check
data = data %>%
    mutate(
        password = str_trim(password),
        pos_letra_1 = str_sub(password, pos_1, pos_1),
        pos_letra_2 = str_sub(password, pos_2, pos_2)
    )

# validate
data <- data %>%
    mutate(contagem = case_when(
        letra != pos_letra_1 & letra == pos_letra_2 ~ TRUE,
        letra == pos_letra_1 & letra != pos_letra_2 ~ TRUE,
        letra == pos_letra_1 & letra == pos_letra_2 ~ FALSE,
        letra != pos_letra_1 & letra != pos_letra_2 ~ FALSE
    ))
