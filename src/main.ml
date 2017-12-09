open Core

type entry_ext =
  { o : CoinMarketCap.entry
  ; amount : float
  ; value  : float
  }

let extend_cmc amount entry =
  let open CoinMarketCap_t in
  { o = entry ; amount; value = amount *. entry.price }

type report_data =
  { assets : entry_ext list
  (* sum in fiat *)
  ; sum : float
  (* changes in percent *)
  ; change_1h : float
  ; change_24h : float
  ; change_7d : float
  }

let prepare_report cmc assets =
  let open PortfolioSpec_t in
  let assets = List.map ~f:(fun spec ->
    Map.find cmc spec.id
    |> function
      | Some x -> extend_cmc spec.amount x
      | None -> Printf.eprintf "Invalid id %s in portfolio specification\n"
            spec.id ; exit 1
    ) assets
  in
  let sum, d1h, d24h, d7d = List.fold ~f:( fun (sum, d1h, d24h, d7d) e ->
      ( sum  +.  e.value
      , d1h  +. (e.value /. (1. +. e.o.percent_change_1h  /. 100.))
      , d24h +. (e.value /. (1. +. e.o.percent_change_24h /. 100.))
      , d7d  +. (e.value /. (1. +. e.o.percent_change_7d  /. 100.))
      ) ) ~init:(0.,0.,0.,0.) assets in
  let change d = (sum -. d) /. d *. 100. in
  { assets ; sum ; change_1h = change d1h ; change_24h = change d24h
  ; change_7d = change d7d }

let allowed_orders =
  "amount, rate or value"

let reorder desc = function
  | None -> (fun x -> x)
  | Some o ->
      let open CoinMarketCap in
      let get = match o with
        | "rate" ->   (fun a -> a.o.price)
        | "amount" -> (fun a -> a.amount)
        | "value" ->  (fun a -> a.value)
        | _ -> Printf.eprintf
                  "Can't order by %s. Please specify one out of %s.\n"
                  o allowed_orders; exit 1
      in let cmp = fun a b ->
        Pervasives.compare (get a) (get b) * (if desc then -1 else 1)
      in fun rep ->
        let assets = List.sort ~cmp rep.assets
        in { rep with assets }


module Short = struct
  open CoinMarketCap
  open Printf

  let print_entry entry =
    printf "%-4s%+5.1f%+6.1f %.2e\n"
      entry.o.symbol
      entry.o.percent_change_24h
      entry.o.percent_change_7d
      entry.o.price

  let print d =
    printf   "Assets:\n";
    printf "      24h    7d     rate\n";
    List.iter ~f:print_entry d.assets ;
    printf "\nCombined:\n";
    printf "      24h    7d    value\n";
    printf "    %+5.1f%+6.1f %.2e\n"
      d.change_24h d.change_7d d.sum
end

module Long = struct
  open CoinMarketCap
  open Printf

  let print_entry entry =
    printf "%-5s%+6.1f%+6.1f%+7.1f  %.2e  %.2e  %.2e\n"
      entry.o.symbol
      entry.o.percent_change_1h
      entry.o.percent_change_24h
      entry.o.percent_change_7d
      entry.o.price
      entry.amount
      entry.value

  let print d =
    printf   "Assets:\n";
    printf "         1h   24h     7d      rate    amount     value\n";
    List.iter ~f:print_entry d.assets ;
    printf "\nCombined:\n";
    printf "         1h   24h     7d                         value\n";
    printf "     %+6.1f%+6.1f%+7.1f                      %.2e\n"
      d.change_1h d.change_24h d.change_7d d.sum
end

let exec desc order short config () =
  let cfg = PortfolioSpec.read config in
  let reorder = reorder desc order in
  let data =
    CoinMarketCap.(get ~quote:EUR ())
  in
  let print = if short then Short.print else Long.print in
  prepare_report data cfg.assets
  |> reorder
  |> print

let readme () =
  String.concat ~sep:"\n"
    [ "CONFIGURATION    File containing portfolio description. If none is"
    ; "                 given the program defaults to ./portfolio.json"
    ]

let spec =
  let open Command.Spec in
  empty
  +> flag ~aliases:["desc"]  "d" no_arg ~doc:"sort descending instead of ascending"
  +> flag ~aliases:["order"] "o" (optional string) ~doc:("order sort assets by " ^ allowed_orders )
  +> flag ~aliases:["short"] "s" no_arg ~doc:"print short version of the report"
  +> anon (maybe_with_default "portfolio.json" ("configuration" %: string))

let command =
  Command.basic
    ~summary:"Report Cryptocurrency Portfolio Value"
    ~readme
    spec
    exec

let () =
  Command.run ~version:"0.1" ~build_info:"RWO" command
