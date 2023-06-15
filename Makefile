DATE = $(shell date -I)

all: pdf

pdf:
	asciidoctor-pdf -r asciidoctor-pdf-cjk -r ./remove-section-trailing-dot.rb main.adoc -o /tmp/main.pdf
	#asciidoctor-pdf -a scripts=cjk -r ./remove-section-trailing-dot.rb main.adoc -o /tmp/main.pdf
	mupdf /tmp/main.pdf
	rm -f /tmp/main.pdf

test:
	asciidoctor-pdf -r asciidoctor-pdf-cjk -r ./remove-section-trailing-dot.rb test.adoc -o /tmp/test.pdf
	mupdf /tmp/test.pdf
	rm -f /tmp/test.pdf
