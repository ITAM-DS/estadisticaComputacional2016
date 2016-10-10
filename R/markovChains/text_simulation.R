# text_simulation.R
rm(list = ls())

# 0. paqueterias
library(readr)
Rcpp::sourceCpp("mc_cpp_functions.cpp")

# 1. cargamos nuestros datos -----------------------------
mat <- read_csv("data/a_tale_of_two_cities_matrix.csv")
mat[is.na(mat)] <- 0
for (i in 1:nrow(mat)) {
  mat[i, ] <- mat[i, ]/sum(mat[i, ])
}
words <- names(mat)
init <- which(words == "i")

# 2. simulacion
text_length <- 250
text <- mc_sim(
  init_state = init,
  n_transitions = text_length,
  trans_mat = as.matrix(mat)
)
words[text]

# 3. long term....
text_length <- 1000000
text <- mc_sim(
  init_state = init,
  n_transitions = text_length,
  trans_mat = as.matrix(mat)
)
text_decoded <- words[text]
rank <- table(text_decoded)
rank <- rank[order(rank, decreasing = TRUE)]
round(head(rank, 100)/sum(rank), 4)

library(expm) # permite calcular P^n usando el operador %^%
n <- 1000
mat[is.na(mat)] <- 0
Pn <- as.matrix(mat) %^% n
Pn[1:10, 1:10]
