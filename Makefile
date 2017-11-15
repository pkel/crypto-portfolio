
default: main.bc

test: main.bc
	build/main.bc

atd:
	atdgen -t src/coinMarketCap.atd
	atdgen -j src/coinMarketCap.atd
	atdgen -t src/portfolioSpec.atd
	atdgen -j src/portfolioSpec.atd

clean:
	rm -rf build src/_build src/.merlin

all: main.bc main.exe

build:
	mkdir build

main.bc: build
	cd src ; jbuilder build main.bc
	rm -f build/main.bc
	ln -s ../src/_build/default/main.bc build/

main.exe: build
	cd src ; jbuilder build main.exe
	rm -f build/main.exe
	ln -s ../src/_build/default/main.exe build/
