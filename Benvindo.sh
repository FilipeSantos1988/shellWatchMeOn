#!/bin/bash
# ====================================================================
# Nome do Script : Benvindo.sh -- Formaçao -- Instruções Condicionais
# Descrição      : Parte de uma formaçao em shell script
# ===============  O sistema exibe bom dia/ boa tarde/ 
# ===============  boa noite - conforme a hora                 
# Autor          : Filipe Santos / developer full-stack
# Data de Criação: 2025-04
# Versão         : 1.0
# Uso            : ./Benvindo.sh 
# ======================================================================
currentH=$( date +%H )
currentHM=$( date +%R )

if [ "$currentH" -ge 6 ] && [ "$currentH" -le 12 ]; then
    echo "Bom dia !!"
elif [ "$currentH" -ge 13 ] && [ "$currentH" -le 18 ]; then
    echo "Boa tarde !!"
else
    echo "Boa noite !!"
fi


echo "A hora actual é: "$currentHM
