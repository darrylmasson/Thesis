TEX=pdflatex -interaction nonstopmode thesis.tex
BIB=bibtex thesis.tex


pdf:
	${TEX}
	${BIB}||true
	${TEX}
	${TEX}