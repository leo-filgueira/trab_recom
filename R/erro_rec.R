## Erro com todo mundo

teste <- as(dados, "realRatingMatrix")

min(rowCounts(teste))

model_train_scheme <- evaluationScheme(teste, train = 0.7, goodRating = 3, given = 18)

model <- getData(model_train_scheme, "train") %>% #only fit on the 75% training data.
  Recommender(method = "UBCF", parameter = list(method = "pearson"))

model_pred <- predict(model, getData(model_train_scheme, "known"), type = "ratings")
test_error <- calcPredictionAccuracy(model_pred, getData(model_train_scheme, "unknown"), byUser = TRUE)

head(test_error)
summary(test_error)

## Erro com clusters

# Cluster 1
cluster1 <- cluster1 %>% 
  select(-cluster) %>% 
  as.data.frame()
  
teste <- as(cluster1, "realRatingMatrix")

min(rowCounts(teste))

model_train_scheme <- evaluationScheme(teste, train = 0.7, goodRating = 3, given = 18)

model1 <- getData(model_train_scheme, "train") %>% #only fit on the 75% training data.
  Recommender(method = "UBCF", parameter = list(method = "pearson"))

model1_pred <- predict(model1, getData(model_train_scheme, "known"), type = "ratings")
test_error_cl1 <- calcPredictionAccuracy(model1_pred, getData(model_train_scheme, "unknown"), byUser = TRUE)

head(test_error_cl1)
summary(test_error_cl1)

# Cluster 2
cluster2 <- cluster2 %>% 
  select(-cluster) %>% 
  as.data.frame()

teste <- as(cluster2, "realRatingMatrix")

min(rowCounts(teste))

model_train_scheme <- evaluationScheme(teste, train = 0.7, goodRating = 3, given = 18)

model2 <- getData(model_train_scheme, "train") %>% #only fit on the 75% training data.
  Recommender(method = "UBCF", parameter = list(method = "pearson"))

model2_pred <- predict(model2, getData(model_train_scheme, "known"), type = "ratings")
test_error_cl2 <- calcPredictionAccuracy(model2_pred, getData(model_train_scheme, "unknown"), byUser = TRUE)

head(test_error_cl2)
summary(test_error_cl2)

# Cluster 3
cluster3 <- cluster3 %>% 
  select(-cluster) %>% 
  as.data.frame()

teste <- as(cluster3, "realRatingMatrix")

min(rowCounts(teste))

model_train_scheme <- evaluationScheme(teste, train = 0.7, goodRating = 3, given = 18)

model3 <- getData(model_train_scheme, "train") %>% #only fit on the 75% training data.
  Recommender(method = "UBCF", parameter = list(method = "pearson"))

model3_pred <- predict(model3, getData(model_train_scheme, "known"), type = "ratings")
test_error_cl3 <- calcPredictionAccuracy(model3_pred, getData(model_train_scheme, "unknown"), byUser = TRUE)

head(test_error_cl3)
summary(test_error_cl3)

# Cluster 4
cluster4 <- cluster4 %>% 
  select(-cluster) %>% 
  as.data.frame()

teste <- as(cluster4, "realRatingMatrix")

min(rowCounts(teste))

model_train_scheme <- evaluationScheme(teste, train = 0.7, goodRating = 3, given = 18)

model4 <- getData(model_train_scheme, "train") %>% #only fit on the 75% training data.
  Recommender(method = "UBCF", parameter = list(method = "pearson"))

model4_pred <- predict(model4, getData(model_train_scheme, "known"), type = "ratings")
test_error_cl4 <- calcPredictionAccuracy(model4_pred, getData(model_train_scheme, "unknown"), byUser = TRUE)

head(test_error_cl4)
summary(test_error_cl4)
