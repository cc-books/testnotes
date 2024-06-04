DATE = $(shell date -I)

all: pdf

pdf:
	asciidoctor-pdf -a pdf-style=default-notoserif-cjk-tc-pdf-1 -r asciidoctor-pdf-cjk -r ./remove-section-trailing-dot.rb main.adoc -o /tmp/main.pdf
	mupdf /tmp/main.pdf || evince /tmp/main.pdf

new:
	asciidoctor-pdf -a scripts=cjk -a pdf-theme=face/default-notoserif-cjk-tc-theme.yml -r ./remove-section-trailing-dot.rb main.adoc -o /tmp/main.pdf
	mupdf /tmp/main.pdf || evince /tmp/main.pdf

orig:
	asciidoctor-pdf -a scripts=cjk main.adoc -o /tmp/main.pdf
	mupdf /tmp/main.pdf || evince /tmp/main.pdf

test:
	asciidoctor-pdf -a pdf-style=default-notoserif-cjk-tc-pdf-1 -r asciidoctor-pdf-cjk -r ./remove-section-trailing-dot.rb test.adoc -o /tmp/test.pdf
	mupdf /tmp/test.pdf || evince /tmp/test.pdf
