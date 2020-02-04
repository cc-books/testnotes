DATE = $(shell date -I)

all: pdf

pdf:
	asciidoctor --backend=pdf --require=asciidoctor-pdf --out-file=${DATE}.pdf main.adoc

clean:
	rm -f *.pdf
