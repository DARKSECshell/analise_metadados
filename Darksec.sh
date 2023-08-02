#!/bin/bash
#DEVELOPER DARKSEC

if [ "$1" == "" ]
then
	echo "|=============DEVELOPER DARKSEC======================|"
	echo "|ARQUIVOS SUPORTADOS PDF,DOC,DOCX,XLS,XLSX,PPT,PPTX  |"
	echo "|EXEMPLO DE USO ./$0 bancocn.com pdf         |"
	echo "|====================================================|"
else
	echo "|==================================================================================================|"
	echo "|AVISO! SERÁ BAIXADO 2 ARQUIVOS QUE PRECISAM SER BAIXADO, SE NÃO DESEJÁ BAIXAR PARE O SCRIPT AGORA!|"
	echo "|==================================================================================================|"
sleep 5
sudo apt-get install lynx && sudo apt-get install exiftool
sleep 3
echo "|===============================|"
echo "|ENTRANDO NO DIRETORIO METADADOS|"
echo "|===============================|"
mkdir metadados
cd metadados
sleep 3
lynx --dump 'https://www.google.com/search?q=site:'$1'+filetype:'$2 | grep ".pdf" | egrep -v "search" | grep pdf | cut -d "&" -f 1 | cut -d "=" -f 2 > darksec.txt
for dark in $(cat darksec.txt);
do
(wget -q $dark);
done
exiftool *
fi
