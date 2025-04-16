#!/bin/bash
# =================================================================================================
# Nome do Script : dataShift.sh -- Formaçao -- Functions()
# Descrição      : Parte de uma formaçao em shell script
# ===============  O aplicativo faz alteraçoes nas datas
# ===============  Insere as barras nas datas sem barras,
# ===============  verifica o Modelo Horario, se é BR ou USA
# ===============  Exibe o horario em extenso em PT
# Autor          : Filipe Santos / developer full-stack
# Data de Criação: 2025-04
# Versão         : 1.0
# Uso            : ./dataShift.sh [opções]
# opções         : -f Retorna 0 para BR, 1 para US e 2 quando é impossível de determinar
# ============== : -i Inverte formato BR para US e US para BR. Exemplo: 13/08/2025 -> 08/13/2025
# ============== : -b Inclui Barras de Data. Exemplo: 13081981 -> 13/08/1981
# ============== : -e Exibe a data em formato extenso, seguindo a linguagem PT. Exemplo:  13081918 -> 13 de Agosto 1918
# ===============================================================================================
# Verifica o tipo de data
checkDateType(){
## verifica se tem barras
local dataValue=$1
local canHasBars=${dataValue:2:1}
## descompatar a data se tiver barras
if [[ "$canHasBars" == "/" ]]; then
    firstField=${dataValue:0:2}
    secondField=${dataValue:3:2}
    thirdField=${dataValue:6:4}
else
    firstField=${dataValue:0:2}
    secondField=${dataValue:2:2}
    thirdField=${dataValue:4:4}
fi


## BR
if [[ $firstField -gt 12 && $secondField -lt 13 ]]; then
    echo 0
    return 0
## US
elif [[ $firstField -lt 13 && $secondField -gt 12 ]]; then
    echo 1
    return 1
## Desconhecido
else
    echo 2
    return 2
fi
}


## Esta funcao foi feita para me agilizar nas restantes funções
## retornando os dias os meses e os anos 
getDate(){
local format=$1
local dataValue=$2
local request=$3

canHasBars=${dataValue:2:1}

## se tiver barras
if [[ "$canHasBars" == "/" ]]; then
    firstField=${dataValue:0:2}
    secondField=${dataValue:3:2}
    thirdField=${dataValue:6:4}
else
    firstField=${dataValue:0:2}
    secondField=${dataValue:2:2}
    thirdField=${dataValue:4:4}
fi

case $format in
        "0") 
            if  [[ $request -eq "day" ]]; then
                echo $firstField
            elif  [[ $request -eq "month" ]]; then
                echo $secondField
            else
                echo $thirdField
            fi
            ;;
        "1")
            if [[ $request -eq "day" ]]; then
                echo $secondField
            elif [[ $request -eq "month" ]]; then
                echo $firstField
            else
                echo $thirdField
            fi
            ;;
esac
}


## recebe recebe Date/formato e usa funcao getDate() 
## Troca o formato dentre BR <-> USA
changeFormat(){
local format=$1
local dataValue=$2


day=$(getDate $formatDate $dateValue "day")
month=$(getDate $formatDate $dateValue "month")
year=$(getDate $formatDate $dateValue "year")


## Formato Brasileiro -> Formato USA
if (( $format == 0 )); then
    echo $month"/"$day"/"$year

## Formato USA -> Formato Brasileiro
elif (( $format == 1 )); then
    echo $day"/"$month"/"$year
else
    return 1
fi
}




## recebe recebe Date/formato e usa funcao getDate() 
## Insere barras nas datas se nao tiverem
insertBars(){
local format=$1
local dataValue=$2
 
day=$(getDate $formatDate $dateValue "day")
month=$(getDate $formatDate $dateValue "month")
year=$(getDate $formatDate $dateValue "year")


echo $day"/"$month"/"$year
}



## Formata a data para o mes que queremos em decimal PT
getFormatDatePT(){ 
local months=Janeiro,Fevereiro,Março,Abril,Maio,Junho,Julho,Agosto,Setembro,Outobro,Novembro,Dezembro

day=$(getDate $formatDate $dateValue "day")
month=$(getDate $formatDate $dateValue "month")
year=$(getDate $formatDate $dateValue "year")

monthAlfanumeric=$(echo $months | cut -d',' -f$month)

echo $day" de "$monthAlfanumeric" de "$year
}






## Variaveis/Argumentos/principais
opcao=$1
dateValue=$2

## Obtem o formato da data
formatDate=$(checkDateType $dateValue)
errFormatDate=$?


case $opcao in
        "-f") 
            if [[ $formatDate == 0 ]]; then
                echo "BR-Format"
            elif [[ $formatDate == 1 ]]; then
                echo "USA-Format"
            elif [[ $formatDate == 2 ]]; then
                echo "Desconhecido-Format"
            fi
            ;;
        "-i")
            formatedOtherWay=$(changeFormat $formatDate $dateValue)
            echo $formatedOtherWay
            ;;
        "-b") 
            dateWithBars=$(insertBars $formatDate $dateValue)
            errDateWithBars=$?
            echo $dateWithBars
            ;;
        "-e")
            formatDatePT=$(getFormatDatePT $formatDate $dateValue)
            echo $formatDatePT
            ;;
esac








