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

let write_entry : _ -> entry -> _ = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"id\":";
    (
      Yojson.Safe.write_string
    )
      ob x.id;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"name\":";
    (
      Yojson.Safe.write_string
    )
      ob x.name;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"symbol\":";
    (
      Yojson.Safe.write_string
    )
      ob x.symbol;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"rank\":";
    (
      Yojson.Safe.write_int
    )
      ob x.rank;
    if x.price <> 0.0 then (
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"price\":";
      (
        Yojson.Safe.write_float
      )
        ob x.price;
    );
    if x.volume_24h <> 0.0 then (
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"volume_24h\":";
      (
        Yojson.Safe.write_float
      )
        ob x.volume_24h;
    );
    if x.market_cap <> 0.0 then (
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"market_cap\":";
      (
        Yojson.Safe.write_float
      )
        ob x.market_cap;
    );
    if x.available_supply <> 0.0 then (
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"available_supply\":";
      (
        Yojson.Safe.write_float
      )
        ob x.available_supply;
    );
    if x.total_supply <> 0.0 then (
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"total_supply\":";
      (
        Yojson.Safe.write_float
      )
        ob x.total_supply;
    );
    if x.percent_change_1h <> 0.0 then (
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"percent_change_1h\":";
      (
        Yojson.Safe.write_float
      )
        ob x.percent_change_1h;
    );
    if x.percent_change_24h <> 0.0 then (
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"percent_change_24h\":";
      (
        Yojson.Safe.write_float
      )
        ob x.percent_change_24h;
    );
    if x.percent_change_7d <> 0.0 then (
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"percent_change_7d\":";
      (
        Yojson.Safe.write_float
      )
        ob x.percent_change_7d;
    );
    if x.last_updated <> 0 then (
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"last_updated\":";
      (
        Yojson.Safe.write_int
      )
        ob x.last_updated;
    );
    Bi_outbuf.add_char ob '}';
)
let string_of_entry ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_entry ob x;
  Bi_outbuf.contents ob
