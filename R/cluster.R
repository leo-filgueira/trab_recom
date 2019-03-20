require(data.table)
require(dplyr)
require(tidyr)
require(cluster)
require(tibble)

set.seed(123)

filmes <- data.table(do.call(rbind, strsplit(readLines('C:\\Users\\leo-f\\Desktop\\Leonardo\\UFF\\TCC\\trab_recom\\Dados\\ml-1m\\movies.dat'),'::' )))
names(filmes) <- c("MovieID", "Filme", "Genero")

dados <- data.table(do.call(rbind, strsplit(readLines('C:\\Users\\leo-f\\Desktop\\Leonardo\\UFF\\TCC\\trab_recom\\Dados\\ml-1m\\ratings.dat'),'::' )))
names(dados) <- c("UserID", "MovieID", "Rating", "Timestamp")

not_all_na <- function(x) any(!is.na(x))

ptm_clara_rating <- Sys.time()
  
filmes <- filmes %>% 
  separate(Genero, paste0("g", 1:10), "\\|") %>% 
  select_if(not_all_na) 
  
dados2 <- dados %>%
  left_join(filmes) %>% 
  select(-Timestamp) %>% 
  gather(key, genero, -c(UserID, MovieID, Filme, Rating)) %>% 
  select(-key) %>% 
  mutate(Rating = as.numeric(Rating)) %>% 
  filter(!is.na(genero)) %>% 
  as_data_frame()

dados2 <- dados2 %>% 
  group_by(UserID, genero) %>% 
  summarise(rating_medio = mean(Rating)) %>% 
  spread(genero, rating_medio) %>% 
  as.data.frame() %>% 
  column_to_rownames("UserID")

tempo_clara_rating <- difftime(Sys.time(), ptm_clara_rating, units = "secs")

# library(factoextra)
# fviz_nbclust(dados2, clara, method = "silhouette") +
#   theme_classic()

for(i in 2:15){
  ptm <- Sys.time()
  result <- clara(dados2, i, correct.d = T)
  tempo <- difftime(Sys.time(), ptm, units = "secs")
  
  assign(paste0("lista_clara_", i), result)
  assign(paste0("tempo_clara_rating_", i), tempo + tempo_clara_rating)
}

# Script cm clusters por proporção de filmes assistidos por genero
source("R/Cluster_prop.R")
source("R/Cluster_kmeans.R")

# Script que junta saídas do clara com rating médio no objeto "clusters_rating_clara"
# saída com proporção de filmes vistos no objeto "clusters_prop_clara"
# E "*_kmeans" para os clusters usando kmeans
source("R/junta_clusters.R")

as_tibble(clusters_rating_clara)
as_tibble(clusters_prop_clara)

as_tibble(clusters_rating_kmeans)
as_tibble(clusters_prop_kmeans)

dados2 <- dados2 %>% 
  rownames_to_column("UserID") %>% 
  inner_join(clusters_rating_clara) %>% 
  inner_join(clusters_prop_clara) %>%
  inner_join(clusters_rating_kmeans) %>% 
  inner_join(clusters_prop_kmeans) %>% 
  select(UserID, starts_with("cluster"), everything()) %>% 
  as_tibble()
  
dados_cluster <- dados %>% 
  select(-Timestamp) %>% 
  left_join(
    dados2 %>% 
      select(UserID, contains("cluster"))
  ) %>% 
  as_tibble()
# 
# cluster_splitado <- split(dados, dados$cluster_4)
# 
# cluster1 <- cluster_splitado[[1]]
# cluster2 <- cluster_splitado[[2]]
# cluster3 <- cluster_splitado[[3]]
# cluster4 <- cluster_splitado[[4]]

matriz_full <- dados_cluster %>% 
  select(UserID, MovieID, Rating) %>%
  mutate(Rating = as.numeric(Rating)) %>% 
  spread(MovieID, Rating)

matriz_full %>% 
  select(-1) %>% 
  summarise_all(function(x){sum(!is.na(x))}) %>% 
  rowSums() %>% 
  (function(x){x/sum(is.na(matriz_full[, -1]))})
# Proprorção de ratings em relação aos itens não avaliados: 0.04677364