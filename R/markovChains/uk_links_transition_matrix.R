# 0. paqueteria -----------------------------
library(readr)
library(doParallel)


# 1. lectura de datos -----------------------
univ_filelist <- list.files("data/uk_july_2000_external_links", pattern="*.text", full.names = TRUE)
# estos se llaman regular expressions.
univ_name <- gsub("(.*www)(\\..*\\.)(ac.*)", "\\2", univ_filelist)

# 2. contar links ---------------------------
n_univ <- length(univ_name)

cl <- makeCluster(8)
registerDoParallel(cl)
link_count <- foreach (i = 1:n_univ, .combine = rbind) %dopar% {
  links <- readr::read_tsv(
    file = univ_filelist[i],
    skip = 3, 
    col_names = c("university", "count")
  )
  count <- sapply(1:n_univ, function(j) sum(links$count[grepl(univ_name[j], links$university)]))
  count[is.na(count)] <- 0
  names(count) <- univ_name
  count
}
stopCluster(cl)
link_count <- data.frame(link_count)
names(link_count) <- univ_name

write_csv(link_count, "data/uk_linkcount.csv")


