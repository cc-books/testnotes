DATE = $(shell date -I)

all: pdf

pdf:
	asciidoctor-pdf -r asciidoctor-pdf-cjk master.adoc
	if test -n "$DISPLAY"; then mupdf master.pdf; fi &

clean:
	rm -f master.pdf
