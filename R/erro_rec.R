source("R/fun_cluster.R")

## Erro com todo mundo

rmatrix <- as(dados %>% 
              # select(-contains("cluster")) %>% 
              as.data.frame(), "realRatingMatrix")

min(rowCounts(rmatrix))

model_train_scheme <- evaluationScheme(rmatrix, train = 0.7, goodRating = 4, given = 18)

model <- getData(model_train_scheme, "train") %>% #only fit on the 70% training data.
  Recommender(method = "UBCF", parameter = list(method = "pearson"))

model_pred <- predict(model, getData(model_train_scheme, "known"), type = "ratings")
test_error <- calcPredictionAccuracy(model_pred, getData(model_train_scheme, "unknown"), byUser = F)

head(test_error)
summary(test_error)

# boxplot(test_error, main = "Todos os usuários")

## Erro com clusters

# # Cluster 1
# cluster1 <- cluster1 %>% 
#   select(-cluster) %>% 
#   as.data.frame()
#   
# teste <- as(cluster1, "realRatingMatrix")
# 
# min(rowCounts(teste))
# 
# model_train_scheme <- evaluationScheme(teste, train = 0.7, goodRating = 4, given = 18)
# 
# model1 <- getData(model_train_scheme, "train") %>% #only fit on the 75% training data.
#   Recommender(method = "UBCF", parameter = list(method = "pearson"))
# 
# model1_pred <- predict(model1, getData(model_train_scheme, "known"), type = "ratings")
# test_error_cl1 <- calcPredictionAccuracy(model1_pred, getData(model_train_scheme, "unknown"), byUser = TRUE)
# 
# head(test_error_cl1)
# summary(test_error_cl1)
# 
# # Cluster 2
# cluster2 <- cluster2 %>% 
#   select(-cluster) %>% 
#   as.data.frame()
# 
# teste <- as(cluster2, "realRatingMatrix")
# 
# min(rowCounts(teste))
# 
# model_train_scheme <- evaluationScheme(teste, train = 0.7, goodRating = 4, given = 18)
# 
# model2 <- getData(model_train_scheme, "train") %>% #only fit on the 75% training data.
#   Recommender(method = "UBCF", parameter = list(method = "pearson"))
# 
# model2_pred <- predict(model2, getData(model_train_scheme, "known"), type = "ratings")
# test_error_cl2 <- calcPredictionAccuracy(model2_pred, getData(model_train_scheme, "unknown"), byUser = TRUE)
# 
# head(test_error_cl2)
# summary(test_error_cl2)
# 
# # Cluster 3
# cluster3 <- cluster3 %>% 
#   select(-cluster) %>% 
#   as.data.frame()
# 
# teste <- as(cluster3, "realRatingMatrix")
# 
# min(rowCounts(teste))
# 
# model_train_scheme <- evaluationScheme(teste, train = 0.7, goodRating = 4, given = 18)
# 
# model3 <- getData(model_train_scheme, "train") %>% #only fit on the 75% training data.
#   Recommender(method = "UBCF", parameter = list(method = "pearson"))
# 
# model3_pred <- predict(model3, getData(model_train_scheme, "known"), type = "ratings")
# test_error_cl3 <- calcPredictionAccuracy(model3_pred, getData(model_train_scheme, "unknown"), byUser = TRUE)
# 
# head(test_error_cl3)
# summary(test_error_cl3)
# 
# # Cluster 4
# cluster4 <- cluster4 %>% 
#   select(-cluster) %>% 
#   as.data.frame()
# 
# teste <- as(cluster4, "realRatingMatrix")
# 
# min(rowCounts(teste))
# 
# model_train_scheme <- evaluationScheme(teste, train = 0.7, goodRating = 4, given = 18)
# 
# model4 <- getData(model_train_scheme, "train") %>% #only fit on the 75% training data.
#   Recommender(method = "UBCF", parameter = list(method = "pearson"))
# 
# model4_pred <- predict(model4, getData(model_train_scheme, "known"), type = "ratings")
# test_error_cl4 <- calcPredictionAccuracy(model4_pred, getData(model_train_scheme, "unknown"), byUser = TRUE)
# 
# head(test_error_cl4)
# summary(test_error_cl4)
# 
# erro_cluster <- rbind(test_error_cl1, test_error_cl2, 
#                       test_error_cl3, test_error_cl4)
# 
# par(mar = c(2, 2.5, 1.55, 1), mfrow = c(2, 1))
# boxplot(test_error, main = "Todos os usuários")
# boxplot(erro_cluster, main = "Clusters")  
# 
# par(mfrow = c(2, 2), mar = c(2, 2.5, 1.55, 1))

# Erros com cluster a partir do rating
c2_rating <- erro_cluster(dados_cluster, cluster_2_rating)
c2_rating

c3_rating <- erro_cluster(dados_cluster, cluster_3_rating)
c3_rating

c4_rating <- erro_cluster(dados_cluster, cluster_4_rating)
c4_rating

c5_rating <- erro_cluster(dados_cluster, cluster_5_rating)
c5_rating

# Erros com cluster a partir da proporção

c2_prop <- erro_cluster(dados_cluster, cluster_2_prop)
c2_prop

c3_prop <- erro_cluster(dados_cluster, cluster_3_prop)
c3_prop

c4_prop <- erro_cluster(dados_cluster, cluster_4_prop)
c4_prop

c5_prop <- erro_cluster(dados_cluster, cluster_5_prop)
c5_prop


erro_cl_rating <- colMeans(do.call(rbind, c2_rating)) %>% 
  bind_rows(
    colMeans(do.call(rbind, c3_rating))
  ) %>% 
  bind_rows(
    colMeans(do.call(rbind, c4_rating))
  ) %>% 
  bind_rows(
    colMeans(do.call(rbind, c5_rating))
  ) %>% 
  mutate(num_clusters = 2:5)

erro_cl_prop <- colMeans(do.call(rbind, c2_prop)) %>% 
  bind_rows(
    colMeans(do.call(rbind, c3_prop))
  ) %>% 
  bind_rows(
    colMeans(do.call(rbind, c4_prop))
  ) %>% 
  bind_rows(
    colMeans(do.call(rbind, c5_prop))
  ) %>% 
  mutate(num_clusters = 2:5)

erro <- test_error %>% 
  t() %>% 
  as.data.frame() %>% 
  mutate(num_clusters = 0,
         Tipo_cluster = "Nenhum") %>% 
  bind_rows(
    erro_cl_rating %>% 
      mutate(Tipo_cluster = "Rating")) %>% 
  bind_rows(
    erro_cl_prop %>% 
      mutate(Tipo_cluster = "Proporção"))

erro %>% 
  arrange_at(vars(1:3)) %>% 
  select(Tipo_cluster, num_clusters, everything())
  write.csv2("R/Erro_recomendacao.csv", row.names = F)
