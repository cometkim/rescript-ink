let makeProps = (~key: option<string>=?, ~ref: option<Ink_Ref.t>=?, ~count: option<int>=?, ()) =>
  {
    "key": key,
    "ref": ref,
    "count": count,
  }

@module("ink") external make: React.component<'a> = "Newline"
