#!/bin/bash
#	cabecalho.sh (Shell script)
#
#	 Objetivo: criar um arquivo com um cabeçalho padrão
#
#	 Site: https://HenriqueBernardes42.github.io
#
#	 Versão 1.0
#
#	 Programador: Henrique Bernardes 
#
#	 Email: henriquepabe@gmail.com
#


# variaveis
ARQUIVO=$1
EXTENCAO_DO_ARQUIVO=${ARQUIVO##*.}
VERSION="Versão 1.0"


#algumas opções que o usurio pode utilizar
#ajuda
#versao do codigo 
case $1 in
	-h | --help)
		vim ajuda.txt
		exit 0
	;;
	-v)
		echo $VERSION
		exit 0
	;;
esac


	
#procura a extenção do arquivo com seu respectivo nome	
[ "$EXTENCAO_DO_ARQUIVO"  = "sh" ] && LNG=$(echo "Shell Script") && SHEBANG=$(echo "!/bin/bash")
[ "$EXTENCAO_DO_ARQUIVO"  = "py" ] && LNG=$(echo "Phyton") && SHEBANG=$(echo "!/usr/bin/env python")	
[ "$EXTENCAO_DO_ARQUIVO"  = "js" ] && LNG=$(echo "JavaScript") && SHEBANG=$()
[ "$EXTENCAO_DO_ARQUIVO"  = "c" ] && LNG=$(echo "C") && SHEBANG=$(echo "include <stdio.h>")	
[ "$EXTENCAO_DO_ARQUIVO"  = "jar" ] && LNG=$(echo "Java")
[ "$EXTENCAO_DO_ARQUIVO"  = "ty" ] && LNG=$(echo "TypeScript")


#cabeçalho que será gerado
funcao(){
	echo -e "$SHEBANG
	$1 ($LNG)\n
	Objetivo: $2\n
	Site: https://HenriqueBernardes42.github.io\n
	$VERSION\n
	Programador: Henrique Bernardes\n
      	data de criação: $(date	+%d/%m/%Y)\n 
	Email: henriquepabe@gmail.com\n
"
}

#verificaçáo  se o arquivo $1 já existe
if [ -f  $1 ]
then
        read -p "este arquivo já existe, gostaria de sobreescrever?" RESPOSTA
        if [ $RESPOSTA == "sim" ]
                then
                        funcao $1 "$2" > $1
        elif [ $RESPOSTA == "nao" ]
                then
                        echo "arquivo não sobreescrito"
        else
                         echo "comando não reconhecido"
        fi
else
	funcao $1 "$2" >> $1
fi
 






#transforma a função anterior em um comentario adiocionado "#" no começo de todas as linhas
	sed -i 's/^/#/' $1




