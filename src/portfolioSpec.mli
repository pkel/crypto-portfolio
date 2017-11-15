type t = PortfolioSpec_t.config

val default : t

val print : t -> unit

(** IO/JSON exceptions ! *)
val read : string -> t
val write : string -> t -> unit
