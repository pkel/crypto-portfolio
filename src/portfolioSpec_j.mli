(* Auto-generated from "portfolioSpec.atd" *)


type asset = PortfolioSpec_t.asset = { id: string; amount: float }

type config = PortfolioSpec_t.config = { assets: asset list }

val write_asset :
  Bi_outbuf.t -> asset -> unit
  (** Output a JSON value of type {!asset}. *)

val string_of_asset :
  ?len:int -> asset -> string
  (** Serialize a value of type {!asset}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_asset :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> asset
  (** Input JSON data of type {!asset}. *)

val asset_of_string :
  string -> asset
  (** Deserialize JSON data of type {!asset}. *)

val write_config :
  Bi_outbuf.t -> config -> unit
  (** Output a JSON value of type {!config}. *)

val string_of_config :
  ?len:int -> config -> string
  (** Serialize a value of type {!config}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_config :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> config
  (** Input JSON data of type {!config}. *)

val config_of_string :
  string -> config
  (** Deserialize JSON data of type {!config}. *)

