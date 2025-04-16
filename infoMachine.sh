#!/bin/bash
# ==============================================================
# Nome do Script : infoMachine.sh -- Formaçao -- Scripts Basicos
# Descrição      : Formação em ShellScript
# ===============  Sistema de verificaçao de estado do
# ===============  PC
# Autor          : Filipe Santos / developer full-stack
# Data de Criação: 2025-04
# Versão         : 1.0
# Uso            : ./infoMachine.sh 
# ============================================================
reportNameMachine=$( hostnamectl | head -1| cut -d ':' -f2 )
atualDate=$(date)
activadedSince=$(uptime -s)
vKernel=$(hostnamectl | tail -2| head -1 | cut -d ':' -f2)
nCoresCPU=$(nproc)
cpuModel=$(lscpu | grep 'Model name:' | cut -d ':' -f2)
memoryTotal=$(free -h --si | grep 'Mem' | awk -F' ' '{print $NF}'| sed 's/\([0-9.]\+\)G/\1GB/g; s/\([0-9.]\+\)M/\1MB/g; s/\([0-9.]\+\)K/\1KB/g')
partitions=$(df -h | sed 's/\([0-9.]\+\)G/\1GB/g; s/\([0-9.]\+\)M/\1MB/g; s/\([0-9.]\+\)K/\1KB/g')

echo "=================================================="
echo "Relatório da Máquina: " $reportNameMachine
echo "Data/Hora: " $atualDate
echo "=================================================="
echo -e "\n"
echo -e "Maquina Activa desde: "$activadedSince
echo -e "\n"
echo "Versão do Kernel: "$vKernel
echo -e "\n"
echo "CPUs:"
echo "Quantidade de CPUs/Core:" $nCoresCPU
echo "Modelo da CPU: "$cpuModel
echo -e "\n"
echo "Memória Total: "$memoryTotal
echo -e "\n"
echo "Partições:"
echo -e "$partitions"
