build:
	pandoc -o modellbildung.pdf 0*.md

auto_build:
	ls *.md | entr make build
