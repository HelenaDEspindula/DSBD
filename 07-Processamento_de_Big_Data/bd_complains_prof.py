import pandas as pd
import time

nomeArq = "/home/espinf/hrsdespindula/Downloads/BD/complaints.csv"

start_time = time.time()
df = pd.read_csv(nomeArq, sep=',')
end_time = time.time()
elapsed_time = end_time - start_time
print("Tempo para ler:", elapsed_time, "segundos")
input("Pressione Enter para continuar...")
start_time = time.time()
filtro = df.loc[df['Product'] == 'PRODUTO DE TESTES']
end_time = time.time()
elapsed_time = end_time - start_time
print("Tempo para buscar:", elapsed_time, "segundos")
print(filtro)
