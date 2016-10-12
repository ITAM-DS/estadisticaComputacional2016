library(readr)
library(doParallel)

raw <- read_file("data/dickens_a_tale_of_two_cities.txt")
raw <- gsub("\\n|\\r|[[:punct:]]", " ", raw) # quitar caracteres especiales
raw <- unlist(strsplit(raw, split=" "))
raw <- gsub(" ", "", raw) # words in order
raw <- raw[raw!=""]
raw <- tolower(raw)
head(raw, 100)

word_freq <- table(raw)
word_freq <- word_freq[order(word_freq, decreasing=TRUE)]
word_freq <- word_freq[1:3000] # para motivos didacticos quedemonos con las 1000 mas comunes
n_words <- length(word_freq)
word_names <- names(word_freq)
head(word_freq, 30) # top 30 words


bigrams <- paste(raw[-length(raw)], raw[-1])
bigram_freq <- table(bigrams)
bigram_freq <- bigram_freq[order(bigram_freq, decreasing=TRUE)]
head(bigram_freq, 50) # top 30 words

# usaremos computo paralelo porque es muy desgastante
cl <- makeCluster(8)
registerDoParallel(cl)
transition_matrix <-  foreach(i=1:n_words, .combine=rbind) %dopar% {
  freq <- bigram_freq[paste(word_names[i], word_names)]
  freq[is.na(freq)] <- 0
  freq
}
transition_matrix[is.na(transition_matrix )] <- 0
for (i in 1:nrow(transition_matrix)) {
  transition_matrix[i, ] <- transition_matrix[i, ]/sum(transition_matrix[i, ])
}
dimnames(transition_matrix) <- list(word_names, word_names)
stopCluster(cl)

write.table(
  transition_matrix, 
  sep = ",",
  "data/a_tale_of_two_cities_matrix.csv",
  row.names = FALSE
)
