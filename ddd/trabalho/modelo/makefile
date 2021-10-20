article.pdf: article.tex article.bib imgs/wordcound.pdf
	xelatex article.tex
	biber article
	xelatex article.tex

imgs/wordcound.pdf: src/paradiselost.sh
	./src/paradiselost.sh

#imgs/plot-%.png: data/%.csv src/plotdata.sh
#	./src/plotdata.sh -i $*.csv -o $@
