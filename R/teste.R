require(recommenderlab)

source("R/cluster.R", echo = T)
rm(filmes, lista_clara, not_all_na, cluster_splitado)

#70% treino, 30% verificação
# set.seed(1)
# amostra_treino <- sample(1:nrow(dados), 0.7*nrow(dados))
# 
# dados <- dados %>% 
#   mutate(Rating = as.numeric(Rating))
# 
# dados_mod <- dados[amostra_treino, -4] %>% 
#   bind_rows(
#     dados[-amostra_treino, -c(3:4)]
#   )
# 
# treino <- as(dados_mod, "realRatingMatrix")
# 
# rec <- Recommender(treino, method = "UBCF")
# 
# ptm <- Sys.time()
# resultado <- recommenderlab::predict(rec, treino, type = "ratingMatrix")
# gc()
# Sys.time() - ptm
# 
# result <- as(resultado, "data.frame") %>% 
#   as_tibble()
# 
# compara <- result %>% 
#   rename(previsto = rating) %>%
#   right_join(dados[-amostra_treino, -4], 
#              by = c("user" = "UserID",
#                     "item" = "MovieID")) %>% 
#   as_data_frame()
# 
# compara %>% 
#   mutate(Rating = as.numeric(Rating),
#          erro = previsto - Rating,
#          e_quad = erro^2) %>% 
#   summarise(sqrt(mean(e_quad)),
#             sd(erro))


# Cluster
# require(cluster)
# teste <- clara(dados, 5, metric = "euclidean", samples = 50)
# teste
# 
# dados$cluster <- teste$clustering
# 
# dados %>% count(cluster)
