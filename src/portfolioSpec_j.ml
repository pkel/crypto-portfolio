(* Auto-generated from "portfolioSpec.atd" *)


type asset = PortfolioSpec_t.asset = { id: string; amount: float }

type config = PortfolioSpec_t.config = { assets: asset list }

let write_asset : _ -> asset -> _ = (
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
    Bi_outbuf.add_string ob "\"amount\":";
    (
      Yojson.Safe.write_float
    )
      ob x.amount;
    Bi_outbuf.add_char ob '}';
)
let string_of_asset ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_asset ob x;
  Bi_outbuf.contents ob
let read_asset = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_id = ref (Obj.magic (Sys.opaque_identity 0.0)) in
    let field_amount = ref (Obj.magic (Sys.opaque_identity 0.0)) in
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
            | 6 -> (
                if String.unsafe_get s pos = 'a' && String.unsafe_get s (pos+1) = 'm' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 't' then (
                  1
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
            field_amount := (
              (
                Ag_oj_run.read_number
              ) p lb
            );
            bits0 := !bits0 lor 0x2;
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
              | 6 -> (
                  if String.unsafe_get s pos = 'a' && String.unsafe_get s (pos+1) = 'm' && String.unsafe_get s (pos+2) = 'o' && String.unsafe_get s (pos+3) = 'u' && String.unsafe_get s (pos+4) = 'n' && String.unsafe_get s (pos+5) = 't' then (
                    1
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
              field_amount := (
                (
                  Ag_oj_run.read_number
                ) p lb
              );
              bits0 := !bits0 lor 0x2;
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0x3 then Ag_oj_run.missing_fields p [| !bits0 |] [| "id"; "amount" |];
        (
          {
            id = !field_id;
            amount = !field_amount;
          }
         : asset)
      )
)
let asset_of_string s =
  read_asset (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write__1 = (
  Ag_oj_run.write_list (
    write_asset
  )
)
let string_of__1 ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write__1 ob x;
  Bi_outbuf.contents ob
let read__1 = (
  Ag_oj_run.read_list (
    read_asset
  )
)
let _1_of_string s =
  read__1 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_config : _ -> config -> _ = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"assets\":";
    (
      write__1
    )
      ob x.assets;
    Bi_outbuf.add_char ob '}';
)
let string_of_config ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_config ob x;
  Bi_outbuf.contents ob
let read_config = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_assets = ref (Obj.magic (Sys.opaque_identity 0.0)) in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          if len = 6 && String.unsafe_get s pos = 'a' && String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 's' then (
            0
          )
          else (
            -1
          )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            field_assets := (
              (
                read__1
              ) p lb
            );
            bits0 := !bits0 lor 0x1;
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
            if len = 6 && String.unsafe_get s pos = 'a' && String.unsafe_get s (pos+1) = 's' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 'e' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 's' then (
              0
            )
            else (
              -1
            )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_assets := (
                (
                  read__1
                ) p lb
              );
              bits0 := !bits0 lor 0x1;
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0x1 then Ag_oj_run.missing_fields p [| !bits0 |] [| "assets" |];
        (
          {
            assets = !field_assets;
          }
         : config)
      )
)
let config_of_string s =
  read_config (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
