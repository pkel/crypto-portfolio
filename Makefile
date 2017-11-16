
default: main.bc

test: main.bc
	build/main.bc

atd:
	atdgen -t src/coinMarketCap.atd
	atdgen -j src/coinMarketCap.atd
	atdgen -t src/portfolioSpec.atd
	atdgen -j src/portfolioSpec.atd

atd-clean:
	rm -f src/coinMarketCap_[tj].ml*
	rm -f src/portfolioSpec_[tj].ml*

clean:
	rm -rf build src/_build src/.merlin

all: main.bc main.exe

build:
	mkdir build

bot: main.exe
	rm -f bot/main
	cp src/_build/default/main.exe bot/main

main.bc: build
	cd src ; jbuilder build main.bc
	rm -f build/main.bc
	ln -s ../src/_build/default/main.bc build/

main.exe: build
	cd src ; jbuilder build main.exe
	rm -f build/main.exe
	ln -s ../src/_build/default/main.exe build/
