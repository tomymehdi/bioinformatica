#!/bin/bash

declare -a arr=(SAARRGRGGARPACGTAGRESAAG EAPRGGAGEARARLAGLRGARARPGSVARVDLPPGCCATILREPSVSPPEPGAG)

for sequence in "${arr[@]}"
do
	patmatmotifs -full -outfile 'ej4-2.fas.report' -sequence $sequence
done
