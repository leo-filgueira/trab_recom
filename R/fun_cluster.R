# Função que calcula erro pra cada cluster
require(tidyverse)
require(recommenderlab)

erro_cluster <- function(dados, cluster){
  cluster <- enquo(cluster)
  
  k <- dados %>% 
    summarise(n_distinct(!!cluster)) %>% 
    pull()
  
  cluster_splitado <- split(dados, select(dados, !!cluster))
  
  for(i in 1:k){
    nome <- paste0("cluster", i)
    assign(nome, cluster_splitado[[i]] %>% 
             as.data.frame() %>% 
             select(-contains("cluster")))
  
    teste <- as(get(nome), "realRatingMatrix")
  
    model_train_scheme <- evaluationScheme(teste, train = 0.7, 
                                           goodRating = 4, 
                                           given = 18)
  
    model <- getData(model_train_scheme, "train") %>% 
      Recommender(method = "UBCF", 
                  parameter = list(method = "pearson"))
  
    model_pred <- predict(model, getData(model_train_scheme, "known"), type = "ratings")
    
    assign(paste0("erro", i), calcPredictionAccuracy(model_pred, getData(model_train_scheme, "unknown"), 
                                             byUser = F))
  }
  
  lista_return <- mget(paste0("erro", 1:k))
  return(lista_return)
}

junta_erros <- function(lista){
  plyr::rbind.fill.matrix(lista) %>% 
    as_data_frame() %>% 
    return()
}