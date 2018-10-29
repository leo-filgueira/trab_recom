# Junta clusters

clusters_rating <- lista_clara_2$clustering %>% 
  as.data.frame() %>% 
  rownames_to_column("UserID") %>% 
  select(UserID, cluster_2_rating = 2) %>% 
  inner_join(
    lista_clara_3$clustering %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_3_rating = 2)
  ) %>% 
  inner_join(
    lista_clara_4$clustering %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_4_rating = 2)
  ) %>% 
  inner_join(
    lista_clara_5$clustering %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_5_rating = 2)
  ) 

clusters_prop <- lista_clara_2_prop$clustering %>% 
  as.data.frame() %>% 
  rownames_to_column("UserID") %>% 
  select(UserID, cluster_2_prop = 2) %>% 
  inner_join(
    lista_clara_3_prop$clustering %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_3_prop = 2)
  ) %>% 
  inner_join(
    lista_clara_4_prop$clustering %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_4_prop = 2)
  ) %>% 
  inner_join(
    lista_clara_5_prop$clustering %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_5_prop = 2)
  ) 
