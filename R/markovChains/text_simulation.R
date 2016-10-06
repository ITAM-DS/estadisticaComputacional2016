# text_simulation.R
rm(list = ls())

# 0. paqueterias
library(readr)
Rcpp::sourceCpp("mc_cpp_functions.cpp")

# 1. cargamos nuestros datos -----------------------------
mat <- read_csv("data/a_tale_of_two_cities_matrix.csv") 
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
