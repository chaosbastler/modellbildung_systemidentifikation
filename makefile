open:
	pandoc -o modellbildung.pdf modellbildung.md
	open modellbildung.pdf

build:
	pandoc -o modellbildung.pdf modellbildung.md

auto_build:
	ls *.md | entr make build
