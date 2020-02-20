DATE = $(shell date -I)

all: pdf

pdf:
	asciidoctor-pdf master.adoc

clean:
	rm -f master.pdf
