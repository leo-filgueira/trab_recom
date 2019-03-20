# Cluster com k-means

# Com rating médio
ptm_kmeans_rating <- Sys.time()
# Imputando NA com média da coluna
dados2_imputados <- dados2 %>% 
  mutate_all(function(x){case_when(
    is.na(x) ~ mean(x, na.rm = T),
    T ~ x
  )}
  ) 

tempo_kmeans_rating <- difftime(Sys.time(), ptm_kmeans_rating, units = "secs") + tempo_clara_rating

for(i in 2:15){
  ptm <- Sys.time()
  result <- kmeans(dados2_imputados, i, iter.max = 20, algorithm = "MacQueen")
  tempo <- difftime(Sys.time(), ptm, units = "secs")
  
  assign(paste0("kmeans_", i, '_clusters_rating'), result)
  assign(paste0("tempo_kmeans_rating_", i), tempo + tempo_kmeans_rating)
}

## Com proporção de filmes assistidos

# Imputando NA
ptm_kmeans_prop <- Sys.time()
dados3_imputados <- dados3 %>% 
  mutate_all(function(x){case_when(
    is.na(x) ~ mean(x, na.rm = T),
    T ~ x
  )}
  ) 

tempo_kmeans_prop <- difftime(Sys.time(), ptm_kmeans_prop, units = "secs") + tempo_clara_rating

for(i in 2:15){
  ptm <- Sys.time()
  result <- kmeans(dados3_imputados, i, iter.max = 20, algorithm = "MacQueen")
  tempo <- difftime(Sys.time(), ptm, units = "secs")
  
  assign(paste0("kmeans_", i, '_clusters_prop'), result)
  assign(paste0("tempo_kmeans_prop_", i), tempo + tempo_kmeans_prop)
}

