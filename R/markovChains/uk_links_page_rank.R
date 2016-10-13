### Google PageRank
library(expm)
library(rARPACK)
library(readr)

link_count <- read_csv("data/uk_linkcount.csv")

# convertir en matriz de transicion 
trans_mat <- link_count
N <- nrow(link_count)
for (i in 1:N) {
  trans_mat[i, ] <-  trans_mat[i, ]/sum(trans_mat[i, ]) 
}

# mezclar con matriz de pesos iguales
alpha <- .85
trans_mat <- alpha*trans_mat + (1-alpha)*matrix(1/N, ncol = N, nrow = N)
  
  
# simulacion
Rcpp::sourceCpp("mc_cpp_functions.cpp")
univ_name <- names(trans_mat)
init <- which(univ_name == ".cam.")
n_sim <- 100000
sim <- mc_sim(
  init_state = init,
  n_transitions = n_sim,
  trans_mat = as.matrix(trans_mat)
)
freq_sim <- table(univ_name[sim])/n_sim
head(freq_sim[order(freq_sim, decreasing = TRUE)], 10) # top 10

# matriz P^n
n <- 100000
Pn <- as.matrix(trans_mat) %^% n
ptrans <- Pn[1, ]
head(ptrans[order(ptrans, decreasing = TRUE)], 10)

# estrategia ideal
vec <- eigs(t(as.matrix(trans_mat)), k = 1)$vectors
vec <- vec[ ,1] #Re es porque regresa con complejos
vec <- vec/sum(vec)
names(vec) <- names(trans_mat)
head(vec[order(vec, decreasing = TRUE)],  10)


