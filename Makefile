DATE = $(shell date -I)

all: pdf

pdf:
	asciidoctor-pdf -r asciidoctor-pdf-cjk -r ./remove-section-trailing-dot.rb main.adoc -o /tmp/main.pdf
	mupdf /tmp/main.pdf

orig:
	asciidoctor-pdf -a scripts=cjk -a pdf-theme=default-with-fallback-font main.adoc -o /tmp/main.pdf
	mupdf /tmp/main.pdf

new:
	asciidoctor-pdf -a scripts=cjk main.adoc -o /tmp/main.pdf
	mupdf /tmp/main.pdf

test:
	asciidoctor-pdf -r asciidoctor-pdf-cjk -r ./remove-section-trailing-dot.rb test.adoc -o /tmp/test.pdf
	mupdf /tmp/test.pdf
