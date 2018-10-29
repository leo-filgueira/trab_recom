# Cluster com proporção de filmes por genero

dados3 <- dados %>%
  left_join(filmes) %>% 
  select(-Timestamp) %>% 
  gather(key, genero, -c(UserID, MovieID, Filme, Rating)) %>% 
  select(-key) %>% 
  filter(!is.na(genero)) %>% 
  as_data_frame()

dados3 <- dados3 %>% 
  group_by(UserID) %>% 
  count(genero) %>% 
  mutate(proporcao = n/sum(n)) %>% 
  select(-n) %>% 
  spread(genero, proporcao) %>% 
  as.data.frame() %>% 
  column_to_rownames("UserID")

# library(factoextra)
# fviz_nbclust(dados3, clara, method = "silhouette") +
#   theme_classic()

for(i in 2:5){
  assign(paste0("lista_clara_", i, "_prop"), clara(dados3, i, correct.d = T))
}
