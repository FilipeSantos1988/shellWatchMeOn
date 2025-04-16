#!/bin/bash
# ==============================================================
# Nome do Script : sumNumbers.sh -- Formaçao -- Scripts Basicos
# Descrição      : Formação em ShellScript
# ===============  Ao adicionar 2 numeros ele retorna-me a soma
# ===============  de ambos
# Autor          : Filipe Santos / developer full-stack
# Data de Criação: 2025-04
# Versão         : 1.0
# Uso            : ./createBAK.sh [opções]
# opções         : Directorio do user - caminho absoluto
# =============================================================:q
echo "*************************************************"
echo "******************"Programa - Soma"**************"
echo "*************************************************"

question="Digite dois numeros para ser efetuado uma soma"
questionsNumber1="Digite o primeiro Numero"
questionsNumber2="Digite o segundo Numero"
varCalculatedValue=0


# Lê os números do utilizador
read -p "$questionsNumber1":  varNumber1
read -p "$questionsNumber2":  varNumber2


result=$(($varNumber1 + $varNumber2))
# Exibir o resultado
echo "O 1º número é: $varNumber1"
echo "O 2º número foi: $varNumber2"
echo "O resultado é: $result" 


