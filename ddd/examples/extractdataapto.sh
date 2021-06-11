#!/bin/bash
APTO=$1
FILE=$2

data=$(iconv -f ISO-8859-1 -t UTF-8 "$2" | grep "APTO $APTO")
THEDATE=$(echo "$data" | grep "Água" | grep -oP -m 1 "\d{2}/\d{2}/\d{4}")
AGUA_M3=$(echo "$data" | grep "Água" | grep -oP "\d+,\d+" | sed '1q;d' | sed 's/\.//' | sed 's/,/\./')
AGUA_R=$(echo "$data" | grep "Água" | grep -oP "\d+,\d+" | sed '2q;d' | sed 's/\.//' | sed 's/,/\./')
GASAQ_M3=$(echo "$data" | grep "Gás Aquecimento\|Gás de Aquecimento" | grep -oP "\d+,\d+" | sed '1q;d' | sed 's/\.//' | sed 's/,/\./')
GASAQ_R=$(echo "$data" | grep "Gás Aquecimento\|Gás de Aquecimento" | grep -oP "\d+,\d+" | sed '2q;d' | sed 's/\.//' | sed 's/,/\./')
GAS_M3=$(echo "$data" | grep "Gás - Consumo\|Gás - Leitura" | grep -oP "\d+,\d+" | sed '1q;d' | sed 's/\.//' | sed 's/,/\./')
GAS_R=$(echo "$data" | grep "Gás - Consumo\|Gás - Leitura" | grep -oP "\d+,\d+" | sed '2q;d' | sed 's/\.//' | sed 's/,/\./')
TX_COND=$(echo "$data" | grep "Taxa de Condomínio" | grep -oP "\d+,\d+" | sed '1q;d' | sed 's/\.//' | sed 's/,/\./')
FND_RES=$(echo "$data" | grep "Fundo de Reserva" | grep -oP "\d+,\d+" | sed '1q;d' | sed 's/\.//' | sed 's/,/\./')

echo -e "$APTO,\t$THEDATE,\t$TX_COND,\t$FND_RES,\t$AGUA_M3,\t$AGUA_R,\t$GASAQ_M3,\t$GASAQ_R,\t$GAS_M3,\t$GAS_R"