let read_entry = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_id = ref (Obj.magic (Sys.opaque_identity 0.0)) in
    let field_name = ref (Obj.magic (Sys.opaque_identity 0.0)) in
    let field_symbol = ref (Obj.magic (Sys.opaque_identity 0.0)) in
    let field_rank = ref (Obj.magic (Sys.opaque_identity 0.0)) in
    let field_price = ref (0.0) in
    let field_volume_24h = ref (0.0) in
    let field_market_cap = ref (0.0) in
    let field_available_supply = ref (0.0) in
    let field_total_supply = ref (0.0) in
    let field_percent_change_1h = ref (0.0) in
    let field_percent_change_24h = ref (0.0) in
    let field_percent_change_7d = ref (0.0) in
    let field_last_updated = ref (0) in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 2 -> (
                if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                  0
                )
                else (
                  -1
                )
              )
            | 4 -> (
                match String.unsafe_get s pos with
                  | 'n' -> (
                      if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                        1
                      )
                      else (
                        -1
                      )
                    )
                  | 'r' -> (
                      if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'k' then (
                        3
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 5 -> (
                if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'e' then (
                  4
                )
                else (
                  -1
                )
              )
            | 6 -> (
                if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'y' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'b' && String.unsafe_get s (pos+4) = 'o' && String.unsafe_get s (pos+5) = 'l' then (
                  2
                )
                else (
                  -1
                )
              )
            | 10 -> (
                match String.unsafe_get s pos with
                  | 'm' -> (
                      if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'k' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'c' && String.unsafe_get s (pos+8) = 'a' && String.unsafe_get s (pos+9) = 'p' then (
                        6
                      )
                      else (
                        -1
                      )
                    )
                  | 'v' -> (
                      if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'm' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = '2' && String.unsafe_get s (pos+8) = '4' && String.unsafe_get s (pos+9) = 'h' then (
                        5
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 12 -> (
                match String.unsafe_get s pos with
                  | 'l' -> (
                      if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'u' && String.unsafe_get s (pos+6) = 'p' && String.unsafe_get s (pos+7) = 'd' && String.unsafe_get s (pos+8) = 'a' && String.unsafe_get s (pos+9) = 't' && String.unsafe_get s (pos+10) = 'e' && String.unsafe_get s (pos+11) = 'd' then (
                        12
                      )
                      else (
                        -1
                      )
                    )
                  | 't' -> (
                      if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 's' && String.unsafe_get s (pos+7) = 'u' && String.unsafe_get s (pos+8) = 'p' && String.unsafe_get s (pos+9) = 'p' && String.unsafe_get s (pos+10) = 'l' && String.unsafe_get s (pos+11) = 'y' then (
                        8
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 16 -> (
                if String.unsafe_get s pos = 'a' && String.unsafe_get s (pos+1) = 'v' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'b' && String.unsafe_get s (pos+7) = 'l' && String.unsafe_get s (pos+8) = 'e' && String.unsafe_get s (pos+9) = '_' && String.unsafe_get s (pos+10) = 's' && String.unsafe_get s (pos+11) = 'u' && String.unsafe_get s (pos+12) = 'p' && String.unsafe_get s (pos+13) = 'p' && String.unsafe_get s (pos+14) = 'l' && String.unsafe_get s (pos+15) = 'y' then (
                  7
                )
                else (
                  -1
                )
              )
            | 17 -> (
                if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'c' && String.unsafe_get s (pos+9) = 'h' && String.unsafe_get s (pos+10) = 'a' && String.unsafe_get s (pos+11) = 'n' && String.unsafe_get s (pos+12) = 'g' && String.unsafe_get s (pos+13) = 'e' && String.unsafe_get s (pos+14) = '_' then (
                  match String.unsafe_get s (pos+15) with
                    | '1' -> (
                        if String.unsafe_get s (pos+16) = 'h' then (
                          9
                        )
                        else (
                          -1
                        )
                      )
                    | '7' -> (
                        if String.unsafe_get s (pos+16) = 'd' then (
                          11
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
                else (
                  -1
                )
              )
            | 18 -> (
                if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'c' && String.unsafe_get s (pos+9) = 'h' && String.unsafe_get s (pos+10) = 'a' && String.unsafe_get s (pos+11) = 'n' && String.unsafe_get s (pos+12) = 'g' && String.unsafe_get s (pos+13) = 'e' && String.unsafe_get s (pos+14) = '_' && String.unsafe_get s (pos+15) = '2' && String.unsafe_get s (pos+16) = '4' && String.unsafe_get s (pos+17) = 'h' then (
                  10
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_id := (
              (
                Ag_oj_run.read_string
              ) p lb
            );
            bits0 := !bits0 lor 0x1;
          | 1 ->
            field_name := (
              (
                Ag_oj_run.read_string
              ) p lb
            );
            bits0 := !bits0 lor 0x2;
          | 2 ->
            field_symbol := (
              (
                Ag_oj_run.read_string
              ) p lb
            );
            bits0 := !bits0 lor 0x4;
          | 3 ->
            field_rank := (
              (
                Ag_oj_run.read_int
              ) p lb
            );
            bits0 := !bits0 lor 0x8;
          | 4 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_price := (
                (
                  Ag_oj_run.read_number
                ) p lb
              );
            )
          | 5 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_volume_24h := (
                (
                  Ag_oj_run.read_number
                ) p lb
              );
            )
          | 6 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_market_cap := (
                (
                  Ag_oj_run.read_number
                ) p lb
              );
            )
          | 7 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_available_supply := (
                (
                  Ag_oj_run.read_number
                ) p lb
              );
            )
          | 8 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_total_supply := (
                (
                  Ag_oj_run.read_number
                ) p lb
              );
            )
          | 9 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_percent_change_1h := (
                (
                  Ag_oj_run.read_number
                ) p lb
              );
            )
          | 10 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_percent_change_24h := (
                (
                  Ag_oj_run.read_number
                ) p lb
              );
            )
          | 11 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_percent_change_7d := (
                (
                  Ag_oj_run.read_number
                ) p lb
              );
            )
          | 12 ->
            if not (Yojson.Safe.read_null_if_possible p lb) then (
              field_last_updated := (
                (
                  Ag_oj_run.read_int
                ) p lb
              );
            )
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 2 -> (
                  if String.unsafe_get s pos = 'i' && String.unsafe_get s (pos+1) = 'd' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 4 -> (
                  match String.unsafe_get s pos with
                    | 'n' -> (
                        if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                          1
                        )
                        else (
                          -1
                        )
                      )
                    | 'r' -> (
                        if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'k' then (
                          3
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 5 -> (
                  if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'e' then (
                    4
                  )
                  else (
                    -1
                  )
                )
              | 6 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'y' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'b' && String.unsafe_get s (pos+4) = 'o' && String.unsafe_get s (pos+5) = 'l' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | 10 -> (
                  match String.unsafe_get s pos with
                    | 'm' -> (
                        if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'k' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 'c' && String.unsafe_get s (pos+8) = 'a' && String.unsafe_get s (pos+9) = 'p' then (
                          6
                        )
                        else (
                          -1
                        )
                      )
                    | 'v' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'l' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'm' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = '2' && String.unsafe_get s (pos+8) = '4' && String.unsafe_get s (pos+9) = 'h' then (
                          5
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 12 -> (
                  match String.unsafe_get s pos with
                    | 'l' -> (
                        if String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'u' && String.unsafe_get s (pos+6) = 'p' && String.unsafe_get s (pos+7) = 'd' && String.unsafe_get s (pos+8) = 'a' && String.unsafe_get s (pos+9) = 't' && String.unsafe_get s (pos+10) = 'e' && String.unsafe_get s (pos+11) = 'd' then (
                          12
                        )
                        else (
                          -1
                        )
                      )
                    | 't' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 't' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 's' && String.unsafe_get s (pos+7) = 'u' && String.unsafe_get s (pos+8) = 'p' && String.unsafe_get s (pos+9) = 'p' && String.unsafe_get s (pos+10) = 'l' && String.unsafe_get s (pos+11) = 'y' then (
                          8
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 16 -> (
                  if String.unsafe_get s pos = 'a' && String.unsafe_get s (pos+1) = 'v' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 'a' && String.unsafe_get s (pos+6) = 'b' && String.unsafe_get s (pos+7) = 'l' && String.unsafe_get s (pos+8) = 'e' && String.unsafe_get s (pos+9) = '_' && String.unsafe_get s (pos+10) = 's' && String.unsafe_get s (pos+11) = 'u' && String.unsafe_get s (pos+12) = 'p' && String.unsafe_get s (pos+13) = 'p' && String.unsafe_get s (pos+14) = 'l' && String.unsafe_get s (pos+15) = 'y' then (
                    7
                  )
                  else (
                    -1
                  )
                )
              | 17 -> (
                  if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'c' && String.unsafe_get s (pos+9) = 'h' && String.unsafe_get s (pos+10) = 'a' && String.unsafe_get s (pos+11) = 'n' && String.unsafe_get s (pos+12) = 'g' && String.unsafe_get s (pos+13) = 'e' && String.unsafe_get s (pos+14) = '_' then (
                    match String.unsafe_get s (pos+15) with
                      | '1' -> (
                          if String.unsafe_get s (pos+16) = 'h' then (
                            9
                          )
                          else (
                            -1
                          )
                        )
                      | '7' -> (
                          if String.unsafe_get s (pos+16) = 'd' then (
                            11
                          )
                          else (
                            -1
                          )
                        )
                      | _ -> (
                          -1
                        )
                  )
                  else (
                    -1
                  )
                )
              | 18 -> (
                  if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'c' && String.unsafe_get s (pos+9) = 'h' && String.unsafe_get s (pos+10) = 'a' && String.unsafe_get s (pos+11) = 'n' && String.unsafe_get s (pos+12) = 'g' && String.unsafe_get s (pos+13) = 'e' && String.unsafe_get s (pos+14) = '_' && String.unsafe_get s (pos+15) = '2' && String.unsafe_get s (pos+16) = '4' && String.unsafe_get s (pos+17) = 'h' then (
                    10
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_id := (
                (
                  Ag_oj_run.read_string
                ) p lb
              );
              bits0 := !bits0 lor 0x1;
            | 1 ->
              field_name := (
                (
                  Ag_oj_run.read_string
                ) p lb
              );
              bits0 := !bits0 lor 0x2;
            | 2 ->
              field_symbol := (
                (
                  Ag_oj_run.read_string
                ) p lb
              );
              bits0 := !bits0 lor 0x4;
            | 3 ->
              field_rank := (
                (
                  Ag_oj_run.read_int
                ) p lb
              );
              bits0 := !bits0 lor 0x8;
            | 4 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_price := (
                  (
                    Ag_oj_run.read_number
                  ) p lb
                );
              )
            | 5 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_volume_24h := (
                  (
                    Ag_oj_run.read_number
                  ) p lb
                );
              )
            | 6 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_market_cap := (
                  (
                    Ag_oj_run.read_number
                  ) p lb
                );
              )
            | 7 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_available_supply := (
                  (
                    Ag_oj_run.read_number
                  ) p lb
                );
              )
            | 8 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_total_supply := (
                  (
                    Ag_oj_run.read_number
                  ) p lb
                );
              )
            | 9 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_percent_change_1h := (
                  (
                    Ag_oj_run.read_number
                  ) p lb
                );
              )
            | 10 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_percent_change_24h := (
                  (
                    Ag_oj_run.read_number
                  ) p lb
                );
              )
            | 11 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_percent_change_7d := (
                  (
                    Ag_oj_run.read_number
                  ) p lb
                );
              )
            | 12 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_last_updated := (
                  (
                    Ag_oj_run.read_int
                  ) p lb
                );
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0xf then Ag_oj_run.missing_fields p [| !bits0 |] [| "id"; "name"; "symbol"; "rank" |];
        (
          {
            id = !field_id;
            name = !field_name;
            symbol = !field_symbol;
            rank = !field_rank;
            price = !field_price;
            volume_24h = !field_volume_24h;
            market_cap = !field_market_cap;
            available_supply = !field_available_supply;
            total_supply = !field_total_supply;
            percent_change_1h = !field_percent_change_1h;
            percent_change_24h = !field_percent_change_24h;
            percent_change_7d = !field_percent_change_7d;
            last_updated = !field_last_updated;
          }
         : entry)
      )
)
let entry_of_string s =
  read_entry (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__1 = (
  Ag_oj_run.write_list (
    write_entry
  )
)
let string_of__1 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__1 ob x;
  Bi_outbuf.contents ob
let read__1 = (
  Ag_oj_run.read_list (
    read_entry
  )
)
let _1_of_string s =
  read__1 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_return = (
  write__1
)
let string_of_return ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_return ob x;
  Bi_outbuf.contents ob
let read_return = (
  read__1
)
let return_of_string s =
  read_return (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
