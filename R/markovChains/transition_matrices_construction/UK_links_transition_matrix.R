# 0. paqueteria -----------------------------
library(readr)
library(dplyr) 
library(doParallel)


# 1. lectura de datos -----------------------
univ_filelist <- list.files("data/uk_july_2000_external_links", pattern="*.text", full.names = TRUE)
# estos se llaman regular expressions.
univ_name <- gsub("(.*www)(\\..*\\.)(ac.*)", "\\2", universities)

# 2. contar links ---------------------------
n_univ <- length(univ_names)
link_count_mat <- matrix(0, nrow = n_univ, ncol = n_univ,  dimnames = list(univ_names, univ_names))

cl <- makeCluster(8)
registerDoParallel(cl)
trans_mat <- foreach (i = 1:n_univ, .combine = rbind) %dopar% {
  links <- readr::read_tsv(univ_filelist[i], skip = 3, col_names = c("university", "count"))
  count <- sapply(1:n_univ, function(j) sum(links$count[grepl(univ_name[j], links$university)]))
  names(count) <- univ_name
  count/sum(count)
}
stopCluster(cl)
trans_mat <- data.frame(trans_mat) 
names(trans_mat) <- univ_name
idx <- which(complete.cases(trans_mat))
trans_mat <- trans_mat[idx, idx]
write_csv(trans_mat, "data/uk_link_transmat.csv")


