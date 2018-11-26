# Junta clusters

clusters_rating_clara <- lista_clara_2$clustering %>% 
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
  ) %>% 
  inner_join(
    lista_clara_6$clustering %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_6_rating = 2)
  ) %>% 
  inner_join(
    lista_clara_7$clustering %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_7_rating = 2)
  ) %>% 
  inner_join(
    lista_clara_8$clustering %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_8_rating = 2)
  ) %>% 
  inner_join(
    lista_clara_9$clustering %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_9_rating = 2)
  ) %>% 
  inner_join(
    lista_clara_10$clustering %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_10_rating = 2)
  ) %>% 
  inner_join(
    lista_clara_11$clustering %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_11_rating = 2)
  ) %>% 
  inner_join(
    lista_clara_12$clustering %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_12_rating = 2)
  ) %>% 
  inner_join(
    lista_clara_13$clustering %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_13_rating = 2)
  ) %>% 
  inner_join(
    lista_clara_14$clustering %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_14_rating = 2)
  ) %>% 
  inner_join(
    lista_clara_15$clustering %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_15_rating = 2)
  ) 

clusters_prop_clara <- lista_clara_2_prop$clustering %>% 
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
  ) %>% 
  inner_join(
    lista_clara_6_prop$clustering %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_6_prop = 2)
  ) %>% 
  inner_join(
    lista_clara_7_prop$clustering %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_7_prop = 2)
  ) %>% 
  inner_join(
    lista_clara_8_prop$clustering %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_8_prop = 2)
  ) %>% 
  inner_join(
    lista_clara_9_prop$clustering %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_9_prop = 2)
  ) %>% 
  inner_join(
    lista_clara_10_prop$clustering %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_10_prop = 2)
  ) %>% 
  inner_join(
    lista_clara_11_prop$clustering %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_11_prop = 2)
  ) %>% 
  inner_join(
    lista_clara_12_prop$clustering %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_12_prop = 2)
  ) %>% 
  inner_join(
    lista_clara_13_prop$clustering %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_13_prop = 2)
  ) %>% 
  inner_join(
    lista_clara_14_prop$clustering %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_14_prop = 2)
  ) %>% 
  inner_join(
    lista_clara_15_prop$clustering %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_15_prop = 2)
  )


clusters_rating_kmeans <- kmeans_2_clusters_rating$cluster %>% 
  as.data.frame() %>% 
  rownames_to_column("UserID") %>% 
  select(UserID, cluster_2_kmeans_rating = 2) %>% 
  inner_join(
    kmeans_3_clusters_rating$cluster %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_3_kmeans_rating = 2)
  ) %>% 
  inner_join(
    kmeans_4_clusters_rating$cluster %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_4_kmeans_rating = 2)
  ) %>% 
  inner_join(
    kmeans_5_clusters_rating$cluster %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_5_kmeans_rating = 2)
  ) %>% 
  inner_join(
    kmeans_6_clusters_rating$cluster %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_6_kmeans_rating = 2)
  ) %>% 
  inner_join(
    kmeans_7_clusters_rating$cluster %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_7_kmeans_rating = 2)
  ) %>% 
  inner_join(
    kmeans_8_clusters_rating$cluster %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_8_kmeans_rating = 2)
  ) %>% 
  inner_join(
    kmeans_9_clusters_rating$cluster %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_9_kmeans_rating = 2)
  ) %>% 
  inner_join(
    kmeans_10_clusters_rating$cluster %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_10_kmeans_rating = 2)
  ) %>% 
  inner_join(
    kmeans_11_clusters_rating$cluster %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_11_kmeans_rating = 2)
  ) %>% 
  inner_join(
    kmeans_12_clusters_rating$cluster %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_12_kmeans_rating = 2)
  ) %>% 
  inner_join(
    kmeans_13_clusters_rating$cluster %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_13_kmeans_rating = 2)
  ) %>% 
  inner_join(
    kmeans_14_clusters_rating$cluster %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_14_kmeans_rating = 2)
  ) %>% 
  inner_join(
    kmeans_15_clusters_rating$cluster %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_15_kmeans_rating = 2)
  )

clusters_prop_kmeans <- kmeans_2_clusters_prop$cluster %>% 
  as.data.frame() %>% 
  rownames_to_column("UserID") %>% 
  select(UserID, cluster_2_kmeans_prop = 2) %>% 
  inner_join(
    kmeans_3_clusters_prop$cluster %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_3_kmeans_prop = 2)
  ) %>% 
  inner_join(
    kmeans_4_clusters_prop$cluster %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_4_kmeans_prop = 2)
  ) %>% 
  inner_join(
    kmeans_5_clusters_prop$cluster %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_5_kmeans_prop = 2)
  ) %>% 
  inner_join(
    kmeans_6_clusters_prop$cluster %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_6_kmeans_prop = 2)
  ) %>% 
  inner_join(
    kmeans_7_clusters_prop$cluster %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_7_kmeans_prop = 2)
  ) %>% 
  inner_join(
    kmeans_8_clusters_prop$cluster %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_8_kmeans_prop = 2)
  ) %>% 
  inner_join(
    kmeans_9_clusters_prop$cluster %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_9_kmeans_prop = 2)
  ) %>% 
  inner_join(
    kmeans_10_clusters_prop$cluster %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_10_kmeans_prop = 2)
  ) %>% 
  inner_join(
    kmeans_11_clusters_prop$cluster %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_11_kmeans_prop = 2)
  ) %>% 
  inner_join(
    kmeans_12_clusters_prop$cluster %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_12_kmeans_prop = 2)
  ) %>% 
  inner_join(
    kmeans_13_clusters_prop$cluster %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_13_kmeans_prop = 2)
  ) %>% 
  inner_join(
    kmeans_14_clusters_prop$cluster %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_14_kmeans_prop = 2)
  ) %>% 
  inner_join(
    kmeans_15_clusters_prop$cluster %>% 
      as.data.frame() %>% 
      rownames_to_column("UserID") %>% 
      select(UserID, cluster_15_kmeans_prop = 2)
  )