#!/bin/bash
# ====================================================================
# Nome do Script : createBAK.sh -- Formaçao -- Instruções Condicionais
# Descrição      : Parte de uma formaçao em shell script
# ===============  Adiconei algumas alterações de minha autoria tais
# ===============  como o tal como o job cron, para ele executar  
# ===============  todos os dias o script, o script faz
# ===============  backup ao files, compactando-as em .TGZ, a 
# ===============  a ideia é recuperar os homes/ de cada usuario  
# ===============  e encriptar o home
# ===============  Ideias futuras, adicionar o caminho para onde
# ===============  queremos enviar o Backup
# Autor          : Filipe Santos / developer full-stack
# Data de Criação: 2025-04
# Versão         : 1.0
# Uso            : ./createBAK.sh [opções]
# opções         : Directorio do user - caminho absoluto
# ====================================================================
DirToUser=$1
dirToBackup=$1"/Backup"
programName=$( basename "$0" )
dataCurrent=$(date +%Y%m%d%H%M)
BackupName="backup_home_$dataCurrent.tgz"
(crontab -l 2>/dev/null; echo "0 8 * * * $DirToUser"/"$programName") | crontab -


# Calcula a diferença em segundos
differenceInSeconds=$((currentTimestamp - oldestTimestamp))

# Converte a diferença de segundos para dias
differenceInDays=$((differenceInSeconds / 86400))  #

if ( ls $DirToUser > /dev/null ); then
## verifica se o backup existe
## Se existir ele faz logo o backup com tudo menos 
## com o proprio backup
    if (ls $dirToBackup > /dev/null ); then
        ## verifica se ja existe algum bakcup na pasta feita nos ultimos dias
        oldestInFolder=$( ls $dirToBackup"/" | sort | head -n 1 | cut -d '_' -f3 | cut -d '.' -f1 )
        echo "current"$dataCurrent
        echo "older"$oldestInFolder
        currentTimestamp=$(date -d "${dataCurrent:0:4}-${dataCurrent:4:2}-${dataCurrent:6:2} ${dataCurrent:8:2}:${dataCurrent:10:2}" +%s)
        oldestTimestamp=$(date -d "${oldestInFolder:0:4}-${oldestInFolder:4:2}-${oldestInFolder:6:2} ${oldestInFolder:8:2}:${oldestInFolder:10:2}" +%s)

        differenceInSeconds=$(($currentTimestamp - $oldestTimestamp))
        differenceInDays=$differenceInSeconds / 86400

        if ( $differenceInDays > 7); then
            tar -czvf $dirToBackup"/"$BackupName --exclude='Backup' -C $DirToUser . > /dev/null
            echo "Criar backup"
        else
            echo "Escolha uma opção:"
            echo "1) Fazer backup"
            echo "2) Cancelar"
            echo "0) Sair"
            read -p "Digite sua opção: " option
            case $option in
                        1)
                        tar -czvf $dirToBackup"/"$BackupName --exclude='Backup' -C $DirToUser . > /dev/null
                        echo "back efetuado"
                        echo "Criar backup"
                        ;;
                        2)
                        echo "back não efetuado"
                        exit 0
                        ;;
                        *)
                        echo "Comando errado"
                        exit 1
                        ;;
            esac
        fi
## se nao existir ele cria a pasta de backup 
## faz o backup com tudo menos 
## excluindo o backup    
    else
        echo "Criar directorio backup"
        mkdir $dirToBackup
        echo "Criar backup"
        tar -czvf $dirToBackup"/"$BackupName --exclude='Backup' -C $DirToUser . > /dev/null
    fi
## se o user nao existir ou a pasta do user nao existir
## sai em erro
else
    exit 1
fi




datashift, infomachine, MapsS, sumNumbers


