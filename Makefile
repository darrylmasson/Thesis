TEX=pdflatex -interaction nonstopmode thesis
BIB=bibtex thesis


pdf:
	${TEX}
	${BIB}
	${TEX}
	${TEX}

clean:
	rm -rf *.aux *.bbl *.lof *.lot *.log
