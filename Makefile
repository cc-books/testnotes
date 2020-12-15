DATE = $(shell date -I)

all: pdf

pdf:
	asciidoctor-pdf -r asciidoctor-pdf-cjk -r ./remove-section-trailing-dot.rb master.adoc
	mupdf master.pdf
	rm -f master.pdf
