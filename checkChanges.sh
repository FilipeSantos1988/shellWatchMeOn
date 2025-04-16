#!/bin/bash
# ========================================================================
# Nome do Script : checkChanges.sh -- Formaçao -- Instruções Condicionais
# Descrição      : Formação em ShellScript
# ===============  A ideia, seria colocar uma url
# ===============  e verificar se a pagina foi alterada,
# ===============  a principal ideia seria monotorizar
# ===============  alteraçoes ocorridas na pagina.
# ===============       **Ainda a realizar**
# Autor          : Filipe Santos / developer full-stack
# Data de Criação: 2025-04
# Versão         : 1.0
# Uso            : ./nome_do_arquivo.sh [opções]
# opções         : O caminho da Url Absoluto
# =========================================================================

URL_TO_CHECK=$1 
FILE_HASH=$(pwd)"/file_hash.txt"
FOLDER_HASH=$(pwd)
CREATE_FILE=$FOLDER_HASH"/file_hash.txt"
COUNT=0


## verifica se o ficheiro existe
for RIGHT_LOCALIZATION in ${FOLDER_HASH}/*;
    do
        if [ "file_hash.txt" = $(basename "$RIGHT_LOCALIZATION") ];
            then
            echo "file_hash.txt Founded"
	    ((COUNT++))
        fi
    done

## se o ficheiro não apareceu cria o ficheiro e coloca no ficheiro
if [ $COUNT = 0 ];
    then
    echo "File txt not founded into folder - Create file_hash.txt "
    touch $FILE_HASH
    curl -s "${URL_TO_CHECK}" | sha256sum > "$FILE_HASH"
else
##verifica se o novo hash é igual ao caminho dentro do ficheiro
NEWHASH=$(curl -s "${URL_TO_CHECK}" | sha256sum)
if [ "$NEWHASH" != "$(head -1 $FILE_HASH)" ];
    then
    echo -n "Altearam a pagina" && date
    ## inserir a nova pagina no ficheiro como hash
    curl -s "${URL_TO_CHECK}" | sha256sum > "$FILE_HASH"
fi
fi


(crontab -l 2>/dev/null; echo "0 8 * * * ${FOLDER_HASH}checkChanges.sh") | crontab -
