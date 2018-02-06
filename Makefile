TEX=pdflatex -interaction nonstopmode thesis.tex
BIB=bibtex thesis.aux
FULL=perl -ni -e 's/(\\documentclass\[.*?)(,draft)/$1/; print' thesis.tex
DRAFT=perl -ni -e 's/(\\documentclass\[.*?(?<!,draft))\]/$1,draft\]/; print' thesis.tex

quick:
	${DRAFT}
	pdflatex thesis.tex

base: clean
	${DRAFT}
	${TEX}
	${BIB}||true
	${TEX}

draft: base
	${TEX}

full: base
	${FULL}
	${TEX}

clean:
	rm -rf *.aux *.bbl *.lof *.lot *.log *.blg
