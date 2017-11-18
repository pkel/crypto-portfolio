# Crypto Portfolio

This command line tool consumes [coinmarketcap.com's API][cmc] and
produces small reports of your current holdings. The composition of your
portfolio has to be specified in a json file.

[cmc]:https://coinmarketcap.com/api/

```json
{
   "assets" : [
      {
         "amount" : 0.75,
         "id" : "bitcoin"
      },
      {
         "amount" : 3.6,
         "id" : "ethereum"
      },
      {
         "amount" : 42,
         "id" : "dogecoin"
      }
   ]
}
```

You can then generate a report.

```
#> build/crypto-portfolio portfolio.json
Assets:
        1h   24h     7d      rate    amount     value
BTC   +0.1  +0.1  +22.5  6.58e+03  7.50e-01  4.94e+03
ETH   +0.1  +1.6   +8.3  2.87e+02  3.60e+00  1.03e+03
DOGE  +1.2  +3.4  +13.6  1.14e-03  4.20e+01  4.80e-02

Combined:
        1h   24h     7d                         value
      +0.1  +0.3  +19.8                      5.97e+03
#>
```

All command line options can be accessed using the `-h` flag.

## Build

You need the ocaml toolchain and a few opam packages including core and
jbuilder.

```
#> make
```

## Telegram Bot

The repository also contains a small telegram [bot](bot/bot.py) which is
written in python using the [python-telegram-bot package][pbot]. Follow
the telegram [documentation][tdoc] to create a new bot. The
[bot.py](bot/bot.py) program reads the api token from a `api.token` file
in the working directory. The bot only produces reports for users whose
portfolio specification is available in the working directory as
`<user_id>.json`.

[pbot]: https://python-telegram-bot.readthedocs.io/en/stable/
[tdoc]: https://core.telegram.org/bots
