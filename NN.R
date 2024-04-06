## Implmentando uma rede neural do zero ----------------------------------------
## Prof. Wagner Hugo Bonat LEG/UFPR --------------------------------------------
## Data: 07/04/2021 ------------------------------------------------------------
rm(list=ls())

## Carregando funções auxiliares
source("functions.R")

## Simulando dados para a rede neural
# Setando a semente
set.seed(123)

# Tamanho da amostra
n <- 100

## Gerando as covariáveis
x1 <- rnorm(n = n)
x2 <- rnorm(n = n)
dados <- data.frame("x1" = x1, "x2" = x2)

## Parâmetros da primeira camada
w1 <- rnorm(3, mean = 5)
w2 <- rnorm(3, mean = 2)
w3 <- rnorm(3, mean = 10)
w <- c(w1, w2, w3)

## Simulando dados da rede neural
dados <- simula_nn(formula = "~ x1 + x2", w = w, n_hidden = 2, data = dados)

## Opção 1: Tentar minimizar a função objetivo usando qualquer método de otimização
fit1 <- optim(par = w, fn = SQ, method = "Nelder-Mead",
              X = model.matrix(~ x1 + x2, data = dados), 
              Y = dados$y)
fit1$value

fit2 <- optim(par = w, fn = SQ, method = "CG",
              X = model.matrix(~ x1 + x2, data = dados), 
              Y = dados$y)
fit2$value

fit3 <- optim(par = w, fn = SQ, method = "BFGS",
              X = model.matrix(~ x1 + x2, data = dados), 
              Y = dados$y)
fit3$value

fit4 <- optim(par = w, fn = SQ, method = "SANN",
              X = model.matrix(~ x1 + x2, data = dados), 
              Y = dados$y)
fit4$value

rbind(fit1$par, fit2$par, fit3$par, fit4$par)

## Calculando o gradiente numericamente
require(numDeriv)
X <- model.matrix(~ x1 + x2, data = dados)
grad(func = SQ, x = w, X = X, Y = dados$y) # Valor inicial
grad(func = SQ, x = fit1$par, X = X, Y = dados$y)
grad(func = SQ, x = fit2$par, X = X, Y = dados$y)
grad(func = SQ, x = fit3$par, X = X, Y = dados$y)
grad(func = SQ, x = fit4$par, X = X, Y = dados$y)

## Gradiente obtido analiticamente
round(gradiente(w = w, X = X, Y = dados$y) - grad(func = SQ, x = w, X = X, Y = dados$y), 3)
round(gradiente(w = fit1$par, X = X, Y = dados$y) - 
        grad(func = SQ, x = fit1$par, X = X, Y = dados$y), 3)
round(gradiente(w = fit2$par, X = X, Y = dados$y) - 
        grad(func = SQ, x = fit2$par, X = X, Y = dados$y), 3)
round(gradiente(w = fit3$par, X = X, Y = dados$y) - 
        grad(func = SQ, x = fit3$par, X = X, Y = dados$y), 3)
round(gradiente(w = fit4$par, X = X, Y = dados$y) - 
        grad(func = SQ, x = fit4$par, X = X, Y = dados$y), 3)

## Gradiente descendente
set.seed(123)
temp <- grad_des(fx = gradiente, x1 = w, alpha = 0.005, max_iter = 1e+05, 
                 X = model.matrix(~ x1 + x2, data = dados), Y = dados$y)
sum(!is.na(temp$Objetivo))
temp$Objetivo[sum(!is.na(temp$Objetivo))]

require(neuralnet)
fit_nn <- neuralnet(formula = y ~x1 + x2, hidden = 2, 
                    startweights = w,
                    algorithm = "backprop", learningrate = 0.005, 
                    linear.output = TRUE, data = dados)
nn <- c(fit_nn$weights[[1]][[1]][,1],fit_nn$weights[[1]][[1]][,2], fit_nn$weights[[1]][[2]])
rbind(fit1$par, fit2$par, fit3$par, fit4$par, nn, temp$solucao[sum(!is.na(temp$Objetivo)),])
SQ(w = fit3$par, X = X, Y = dados$y)
SQ(w = nn, X = X, Y = dados$y)
SQ(w = temp$solucao[sum(!is.na(temp$Objetivo)),], X = X, Y = dados$y)
gradiente(w = temp$solucao[sum(!is.na(temp$Objetivo)),], X = X, Y = dados$y)


plot(fit_nn)
