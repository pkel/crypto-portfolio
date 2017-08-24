.PHONY: run run_byte run_native main main.byte main.native clean force atd

run: run_native

run_byte: main.byte
	./main.byte ~/portfolio.json

run_native: main.native
	./main.native ~/portfolio.json

atd:
	atdgen -t src/coinMarketCap.atd
	atdgen -j src/coinMarketCap.atd
	atdgen -t src/portfolioSpec.atd
	atdgen -j src/portfolioSpec.atd

clean:
	rm -rf main.native main.byte _build

force: clean main

main: main.native

main.byte:
	corebuild main.byte

main.native:
	corebuild main.native
