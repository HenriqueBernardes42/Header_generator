#!/bin/bash

#cabecalho.sh (Shell script)
#
# Objetivo: criar um arquivo com um cabeçalho padrão
#
# Site: https://HenriqueBernardes42.github.io
#
# Versão 1.0
#
# Programador: Henrique Bernardes 
#
# Email: henriquepabe@gmail.com
#

VERSION="Versão 1.0"

[ -z $1 ] && echo "Nenhuma extensão encontrada, use -h para obter ajuda" && exit 1

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
	
#extenção do arquivo
for i in {"-sh","-py","-js","-c","-jar","-ty"}
do

	
	[ "$1"  = "-sh" ] && LNG=$(echo "Shell script"I) && SHEBANG=$(echo "#!/bin/bash")
	[ "$1"  = "-py" ] && LNG=$(echo "Phyton") && SHEBANG=$(echo "#!/usr/bin/env python")	
	[ "$1"  = "-js" ] && LNG=$(echo "JavaScript") && SHEBANG=$()
[ "$1"  = "-c" ] && LNG=$(echo "C")
[ "$1"  = "-jar" ] && LNG=$(echo "Java")
[ "$1"  = "-ty" ] && LNG=$(echo "TypeScript")

done


#cabeçalho que será gerado
echo -e "$SHEBANG
	$2 ($LNG)\n
	Objetivo: $3\n
	Site: https://HenriqueBernardes42.github.io\n
	$VERSION\n
	Programador: Henrique Bernardesi\n
       	data de criação: $(date	+%d/%m/%Y)\n 
	Email: henriquepabe@gmail.com\n
" > $2




# "#" em todas as linhas
# data
