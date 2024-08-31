########################################################################
### Dados sobre auditoria na prestação de contas de 3000 indivíduos. 

### As variáveis são as segintes:
### valor: é  o valor da nota (em milhares de dólares) 

### resultado: e a resposta é o resultado da auditoria (1, se a nota tem indício de fraude
### e 0, não tinha indícios). O objetivo é modelar o resultado da auditoria em função
### do valor da nota.

auditoria <- read.csv2('auditoria.csv')
options(device = 'x11')

par(las = 1, mar = c(5,4,2,2), cex = 1.2)
plot(resultado ~ valor, data = auditoria, ylim = c(-0.5, 1.5), col = 'blue',
     xlab = 'Valor da nota', ylab = 'Resultado da auditoria')
### Aparentemente, notas de maior valor estão mais propensas a indícios de fraude.

### Vamos ajustar um modelo de regressão linear. 
ajuste <- lm(resultado ~ valor, data = auditoria)
abline(coef(ajuste), col = 'red', lwd = 2)
lines(sort(auditoria$valor), fitted(ajuste)[order(auditoria$valor)], col = 'red', lwd = 2)
### O modelo ajustado claramente não é apropriado. Observe que para determinados
### valores da variável explicativa, temos valor ajustado inferior a zero
### ou superior a 1.

### Vamos contornar isso ajustando um modelo com resposta binomial, o que
### permitirá modelar a probabilidade de uma conta apresentar erros condicional
### ao valor da nota. Vamos avaliar diferentes funções de
### ligação que podem ser usadas na modelagem de dados binários.

par(las = 1, mar = c(5,4,2,2), cex = 1.2)
plot(resultado ~ valor, data = auditoria, pch = "|", ylim = c(0,1), col = 'lightblue',
     xlab = 'Valor da nota', ylab = 'Resultado da auditoria')

ajuste2 <- glm(resultado ~ valor, family = binomial(link = logit), data = auditoria)
### Ligação logito.
summary(ajuste2)
lines(sort(auditoria$valor), predict(ajuste2, type = 'response')[order(auditoria$valor)], 
      col = 'black', lwd = 2)
### Adicionando a regressão ajustada ao gráfico.

ajuste3 <- glm(resultado ~ valor, family = binomial(link = probit), data = auditoria)
### Ligação probito.
summary(ajuste3)
lines(sort(auditoria$valor), predict(ajuste3, type = 'response')[order(auditoria$valor)], 
      col = 'red', lwd = 2)

ajuste4 <- glm(resultado ~ valor, family = binomial(link = cloglog), data = auditoria)
### Ligação complemento log-log.
summary(ajuste4)
lines(sort(auditoria$valor), predict(ajuste4, type = 'response')[order(auditoria$valor)], 
      col = 'blue', lwd = 2)

ajuste5 <- glm(resultado ~ valor, family = binomial(link = cauchit), data = auditoria)
### Ligação Cauchy.
summary(ajuste5)
lines(sort(auditoria$valor), predict(ajuste5, type = 'response')[order(auditoria$valor)], 
      col = 'orange', lwd = 2)

legend(x = 'bottomright', lwd = 2, col = c('black', 'red', 'blue', 'orange'),
       legend = c('Logito', 'Probito', 'Cloglog', 'Cauchy'), bty = 'n')

### Aparentemente, os modelos com ligação logito e probito proporcionam melhor
### ajuste que os demais. Além disso, os ajustes desses dois modelos são
### bastante semelhantes. Vamos comparar os modelos com base nos respectivos
### AICs.

AIC(ajuste2, ajuste3, ajuste4, ajuste5)
### O ajuste 2 (modelo com ligação logito) produziu menor AIC, sendo preferível.