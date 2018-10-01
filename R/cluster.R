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

# dados2 %>% 
#   filter(is.na(genero))

dados2 <- dados2 %>% 
  group_by(UserID, genero) %>% 
  summarise(rating_medio = mean(Rating)) %>% 
  spread(genero, rating_medio) %>% 
  as.data.frame() %>% 
  column_to_rownames("UserID")

# library(factoextra)
# fviz_nbclust(dados2, clara, method = "silhouette") +
#   theme_classic()

lista_clara_2 <- clara(dados2, 2, correct.d = T)
lista_clara_3 <- clara(dados2, 3, correct.d = T)
lista_clara_4 <- clara(dados2, 4, correct.d = T)
lista_clara_5 <- clara(dados2, 5, correct.d = T)

# print(lista_clara)
# head(as.data.frame(lista_clara$clustering))

# lista_clara$medoids

clusters <- lista_clara_2$clustering %>% 
  as.data.frame() %>% 
  rownames_to_column("UserID") %>% 
  select(UserID, cluster_2 = 2) %>% 
  inner_join(
    lista_clara_3$clustering %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_3 = 2)
  ) %>% 
  inner_join(
    lista_clara_4$clustering %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_4 = 2)
  ) %>% 
  inner_join(
    lista_clara_5$clustering %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_5 = 2)
  )

dados2 <- dados2 %>% 
  rownames_to_column("UserID") %>% 
  inner_join(clusters) %>% 
  select(UserID, starts_with("cluster"), everything()) %>% 
  as_tibble()
  
# aov(Comedy~cluster, data = dados2)
# kruskal.test(Comedy~cluster, data = dados2)
# apply(dados2[, -c(1, 2)], 2, function(x){summary(aov(x~dados2$cluster))})

dados <- dados %>% 
  select(-Timestamp) %>% 
  left_join(
    dados2 %>% 
      select(UserID, contains("cluster"))
  ) %>% 
  as_tibble()

cluster_splitado <- split(dados, dados$cluster_4)

cluster1 <- cluster_splitado[[1]]
cluster2 <- cluster_splitado[[2]]
cluster3 <- cluster_splitado[[3]]
cluster4 <- cluster_splitado[[4]]

