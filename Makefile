all: crypto-portfolio

test: crypto-portfolio
	./crypto-portfolio

atd:
	atdgen -t src/coinMarketCap.atd
	atdgen -j src/coinMarketCap.atd
	atdgen -t src/portfolioSpec.atd
	atdgen -j src/portfolioSpec.atd

atd-clean:
	rm -f src/coinMarketCap_[tj].ml*
	rm -f src/portfolioSpec_[tj].ml*

clean:
	rm -rf crypto-portfolio src/_build src/.merlin bot/report

build:
	mkdir build

.PHONY: bot
bot: crypto-portfolio
	rm -f bot/report
	cp crypto-portfolio bot/report

push-bot: bot
	rsync bot/ jdenali:portfolio-bot/ -rv

.PHONY: crypto-portfolio
crypto-portfolio:
	cd src ; jbuilder build main.exe
	rm -f crypto-portfolio
	ln -s src/_build/default/main.exe crypto-portfolio
