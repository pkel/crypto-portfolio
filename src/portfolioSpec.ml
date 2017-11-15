open Core

type t = PortfolioSpec_t.config

let default =
  let open PortfolioSpec_t in
  { assets =
    [ { id = "bitcoin"; amount = 0.4 }
    ; { id = "ethereum"; amount = 2.1 }
    ; { id = "bitcoin-cash"; amount = 0.1 }
    ]
  }

let read file =
  try In_channel.with_file file ~f:(fun ic ->
    In_channel.input_all ic
    |> PortfolioSpec_j.config_of_string
  ) with
  (* TODO: write default to location when file not present *)
  | Sys_error err -> prerr_endline err ; exit 1
  | Yojson.Json_error err ->
      Printf.eprintf "Json error in %s config file:\n%s\n" file err ;
      exit 1

let write file cfg = ()

let print config =
  PortfolioSpec_j.string_of_config config
  |> Yojson.Safe.prettify
  |> print_endline

