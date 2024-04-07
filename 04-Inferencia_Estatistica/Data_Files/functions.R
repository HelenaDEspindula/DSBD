## Functions for fitting neural network ----------------------------------------
## Author: Wagner Hugo Bonat LEG/UFPR ------------------------------------------
## Date: 08/04/2021 ------------------------------------------------------------

## Função de ativação e sua derivada
act_fc <- function(beta, X, derivative = FALSE) {
  eta <- X%*%beta
  mu <- 1/(1+exp(-eta))
  output <- list("mu" = mu)
  if(derivative == TRUE) {
    derivada <- mu*(1-mu)
    D <- list()
    for(i in 1:dim(derivada)[2]) {
      D[[i]] <- derivada[,i]*X
    }
    output$D_mu <- D
  }
  return(output)
}

## Modelo
## Neural network
neural_net <- function(w, X, n_hidden = 2) {
  n_weight <- dim(X)[2] ## Qts pesos em cada neuronio
  n_param <- length(w) ## Qtd total de parametros
  w_E <- w[1:c(n_hidden*n_weight)]
  W_E <- matrix(w_E, ncol = n_hidden) # Forma matricial
  w_h <- w[c(n_hidden*n_weight+1):n_param]
  mu <- act_fc(beta = W_E, X = X)
  H <- model.matrix(~ mu$mu)
  y_hat <- H%*%w_h
  return(y_hat)
}

## Simula da rede neural
simula_nn <- function(formula, w, n_hidden = 2, data = data) {
  X <- model.matrix(as.formula(formula), data = data)
  n_weight <- dim(X)[2] ## Qts pesos em cada neuronio
  n_param <- length(w) ## Qtd total de parametros
  w_E <- w[1:c(n_hidden*n_weight)]
  W_E <- matrix(w_E, ncol = n_hidden) # Forma matricial
  w_h <- w[c(n_hidden*n_weight+1):n_param]
  mu <- act_fc(beta = W_E, X = X)
  H <- model.matrix(~ mu$mu)
  y_hat <- H%*%w_h
  data$y <- rnorm(n = length(y_hat), mean = y_hat, sd = 4)
  return(data)
}

## Função objetivo
SQ <- function(w, X, Y, n_hidden = 2) {
  y_hat <- neural_net(w = w, X = X, n_hidden = 2)
  out <- 0.5*sum((Y - y_hat)^2)
  return(out)
}

# Gradiente analitico
gradiente <- function(w, X, Y, n_hidden = 2) {
  n_weight <- dim(X)[2] ## Qts pesos em cada neuronio
  n_param <- length(w) ## Qtd total de parametros
  w_E <- w[1:c(n_hidden*n_weight)]
  W_E <- matrix(w_E, ncol = n_hidden) # Forma matricial
  w_h <- w[c(n_hidden*n_weight+1):n_param]
  mu <- act_fc(beta = W_E, X = X, derivative = TRUE)
  H <- model.matrix(~ mu$mu)
  y_hat <- H%*%w_h
  res <- as.numeric(-(Y - y_hat))
  grad <- list()
  for(i in 1:c(length(w_h)-1)) {
    grad[[i]] <- res*mu$D_mu[[i]]*w_h[c(i+1)]
  }
  output <- colSums(cbind(do.call(cbind, grad), res*H))
  #output <- colSums(cbind(res*mu$D_mu[,1:3]*w_h[2], res*mu$D_mu[,4:6]*w_h[3], res*H))
  return(output)
}

## Gradiente descendente
grad_des <- function(fx, x1, alpha, max_iter = 10, tol = 1e-02, ...) {
  solucao <- matrix(NA, ncol = length(x1), nrow = max_iter)
  solucao[1,] <- x1
  obj <- c()
  for(i in 1:c(max_iter-1)) {
    solucao[i+1,] <- solucao[i,] - alpha*fx(solucao[i,], ...)
    #solucao[i+1,] <- solucao[i,] - alpha*fx(solucao[i,], X = X, Y = dados$y)
    #print(solucao[i+1,])
    obj[c(i+1)] <- SQ(w = solucao[i+1,], ...)
    #obj[c(i+1)] <- SQ(w = solucao[i+1,], X = X, Y = dados$y)
    #if(sum(abs(fx(solucao[i+1,], ...) - fx(solucao[i,], ...))) < tol) break
    if(all(abs(fx(solucao[i+1,], ...))) < tol) break
  }
  return(list("solucao" = solucao, "Objetivo" = obj))
}
