## k-means algorithm pure in R -------------------------------------------------
## Author: Wagner Hugo Bonat LEG/UFPR ------------------------------------------
## Date: 04/04/2021 ------------------------------------------------------------

## Carregando data set

dados <- read.table("Country-data.csv", header = TRUE, sep = ",", dec = ".")
with(dados, plot(child_mort ~ life_expec, pch = grupos))
data <- dados[,c("child_mort", "life_expec")]
data
n <- dim(data)[1]

### Algoritmo

# Passo 1: Definir o número de clusters
k = 2

# Passo 2: Inicializar o algoritmo (estratégia Random partition)
data$grupo <- as.factor(rbinom(n = n, size = 1, prob = 0.5))

# Passo 3: Calcular a media de cada covariável por grupo
media_grupo <- aggregate(data[, 1:2], list(data$grupo), mean)

# Passo 4: Calcula a distãncia de cada ponto até o centróide de cada grupo
my_dist <- function(dados, media) {
  out <- apply(dados[,1:2], 1, function(x, media) {sqrt(sum((x - media)^2))}, 
        media = media)
  return(out)
}
temp1 <- my_dist(dados = data[,1:2], media = media_grupo[1, 2:3])
temp2 <- my_dist(dados = data[,1:2], media = media_grupo[2, 2:3])
data$grupo_temp <- as.factor(apply(data.frame(temp1, temp2), 1, which.max))

# Repetir até algum critério de parada ser atingido
grupos <- matrix(NA, ncol = 20, nrow = n)
grupos[,1] <- data$grupo_temp
for(i in 2:20) {
  media_grupo <- aggregate(data[, 1:2], list(grupos[,]), mean)
  temp1 <- my_dist(dados = data[,1:2], media = media_grupo[1, 2:3])
  temp2 <- my_dist(dados = data[,1:2], media = media_grupo[2, 2:3])
  grupos[,i] <- as.factor(apply(data.frame(temp1, temp2), 1, which.max))
  if(sum(abs(grupos[,i] - grupos[,c(i-1)])) == 0) break
}

data$grupo <- grupos[, 3]
grupos

kmeans(x = data[,1:2], 2)

my_kmeans <- function(data, k, max_iter = 20) {
  # Inicializando
  n <- dim(data)[1]
  data$grupo <- as.factor(rbinom(n = n, size = 1, prob = 0.5))
  grupos <- matrix(NA, ncol = max_iter, nrow = n)
  grupos[,1] <- data$grupo
  for(i in 2:max_iter) {
    media_grupo <- aggregate(data[, 1:2], list(data$grupo), mean)
    temp1 <- my_dist(dados = data[,1:2], media = media_grupo[1, 2:3])
    temp2 <- my_dist(dados = data[,1:2], media = media_grupo[2, 2:3])
    print(sum(temp1))
    print(sum(temp2))
    grupos[,i] <- as.factor(apply(data.frame(temp1, temp2), 1, which.min))
    data$grupo <- grupos[,i]
    criterio <- sum(abs(grupos[,i] - grupos[,c(i-1)]))
    if(criterio == 0) break
    print(criterio)
  }

}

head(grupos)
media_grupo
tt <- kmeans(data[,1:2], centers = 2)

data.frame(tt$cluster, data$grupo)
