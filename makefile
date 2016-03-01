build:
	pandoc -o modellbildung.pdf 0*.md -V lang=de-DE

fragen:
	pandoc -o fragen.pdf fragen.md -V lang=de-DE

auto_build:
	ls *.md | entr make build
