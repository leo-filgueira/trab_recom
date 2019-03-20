require(tidyverse)
require(ggthemes)
require(recommenderlab)

dist_rating <- dados %>% 
  count(UserID) %>% 
  ggplot(aes(x = n)) + 
  geom_histogram(aes(y = ..density..), color = "black") + 
  theme_minimal() + 
  labs(x = "Número de avaliações", y = "Densidade",
       title = "Distribuição do número de filmes avaliados pelos usuários")

ggsave("Distribuicao_ratings.png", plot = dist_rating, 
       path = "R/img/", width = 6, height = 4)

dados %>% 
  count(UserID) %>% 
  # select(n) %>% 
  # summary()
  summarise(media = mean(n), median = median(n),
            variancia = var(n), desv_pad = sd(n),
            coef_var = desv_pad/media)

filmes %>% 
  as_tibble()

dados %>% 
  count(MovieID) %>% 
  arrange(-n) %>% 
  slice(1:20) %>% 
  left_join(
    filmes %>% 
      select(MovieID, Filme)
  ) %>% 
  select(Filme, n)# %>% 
  # write.csv2("R/csv/top20_filmes.csv", row.names = F)

filmes_ratings <- dados %>% 
  count(MovieID) %>% 
  ggplot(aes(x = n)) + 
  geom_histogram(aes(y = ..density..), color = "black") + 
  theme_minimal() + 
  labs(x = "Número de avaliações", y = "Densidade",
       title = "Distribuição do número de avaliações recebidas pelos filmes")

ggsave("ratings_filmes.png", plot = filmes_ratings, 
       path = "R/img/", width = 6, height = 4)

dados %>%
  count(MovieID) %>% 
  summarise(minimo = min(n), media = mean(n), 
            median = median(n), maximo = max(n),
            variancia = var(n), desv_pad = sd(n),
            coef_var = desv_pad/media)


filmes %>% 
  as_data_frame() %>% 
  gather(key, Genero, -MovieID, -Filme) %>% 
  count(Genero) %>% 
  # write.csv2("R/csv/generos.csv", row.names = F)
  filter(!is.na(Genero)) %>% 
  left_join(
    dados %>%
      left_join(filmes) %>% 
      as_tibble() %>% 
      select(UserID, MovieID, starts_with("g")) %>% 
      gather(key, Genero, -UserID, -MovieID) %>% 
      select(-key) %>% 
      group_by(Genero) %>% 
      summarise(prop = round(n_distinct(UserID)/n_distinct(dados$UserID), 4))
  ) %>% 
  write.csv("R/generos_proporcao.csv", row.names = F)


rating_medio_genero <- dados2 %>% 
  select(Action:Western) %>% 
  gather(Genero, Rating) %>% 
  ggplot(aes(x = Genero, y = Rating)) + 
  geom_boxplot() +
  theme_minimal() + 
  labs(x = "Gênero", title = "Nota média recebida por gênero")

ggsave("rating_medio_genero.png", plot = rating_medio_genero, 
       path = "R/img/", width = 11, height = 5)


####

set.seed(123)
# Usuário sorteado
id <- dados %>% 
  count(UserID) %>% 
  filter(n == 20) %>% 
  sample_n(1) %>% 
  pull(UserID)

filmes2 <- data.table::data.table(do.call(rbind, strsplit(readLines('C:\\Users\\leo-f\\Desktop\\Leonardo\\UFF\\TCC\\trab_recom\\Dados\\ml-1m\\movies.dat'),'::' )))
names(filmes2) <- c("MovieID", "Filme", "Genero")

getData(model_train_scheme, "train") %>% 
  as("matrix") %>% 
  as.data.frame() %>% 
  rownames_to_column("UserID") %>% 
  filter(UserID == id) %>% 
  as_tibble() %>% 
  gather(MovieID, rating, -UserID) %>% 
  filter(!is.na(rating)) %>% 
  left_join(
    filmes2 %>% 
      select(MovieID, Filme, Genero)) %>% 
  arrange(desc(rating)) %>%  
  write.csv("R/csv/usuario.csv", row.names = F)

m_pred %>% 
  as("matrix") %>% 
  as.data.frame() %>% 
  rownames_to_column("UserID") %>% 
  filter(UserID == id) %>% 
  gather(MovieID, rating, -UserID) %>% 
  as_data_frame() %>% 
  arrange(-rating) %>%
  slice(1:10) %>%
  left_join(
    filmes2 %>% 
      select(MovieID, Filme, Genero)
  ) %>% 
  select(-contains("ID")) %>% 
  select(-rating, rating) %>% 
  write.csv("R/csv/recom_usuario.csv", row.names = F)
