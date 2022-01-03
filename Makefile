DATE = $(shell date -I)

all: pdf

pdf:
	asciidoctor-pdf -r asciidoctor-pdf-cjk -r ./remove-section-trailing-dot.rb main.adoc
	mupdf main.pdf
	rm -f main.pdf
