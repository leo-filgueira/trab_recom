require(recommenderlab)
require(dplyr)
require(data.table)

dados <- data.table(do.call(rbind, strsplit(readLines('Dados\\ml-1m\\ratings.dat'),'::' )))
names(dados) <- c("UserID", "MovieID", "Rating", "Timestamp")

as_data_frame(dados)

m <- as(dados[, -4], "realRatingMatrix")

rec <- Recommender(m, method = "UBCF")

ptm <- Sys.time()
teste <- recommenderlab::predict(rec, m, type = "ratingMatrix")
gc()
Sys.time() - ptm



teste
