# Cluster com k-means

# Com rating médio

# Imputando NA com média da coluna
dados2_imputados <- dados2 %>% 
  mutate_all(function(x){case_when(
    is.na(x) ~ mean(x, na.rm = T),
    T ~ x
  )}
  ) 

for(i in 2:15){
  assign(paste0("kmeans_", i, '_clusters_rating'), 
         kmeans(dados2_imputados, i, iter.max = 20, algorithm = "MacQueen"))
}

## Com proporção de filmes assistidos

# Imputando NA
dados3_imputados <- dados3 %>% 
  mutate_all(function(x){case_when(
    is.na(x) ~ mean(x, na.rm = T),
    T ~ x
  )}
  ) 

for(i in 2:15){
  assign(paste0("kmeans_", i, '_clusters_prop'), 
         kmeans(dados3_imputados, i, iter.max = 20, algorithm = "MacQueen"))
}

