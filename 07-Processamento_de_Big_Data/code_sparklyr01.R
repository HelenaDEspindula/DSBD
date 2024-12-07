#install.packages("sparklyr")
require(sparklyr)
require(dplyr)
spark_install("3.3.4")

#CONEXÃO SPARK
sc <- spark_connect(master="local")

#COMANDO BÁSICOS DE INFORMAÇÃO
spark_version(sc)

src_databases(sc)
src_tbls(sc)


#BASE DOS ACEITOS
spark_connection_is_open(sc)
setwd("E:\\lending_club\\")
dados_aC <- spark_read_csv(sc, "aceitos",
                           "accepted_2007_to_2018Q4.csv",
                           memory = FALSE, delim=",",
                           dec=".")

src_tbls(sc)
dados_aC
dados_aC %>% count()


#BASE DOS REJEITADOS
dados_re <- spark_read_csv(sc, "rejeitados",
                           "rejected_2007_to_2018Q4.csv",
                           memory = FALSE, delim=",",
                           dec=".")

src_tbls(sc)

#NOTE QUE dados_re é ainda um objeto spark (lazy)
dados_re
dados_re %>% sdf_ncol()
class(dados_re)
glimpse(dados_re)

#agora, trazemos para o ambiente R via função collect()
n_re <- dados_re %>% count() %>% collect()
n_re
n_re+1



#USANDO O DLPLY
dados_re %>% summarise(m=mean(Amount_Requested))

#GRÁFICOS via dbplot
require(dbplot)
require(ggplot2)
dados_re %>% filter(Amount_Requested<50000) %>% 
  dbplot_histogram(Amount_Requested, bins=20) + #veja a regra de sturges
  labs(title="Montante requerido até 100 mil")+
  theme_bw()

dados_re %>% 
  filter(Amount_Requested<5000) %>% 
  count()

glimpse(dados_aC)

dados_aC %>% summarise(m.empr=mean(loan_amnt),
                       m.taxa=mean(int_rate))

#paleta <- colorRampPalette(c("blue","lightblue"))(100)
# cores <- colorRampPalette(c("lightblue","gold2","purple3","purple"))(100)
# barplot(1:100,col=cores,border=F)
dados_aC %>% select(loan_amnt,int_rate) %>% 
  dbplot_raster(loan_amnt,int_rate)+
  scale_fill_gradient("n",low = "#e0e0e0",
                       high = "#ff7043")+
  theme_bw()+
  theme(legend.position = "bottom")


#Retirando uma amostra de dados do objeto spark

amostra <- dados_aC %>% 
  sample_n(3000) %>% collect()

class(amostra)

amostra %>% ggplot(aes(x=loan_amnt,y=int_rate))+
  geom_point(alpha=0.15,col="tomato")+
  theme_bw()

## correlação
require(corrr)

dados_aC %>% 
  select(loan_amnt,int_rate,installment) %>% 
  na.omit() %>% 
  correlate()

spark_disconnect(sc)



