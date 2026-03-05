all: date pdf show

date:
	touch main.adoc

pdf:
	asciidoctor-pdf -a pdf-style=default-notoserif-cjk-tc-pdf-1 -r asciidoctor-pdf-cjk -r ./remove-section-trailing-dot.rb main.adoc -o /tmp/main.pdf

new:
	asciidoctor-pdf -a scripts=cjk -a pdf-theme=face/default-notoserif-cjk-tc-theme.yml -r ./remove-section-trailing-dot.rb main.adoc -o /tmp/main.pdf

orig:
	asciidoctor-pdf -a scripts=cjk main.adoc -o /tmp/main.pdf

test:
	asciidoctor-pdf -a pdf-style=default-notoserif-cjk-tc-pdf-1 -r asciidoctor-pdf-cjk -r ./remove-section-trailing-dot.rb test.adoc -o /tmp/main.pdf

cover:
	libreoffice --headless --convert-to png --outdir /tmp data/cover.odg
	libreoffice --headless --convert-to pdf --outdir /tmp data/cover.odg
	magick /tmp/cover.png -crop 663x865+0+0 image/cover-back.png
	magick /tmp/cover.png -crop 663x865+728+0 image/cover-front.png
	mupdf /tmp/cover.pdf || evince /tmp/cover.pdf &

show:
	mupdf /tmp/main.pdf || evince /tmp/main.pdf &
