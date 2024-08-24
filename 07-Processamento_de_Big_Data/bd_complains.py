import pandas as pd
import time

nomeArq = "/home/espinf/hrsdespindula/Downloads/BD/complaints.csv"

start_time = time.time()
df = pd.read_csv(nomeArq, sep=",")
end_time = time.time()
elapsed_time = end_time - start_time

#df.head()
filtro = df.loc[df['Product'] == 'PRODUTO DE TESTES']


#df.describe( )

