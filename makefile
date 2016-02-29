build:
	pandoc -o modellbildung.pdf 0*.md

fragen:
	pandoc -o fragen.pdf fragen.md

auto_build:
	ls *.md | entr make build
