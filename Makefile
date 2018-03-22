TEX=pdflatex -interaction nonstopmode thesis.tex
BIB=bibtex thesis.aux
FULL=perl -ni -e 's/(\\documentclass\[.*?)(,draft)/$1/; print' thesis.tex
DRAFT=perl -ni -e 's/(\\documentclass\[.*?(?<!,draft))\]/$1,draft\]/; print' thesis.tex

quick:
	pdflatex thesis.tex

base: clean
	${TEX}
	${BIB}||true
	${TEX}

full: base
	${TEX}

clean:
	rm -rf *.aux *.bbl *.lof *.lot *.log *.blg *.toc
