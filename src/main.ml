open Core

type extended =
  { o : CoinMarketCap.entry
  ; amount : float
  ; value  : float
  }

let read_spec file =
  In_channel.with_file file ~f:(fun ic ->
    In_channel.input_all ic
    |> PortfolioSpec_j.config_of_string
  )

let print_config config =
  PortfolioSpec_j.string_of_config config
  |> Yojson.Safe.prettify
  |> print_endline

let print_entry entry =
  let open CoinMarketCap_t in
  sprintf "%-4s%+5.1f%+6.1f %.2e"
    entry.o.symbol
    (* entry.o.percent_change_1h *)
    entry.o.percent_change_24h
    entry.o.percent_change_7d
    entry.o.price
    (* entry.amount *)
    (* entry.value *)
  |> print_endline ; entry

let extend amount entry =
  let open CoinMarketCap_t in
  { o = entry ; amount = amount; value = amount *. entry.price }

let fold lst =
  let f (sum, d1h, d24h, d7d) e =
    let open CoinMarketCap_t in
    ( sum  +.  e.value
    , d1h  +. (e.value  /. 100. *. e.o.percent_change_1h)
    , d24h +. (e.value  /. 100. *. e.o.percent_change_24h)
    , d7d  +. (e.value  /. 100. *. e.o.percent_change_7d)
    )
  in
  let (sum, d1h, d24h, d7d) = List.fold ~init:(0.,0.,0.,0.) ~f lst in
  let change d = 100. *. d /. ( sum +. d ) in
  sprintf "SUM %+5.1f%+6.1f %.2e"
    (change d24h) (change d7d) sum
  |> print_endline

let exec config () =
  let cfg = read_spec config in
  let data =
    let open CoinMarketCap in
    get ~quote:EUR ()
  in
  List.map ~f:(fun spec ->
    let open PortfolioSpec_t in
    Map.find data spec.id
    |> function
      | Some x -> extend spec.amount x
      | None -> assert false
    ) cfg.assets
  |> List.sort ~cmp:(fun a b -> Pervasives.compare b.value a.value)
  |> List.map ~f:print_entry
  |> fold

let readme () =
  "No long information provided."

let spec =
  let open Command.Spec in
  empty
  +> anon (maybe_with_default "portfolio.json" ("configuration" %: string))

let command =
  Command.basic
    ~summary:"Report Cryptocurrency Portfolio Value"
    ~readme
    spec
    exec

let () =
  Command.run ~version:"0.1" ~build_info:"RWO" command
