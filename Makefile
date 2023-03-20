DATE = $(shell date -I)

all: pdf

pdf:
	asciidoctor-pdf -r asciidoctor-pdf-cjk -r ./remove-section-trailing-dot.rb main.adoc
	mupdf main.pdf
	rm -f main.pdf

test:
	asciidoctor-pdf -r asciidoctor-pdf-cjk -r ./remove-section-trailing-dot.rb test.adoc
	mupdf test.pdf
	rm -f test.pdf
