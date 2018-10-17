#!/bin/sh

function compile() {
	fstcompile --isymbols=syms.txt --osymbols=syms.txt "$1.txt" | fstarcsort > "$1.fst"
}

function draw() {
	fstdraw --isymbols=syms.txt --osymbols=syms.txt --portrait "$1.fst" | dot -Tpdf > "$1.pdf"
}

function concat() {
	fstconcat "$1.fst" "$2.fst" | fstrmepsilon | fstarcsort > "$3.fst"
}

# A

compile mmm2mm
draw mmm2mm

compile dds_pass
draw dds_pass

compile saaaa_pass
draw saaaa_pass

concat dds_pass mmm2mm tmp
concat tmp saaaa_pass misto2numerico

draw misto2numerico

# B

compile mmmen2mmmpt
draw mmmen2mmmpt

concat dds_pass mmmen2mmmpt tmp
concat tmp saaaa_pass en2pt

draw en2pt

fstinvert en2pt.fst pt2en.fst
draw pt2en

# C

compile dia
draw dia

compile mes
draw mes

compile ano
draw ano

compile barra
draw barra

concat dia barra tmp1
concat tmp1 mes tmp2
concat tmp2 barra tmp1
concat tmp1 ano numerico2texto

draw numerico2texto

# D

fstcompose misto2numerico.fst numerico2texto.fst misto2texto.fst

draw misto2texto

fstunion misto2texto.fst numerico2texto.fst data2texto.fst

draw data2texto

# E

## 83557

compile 83557_numerico
draw 83557_numerico
compile 83557_misto
draw 83557_misto
compile 83557_pt
draw 83557_pt

fstcompose 83557_misto.fst misto2numerico.fst 83557_misto2numerico.fst
draw 83557_misto2numerico

fstcompose 83557_pt.fst pt2en.fst 83557_pt2en.fst
draw 83557_pt2en

fstcompose 83557_numerico.fst numerico2texto.fst 83557_numerico2texto.fst
draw 83557_numerico2texto

fstcompose 83557_misto.fst misto2texto.fst 83557_misto2texto.fst
draw 83557_misto2texto

fstcompose 83557_misto.fst data2texto.fst 83557_data2texto.fst
draw 83557_data2texto

## 83450

compile 83450_numerico
draw 83450_numerico
compile 83450_misto
draw 83450_misto
compile 83450_pt
draw 83450_pt

fstcompose 83450_misto.fst misto2numerico.fst 83450_misto2numerico.fst
draw 83450_misto2numerico

fstcompose 83450_pt.fst pt2en.fst 83450_pt2en.fst
draw 83450_pt2en

fstcompose 83450_numerico.fst numerico2texto.fst 83450_numerico2texto.fst
draw 83450_numerico2texto

fstcompose 83450_misto.fst misto2texto.fst 83450_misto2texto.fst
draw 83450_misto2texto

fstcompose 83450_misto.fst data2texto.fst 83450_data2texto.fst
draw 83450_data2texto
