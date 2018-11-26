source("R/fun_cluster.R")

## Erro com todo mundo

rmatrix <- as(dados %>% 
                select(-Timestamp) %>% 
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

# Erros com cluster CLARA a partir do rating
c2_rating_clara <- erro_cluster(dados_cluster, cluster_2_rating)
c2_rating_clara

c3_rating_clara <- erro_cluster(dados_cluster, cluster_3_rating)
c3_rating_clara

c4_rating_clara <- erro_cluster(dados_cluster, cluster_4_rating)
c4_rating_clara

c5_rating_clara <- erro_cluster(dados_cluster, cluster_5_rating)
c5_rating_clara

c6_rating_clara <- erro_cluster(dados_cluster, cluster_6_rating)
c6_rating_clara

c7_rating_clara <- erro_cluster(dados_cluster, cluster_7_rating)
c7_rating_clara

c8_rating_clara <- erro_cluster(dados_cluster, cluster_8_rating)
c8_rating_clara

c9_rating_clara <- erro_cluster(dados_cluster, cluster_9_rating)
c9_rating_clara

c10_rating_clara <- erro_cluster(dados_cluster, cluster_10_rating)
c10_rating_clara

c11_rating_clara <- erro_cluster(dados_cluster, cluster_11_rating)
c11_rating_clara

c12_rating_clara <- erro_cluster(dados_cluster, cluster_12_rating)
c12_rating_clara

c13_rating_clara <- erro_cluster(dados_cluster, cluster_13_rating)
c13_rating_clara

c14_rating_clara <- erro_cluster(dados_cluster, cluster_14_rating)
c14_rating_clara

c15_rating_clara <- erro_cluster(dados_cluster, cluster_15_rating)
c15_rating_clara

# Erros com cluster CLARA a partir da proporção

c2_prop_clara <- erro_cluster(dados_cluster, cluster_2_prop)
c2_prop_clara

c3_prop_clara <- erro_cluster(dados_cluster, cluster_3_prop)
c3_prop_clara

c4_prop_clara <- erro_cluster(dados_cluster, cluster_4_prop)
c4_prop_clara

c5_prop_clara <- erro_cluster(dados_cluster, cluster_5_prop)
c5_prop_clara

c6_prop_clara <- erro_cluster(dados_cluster, cluster_6_prop)
c6_prop_clara

c7_prop_clara <- erro_cluster(dados_cluster, cluster_7_prop)
c7_prop_clara

c8_prop_clara <- erro_cluster(dados_cluster, cluster_8_prop)
c8_prop_clara

c9_prop_clara <- erro_cluster(dados_cluster, cluster_9_prop)
c9_prop_clara

c10_prop_clara <- erro_cluster(dados_cluster, cluster_10_prop)
c10_prop_clara

c11_prop_clara <- erro_cluster(dados_cluster, cluster_11_prop)
c11_prop_clara

c12_prop_clara <- erro_cluster(dados_cluster, cluster_12_prop)
c12_prop_clara

c13_prop_clara <- erro_cluster(dados_cluster, cluster_13_prop)
c13_prop_clara

c14_prop_clara <- erro_cluster(dados_cluster, cluster_14_prop)
c14_prop_clara

c15_prop_clara <- erro_cluster(dados_cluster, cluster_15_prop)
c15_prop_clara

# Erros com k-means usando rating
c2_rating_kmeans <- erro_cluster(dados_cluster, cluster_2_kmeans_rating)
c2_rating_kmeans

c3_rating_kmeans <- erro_cluster(dados_cluster, cluster_3_kmeans_rating)
c3_rating_kmeans

c4_rating_kmeans <- erro_cluster(dados_cluster, cluster_4_kmeans_rating)
c4_rating_kmeans

c5_rating_kmeans <- erro_cluster(dados_cluster, cluster_5_kmeans_rating)
c5_rating_kmeans

c6_rating_kmeans <- erro_cluster(dados_cluster, cluster_6_kmeans_rating)
c6_rating_kmeans

c7_rating_kmeans <- erro_cluster(dados_cluster, cluster_7_kmeans_rating)
c7_rating_kmeans

c8_rating_kmeans <- erro_cluster(dados_cluster, cluster_8_kmeans_rating)
c8_rating_kmeans

c9_rating_kmeans <- erro_cluster(dados_cluster, cluster_9_kmeans_rating)
c9_rating_kmeans

c10_rating_kmeans <- erro_cluster(dados_cluster, cluster_10_kmeans_rating)
c10_rating_kmeans

c11_rating_kmeans <- erro_cluster(dados_cluster, cluster_11_kmeans_rating)
c11_rating_kmeans

c12_rating_kmeans <- erro_cluster(dados_cluster, cluster_12_kmeans_rating)
c12_rating_kmeans

c13_rating_kmeans <- erro_cluster(dados_cluster, cluster_13_kmeans_rating)
c13_rating_kmeans

c14_rating_kmeans <- erro_cluster(dados_cluster, cluster_14_kmeans_rating)
c14_rating_kmeans

c15_rating_kmeans <- erro_cluster(dados_cluster, cluster_15_kmeans_rating)
c15_rating_kmeans

# Erros com cluster kmeans a partir da proporção
c2_prop_kmeans <- erro_cluster(dados_cluster, cluster_2_kmeans_prop)
c2_prop_kmeans

c3_prop_kmeans <- erro_cluster(dados_cluster, cluster_3_kmeans_prop)
c3_prop_kmeans

c4_prop_kmeans <- erro_cluster(dados_cluster, cluster_4_kmeans_prop)
c4_prop_kmeans

c5_prop_kmeans <- erro_cluster(dados_cluster, cluster_5_kmeans_prop)
c5_prop_kmeans

c6_prop_kmeans <- erro_cluster(dados_cluster, cluster_6_kmeans_prop)
c6_prop_kmeans

c7_prop_kmeans <- erro_cluster(dados_cluster, cluster_7_kmeans_prop)
c7_prop_kmeans

c8_prop_kmeans <- erro_cluster(dados_cluster, cluster_8_kmeans_prop)
c8_prop_kmeans

c9_prop_kmeans <- erro_cluster(dados_cluster, cluster_9_kmeans_prop)
c9_prop_kmeans

c10_prop_kmeans <- erro_cluster(dados_cluster, cluster_10_kmeans_prop)
c10_prop_kmeans

c11_prop_kmeans <- erro_cluster(dados_cluster, cluster_11_kmeans_prop)
c11_prop_kmeans

c12_prop_kmeans <- erro_cluster(dados_cluster, cluster_12_kmeans_prop)
c12_prop_kmeans

c13_prop_kmeans <- erro_cluster(dados_cluster, cluster_13_kmeans_prop)
c13_prop_kmeans

c14_prop_kmeans <- erro_cluster(dados_cluster, cluster_14_kmeans_prop)
c14_prop_kmeans

c15_prop_kmeans <- erro_cluster(dados_cluster, cluster_15_kmeans_prop)
c15_prop_kmeans


erro_cl_rating_clara <- colMeans(do.call(rbind, c2_rating_clara)) %>% 
  bind_rows(
    colMeans(do.call(rbind, c3_rating_clara))
  ) %>% 
  bind_rows(
    colMeans(do.call(rbind, c4_rating_clara))
  ) %>% 
  bind_rows(
    colMeans(do.call(rbind, c5_rating_clara))
  ) %>%
  bind_rows(
    colMeans(do.call(rbind, c6_rating_clara))
  ) %>%
  bind_rows(
    colMeans(do.call(rbind, c7_rating_clara))
  ) %>%
  bind_rows(
    colMeans(do.call(rbind, c8_rating_clara))
  ) %>%
  bind_rows(
    colMeans(do.call(rbind, c9_rating_clara))
  ) %>%
  bind_rows(
    colMeans(do.call(rbind, c10_rating_clara))
  ) %>%
  bind_rows(
    colMeans(do.call(rbind, c11_rating_clara))
  ) %>%
  bind_rows(
    colMeans(do.call(rbind, c12_rating_clara))
  ) %>%
  bind_rows(
    colMeans(do.call(rbind, c13_rating_clara))
  ) %>%
  bind_rows(
    colMeans(do.call(rbind, c14_rating_clara))
  ) %>%
  bind_rows(
    colMeans(do.call(rbind, c15_rating_clara))
  ) %>%
  mutate(num_clusters = 2:15, 
         metodo = "clara")

erro_cl_prop_clara <- colMeans(do.call(rbind, c2_prop_clara)) %>% 
  bind_rows(
    colMeans(do.call(rbind, c3_prop_clara))
  ) %>% 
  bind_rows(
    colMeans(do.call(rbind, c4_prop_clara))
  ) %>% 
  bind_rows(
    colMeans(do.call(rbind, c5_prop_clara))
  ) %>% 
  bind_rows(
    colMeans(do.call(rbind, c6_prop_clara))
  ) %>%
  bind_rows(
    colMeans(do.call(rbind, c7_prop_clara))
  ) %>%
  bind_rows(
    colMeans(do.call(rbind, c8_prop_clara))
  ) %>%
  bind_rows(
    colMeans(do.call(rbind, c9_prop_clara))
  ) %>%
  bind_rows(
    colMeans(do.call(rbind, c10_prop_clara))
  ) %>%
  bind_rows(
    colMeans(do.call(rbind, c11_prop_clara))
  ) %>%
  bind_rows(
    colMeans(do.call(rbind, c12_prop_clara))
  ) %>%
  bind_rows(
    colMeans(do.call(rbind, c13_prop_clara))
  ) %>%
  bind_rows(
    colMeans(do.call(rbind, c14_prop_clara))
  ) %>%
  bind_rows(
    colMeans(do.call(rbind, c15_prop_clara))
  ) %>%
  mutate(num_clusters = 2:15,
         metodo = "clara")

###
erro_cl_rating_kmeans <- colMeans(do.call(rbind, c2_rating_kmeans)) %>% 
  bind_rows(
    colMeans(do.call(rbind, c3_rating_kmeans))
  ) %>% 
  bind_rows(
    colMeans(do.call(rbind, c4_rating_kmeans))
  ) %>% 
  bind_rows(
    colMeans(do.call(rbind, c5_rating_kmeans))
  ) %>% 
  bind_rows(
    colMeans(do.call(rbind, c6_rating_kmeans))
  ) %>% 
  bind_rows(
    colMeans(do.call(rbind, c7_rating_kmeans))
  ) %>% 
  bind_rows(
    colMeans(do.call(rbind, c8_rating_kmeans))
  ) %>% 
  bind_rows(
    colMeans(do.call(rbind, c9_rating_kmeans))
  ) %>% 
  bind_rows(
    colMeans(do.call(rbind, c10_rating_kmeans))
  ) %>% 
  bind_rows(
    colMeans(do.call(rbind, c11_rating_kmeans))
  ) %>% 
  bind_rows(
    colMeans(do.call(rbind, c12_rating_kmeans))
  ) %>% 
  bind_rows(
    colMeans(do.call(rbind, c13_rating_kmeans))
  ) %>% 
  bind_rows(
    colMeans(do.call(rbind, c14_rating_kmeans))
  ) %>% 
  bind_rows(
    colMeans(do.call(rbind, c15_rating_kmeans))
  ) %>% 
  mutate(num_clusters = 2:15, 
         metodo = "kmeans")

erro_cl_prop_kmeans <- colMeans(do.call(rbind, c2_prop_kmeans)) %>% 
  bind_rows(
    colMeans(do.call(rbind, c3_prop_kmeans))
  ) %>% 
  bind_rows(
    colMeans(do.call(rbind, c4_prop_kmeans))
  ) %>% 
  bind_rows(
    colMeans(do.call(rbind, c5_prop_kmeans))
  ) %>% 
  bind_rows(
    colMeans(do.call(rbind, c6_prop_kmeans))
  ) %>% 
  bind_rows(
    colMeans(do.call(rbind, c7_prop_kmeans))
  ) %>% 
  bind_rows(
    colMeans(do.call(rbind, c8_prop_kmeans))
  ) %>% 
  bind_rows(
    colMeans(do.call(rbind, c9_prop_kmeans))
  ) %>% 
  bind_rows(
    colMeans(do.call(rbind, c10_prop_kmeans))
  ) %>% 
  bind_rows(
    colMeans(do.call(rbind, c11_prop_kmeans))
  ) %>% 
  bind_rows(
    colMeans(do.call(rbind, c12_prop_kmeans))
  ) %>% 
  bind_rows(
    colMeans(do.call(rbind, c13_prop_kmeans))
  ) %>% 
  bind_rows(
    colMeans(do.call(rbind, c14_prop_kmeans))
  ) %>% 
  bind_rows(
    colMeans(do.call(rbind, c15_prop_kmeans))
  ) %>% 
  mutate(num_clusters = 2:15,
         metodo = "kmeans")



erro <- test_error %>% 
  t() %>% 
  as.data.frame() %>% 
  mutate(num_clusters = 0,
         Tipo_cluster = "Nenhum") %>% 
  bind_rows(
    erro_cl_rating_clara %>% 
      mutate(Tipo_cluster = "Rating")) %>% 
  bind_rows(
    erro_cl_prop_clara %>% 
      mutate(Tipo_cluster = "Proporção")) %>% 
  bind_rows(
    erro_cl_rating_kmeans %>% 
      mutate(Tipo_cluster = "Rating")) %>% 
  bind_rows(
    erro_cl_prop_kmeans %>% 
      mutate(Tipo_cluster = "Proporção"))

erro %>% 
  arrange_at(vars(1:3)) %>% 
  select(Tipo_cluster, num_clusters, everything()) %>% 
  write.csv("R/Erro_recomendacao_15clusters.csv", row.names = F)
