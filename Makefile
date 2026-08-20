all: date img cover pdf

date:
	touch main.adoc

img:
	libreoffice --headless --convert-to png --outdir image data/sys-hier.odp
	libreoffice --headless --convert-to png --outdir image data/file-sys-hier.odp
	libreoffice --headless --convert-to png --outdir image data/terminal.odp
#	libreoffice --headless --convert-to svg --outdir image data/sys-hier.odp
#	libreoffice --headless --convert-to svg --outdir image data/file-sys-hier.odp
#	libreoffice --headless --convert-to svg --outdir image data/terminal.odp

cover:
	libreoffice --headless --convert-to png --outdir /tmp data/cover.odg
	libreoffice --headless --convert-to pdf --outdir /tmp data/cover.odg
	magick /tmp/cover.png -crop 671x873+0+0 image/cover-back.png
	magick /tmp/cover.png -crop 671x873+738+0 image/cover-front.png
	mupdf /tmp/cover.pdf || evince /tmp/cover.pdf &

pdf:
	asciidoctor-pdf -a scripts=cjk -a pdf-theme=local-theme.yml -r ./remove-section-trailing-dot.rb main.adoc -o /tmp/book.pdf
	mupdf /tmp/book.pdf || evince /tmp/book.pdf &
