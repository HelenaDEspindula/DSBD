#!/bin/bash

# Este exemplo baixa os dados dos cinco primeiros dias de um determinado mês e ano 
# que são passados como parâmetros para o script
# Um exemple de execução do script é: ./baixaDadosTransp.sh 27 28 05 2015

#set -x
#  Indicando qual o endereço do site - Link Novo
siteDownload="https://dadosabertos-download.cgu.gov.br/PortalDaTransparencia/saida/despesas"

#Variáveis indicando o mês e o ano que irá buscar
mes=$3
ano=$4

# Variáveis que indicam os dias do mês da busca
inicioPeriodo=$1
fimPeriodo=$2

# Diretórios que serão utilizados para baixar os dados e processá-los
dataDir="./dados"
tmpDir="./tmp"

# cria diretório
mkdir $dataDir

# Executa o for para cada dia (inicio e fim) do período
for dia in $(seq -f "%02g" $inicioPeriodo $fimPeriodo); do
  zipFile=$ano$mes$dia'_Despesas.zip'

  # O comando wget vai baixar o arquivo zip com os dados do site 
  echo -n "Baixando arquivo $zipFile ..."
  wget $siteDownload/$zipFile 2> /dev/null
  echo OK

  # Aqui os dados são descompactados no diretório temporário
  echo -n "Descompactando arquivo $zipFile ..."
  unzip -o $zipFile '*_Empenho.csv' -d $tmpDir > /dev/null
  unzip -o $zipFile '*_Pagamento.csv' -d $tmpDir > /dev/null
  echo OK

  # Arquivo zip é removido
  echo -n "Removendo arquivo $zipFile ..."
  rm -f $zipFile
  echo OK
done

#Primeiro dia com cabeçalho
echo -n "Copiando dia $inicioPeriodo  ..."
cat $tmpDir/*$ano$mes$inicioPeriodo'_Despesas_Empenho.csv' > $dataDir/$ano$mes$inicioPeriodo$fimPeriodo'_Despesas_Empenho.csv'
cat $tmpDir/*$ano$mes$inicioPeriodo'_Despesas_Pagamento.csv'> $dataDir/$ano$mes$inicioPeriodo$fimPeriodo'_Despesas_Pagamento.csv'
rm -f $tmpDir/*$ano$mes$inicioPeriodo'_Despesas_Empenho.csv'
rm -f $tmpDir/*$ano$mes$inicioPeriodo'_Despesas_Pagamento.csv'
echo OK

# Apagando cabeçalho dos demais dias
echo -n "Retirando cabeçalhos  ..."
sed -i '1d' $tmpDir/*'_Empenho.csv'
sed -i '1d' $tmpDir/*'_Pagamento.csv'
echo OK

# Dados são copiados do diretório temporário para o diretório dados
echo -n "Copiando outros dias  ..."
cat $tmpDir/*'_Empenho.csv' >> $dataDir/$ano$mes$inicioPeriodo$fimPeriodo'_Despesas_Empenho.csv'
cat $tmpDir/*'_Pagamento.csv'>> $dataDir/$ano$mes$inicioPeriodo$fimPeriodo'_Despesas_Pagamento.csv'
echo OK

# Diretório temporário é apagado
echo -n "Apagando temp ..."
rm -f $tmpDir/*.csv
echo OK