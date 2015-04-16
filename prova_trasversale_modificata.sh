#!/bin/bash

#Salvataggio nella variabile "cartelle" dell'elenco delle sottodirectory
cartelle=`ls -d */`

#La variabile "ciclo" serve ad indicare il numero di cicli, e viene inizializzata a 0 in modo da indicare quando è avvenuta la copia della prima linea
ciclo=0

#Ciclo per le sottodirectory
for i in $cartelle
do
	#La variabile "primaRiga" viene portata a 1 per segnalare che la prima linea non è stata copiata
	primaRiga=1
	#Ciclo di lettura del file "export.csv"
	while read -r linea
	do
		if [ $primaRiga -eq 1 ]
		then
			primaRiga=0
			if [ $ciclo -eq 0 ]
			then
				#Scrittura dell'intestazione nel file "merged.csv"
				echo "${linea};filiale" > merged.csv
			fi
		else
			#Scrittura di una linea nel file "merged.csv"
			echo "$linea;$i"  >> merged.csv 
		fi
	done < $i/export.csv
	ciclo=$((ciclo+1))
done

	