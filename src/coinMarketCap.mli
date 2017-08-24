(* data from coinmarketcap api *)
open Core

type entry = CoinMarketCap_t.entry

type t = entry String.Map.t

type quote_currency =
  | USD
  | EUR
  | BTC

(* get data from api, quote defaults to usd *)
val get: ?quote:quote_currency -> unit -> t

