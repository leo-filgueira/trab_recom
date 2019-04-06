# Roteiro

# Importação das bases
source("R/cluster.R")

# Partição da base, modelagem, predição e cálculo do erro
source("R/erro_rec.R")

# Tabela com os erros
erro %>% 
  arrange_at(vars(1:3)) %>% 
  select(metodo, Tipo_cluster, Clusters = num_clusters, everything()) %>% 
  mutate_at(vars(4:6), funs(round(., 4)))
