#!/bin/bash
# ========================================================================
# Nome do Script : countTypes.sh -- Formaçao -- Loops
# Descrição      : Formação em ShellScript
# ===============  Verifica as extensões e os nomes
# ===============  das pastas, catagoriza-as pelo nome
# ===============  e quantifica-as
# Autor          : Filipe Santos / developer full-stack
# Data de Criação: 2025-04
# Versão         : 1.0
# Uso            : ./countTypes.sh [opções]
# opções         : O caminho da Url Absoluto
# =========================================================================

dirToCheck=$(ls $1)


for dir in $dirToCheck; do
    #verifica se é extensão, e é dir
    if (echo "$dir" | grep -q '\.')|| [ -d $dir ] > /dev/null ; then
        type=$(echo $dir |cut -d'.' -f2 )
        cocType=$type","$cocType
    fi
done


uniqExt=$(echo $cocType | tr ',' '\n' | sort | uniq)
countExt=$(echo $cocType | tr ',' '\n' | sort )



for ext in $uniqExt; do
    for allExt in $countExt; do
        if [[ $ext == $allExt ]]; then
            count=$((count + 1))
        fi
    done
    echo "Extensão: "$ext" numero: "$count
    count=0
done


