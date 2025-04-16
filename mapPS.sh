#!/bin/bash
# ==============================================================
# Nome do Script : mapPS.sh -- Formaçao -- Loops
# Descrição      : Formação em ShellScript
# ===============  Podemos inserir nos argumentos, o nome
# ===============  de varios aplicativos que se encontram a correr
# ===============  ,quando todos eles tiverem realmente terminado
# ===============  ele informa, ficando a correr em 2º Plano
# Autor          : Filipe Santos / developer full-stack
# Data de Criação: 2025-04
# Versão         : 1.0
# Uso            : ./mapPS.sh [Opções]
# Opções         : Argumentos
# ============================================================
taskOnProcess=("$@")
lenTaskOnProcess=${#taskOnProcess[@]}
contador=0
echo $lenTaskOnProcess
i=0



while true; do
    ## se o index ja correu todos os processos, mas o contador nao os conto todos
    ## e porque ainda existem processo a rodar entao ele vai contar de novo
    ## o contador e o index ficam a 0
    if [[ $i -eq $lenTaskOnProcess && $contador -ne 0 ]];then
        i=0
        contador=0
    fi
   
        ## verifica se o nome do processo encontra-se no sistema
        ## se aquele nome existe ele conta 1
    if  pgrep "${taskOnProcess[$i]}" > /dev/null; then
            contador=$((contador + 1))
    fi
    
     ((i++))

    ## Caso final todos os processos foram contados e nao existe nenhum em memoria
    if [[ $i -eq $lenTaskOnProcess && $contador -eq 0 ]];then
        echo "processos terminados em memoria"
        exit 0   
    fi

done








