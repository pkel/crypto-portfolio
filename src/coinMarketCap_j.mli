(* Auto-generated from "coinMarketCap.atd" *)


type entry = CoinMarketCap_t.entry = {
  id: string;
  name: string;
  symbol: string;
  rank: int;
  price: float;
  volume_24h: float;
  market_cap: float;
  available_supply: float;
  total_supply: float;
  percent_change_1h: float;
  percent_change_24h: float;
  percent_change_7d: float;
  last_updated: int
}

type return = CoinMarketCap_t.return

val write_entry :
  Bi_outbuf.t -> entry -> unit
  (** Output a JSON value of type {!entry}. *)

val string_of_entry :
  ?len:int -> entry -> string
  (** Serialize a value of type {!entry}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_entry :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> entry
  (** Input JSON data of type {!entry}. *)

val entry_of_string :
  string -> entry
  (** Deserialize JSON data of type {!entry}. *)

val write_return :
  Bi_outbuf.t -> return -> unit
  (** Output a JSON value of type {!return}. *)

val string_of_return :
  ?len:int -> return -> string
  (** Serialize a value of type {!return}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_return :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> return
  (** Input JSON data of type {!return}. *)

val return_of_string :
  string -> return
  (** Deserialize JSON data of type {!return}. *)

