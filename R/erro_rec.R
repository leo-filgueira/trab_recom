source("R/fun_cluster.R")

## Erro com todo mundo

rmatrix <- as(dados %>% 
                select(-Timestamp) %>% 
                # select(-contains("cluster")) %>% 
                as.data.frame(), "realRatingMatrix")

min(rowCounts(rmatrix))
ptm <- Sys.time()
model_train_scheme <- evaluationScheme(rmatrix, train = 0.7, goodRating = 4, given = 18)

model <- getData(model_train_scheme, "train") %>% #only fit on the 70% training data.
  Recommender(method = "UBCF", parameter = list(method = "pearson"))

model_pred <- predict(model, getData(model_train_scheme, "known"), type = "ratings")
test_error <- calcPredictionAccuracy(model_pred, getData(model_train_scheme, "unknown"), byUser = F)
tempo_total <- difftime(Sys.time(), ptm, units = "secs")
head(test_error)
summary(test_error)


## Erro com clusters
# Erros com cluster CLARA a partir do rating
ptm <- Sys.time()
c2_rating_clara <- erro_cluster(dados_cluster, cluster_2_rating)
tempo_clara_rating_2 <- tempo_clara_rating_2 + 
  difftime(Sys.time(), ptm, units = "secs")
c2_rating_clara

ptm <- Sys.time()
c3_rating_clara <- erro_cluster(dados_cluster, cluster_3_rating)
tempo_clara_rating_3 <- tempo_clara_rating_3 + 
  difftime(Sys.time(), ptm, units = "secs")
c3_rating_clara

ptm <- Sys.time()
c4_rating_clara <- erro_cluster(dados_cluster, cluster_4_rating)
tempo_clara_rating_4 <- tempo_clara_rating_4 + 
  difftime(Sys.time(), ptm, units = "secs")
c4_rating_clara

ptm <- Sys.time()
c5_rating_clara <- erro_cluster(dados_cluster, cluster_5_rating)
tempo_clara_rating_5 <- tempo_clara_rating_5 + 
  difftime(Sys.time(), ptm, units = "secs")
c5_rating_clara

ptm <- Sys.time()
c6_rating_clara <- erro_cluster(dados_cluster, cluster_6_rating)
tempo_clara_rating_6 <- tempo_clara_rating_6 + 
  difftime(Sys.time(), ptm, units = "secs")
c6_rating_clara

ptm <- Sys.time()
c7_rating_clara <- erro_cluster(dados_cluster, cluster_7_rating)
tempo_clara_rating_7 <- tempo_clara_rating_7 + 
  difftime(Sys.time(), ptm, units = "secs")
c7_rating_clara

ptm <- Sys.time()
c8_rating_clara <- erro_cluster(dados_cluster, cluster_8_rating)
tempo_clara_rating_8 <- tempo_clara_rating_8 + 
  difftime(Sys.time(), ptm, units = "secs")
c8_rating_clara

ptm <- Sys.time()
c9_rating_clara <- erro_cluster(dados_cluster, cluster_9_rating)
tempo_clara_rating_9 <- tempo_clara_rating_9 + 
  difftime(Sys.time(), ptm, units = "secs")
c9_rating_clara

ptm <- Sys.time()
c10_rating_clara <- erro_cluster(dados_cluster, cluster_10_rating)
tempo_clara_rating_10 <- tempo_clara_rating_10 + 
  difftime(Sys.time(), ptm, units = "secs")
c10_rating_clara

ptm <- Sys.time()
c11_rating_clara <- erro_cluster(dados_cluster, cluster_11_rating)
tempo_clara_rating_11 <- tempo_clara_rating_11 + 
  difftime(Sys.time(), ptm, units = "secs")
c11_rating_clara

ptm <- Sys.time()
c12_rating_clara <- erro_cluster(dados_cluster, cluster_12_rating)
tempo_clara_rating_12 <- tempo_clara_rating_12 + 
  difftime(Sys.time(), ptm, units = "secs")
c12_rating_clara

ptm <- Sys.time()
c13_rating_clara <- erro_cluster(dados_cluster, cluster_13_rating)
tempo_clara_rating_13 <- tempo_clara_rating_13 + 
  difftime(Sys.time(), ptm, units = "secs")
c13_rating_clara

ptm <- Sys.time()
c14_rating_clara <- erro_cluster(dados_cluster, cluster_14_rating)
tempo_clara_rating_14 <- tempo_clara_rating_14 + 
  difftime(Sys.time(), ptm, units = "secs")
c14_rating_clara

ptm <- Sys.time()
c15_rating_clara <- erro_cluster(dados_cluster, cluster_15_rating)
tempo_clara_rating_15 <- tempo_clara_rating_15 + 
  difftime(Sys.time(), ptm, units = "secs")
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

