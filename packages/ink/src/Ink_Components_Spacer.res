let makeProps = (~key: option<string>=?, ~ref: option<Ink_Ref.t>=?, ()) =>
  {
    "key": key,
    "ref": ref,
  }

@module("ink") external make: React.component<'a> = "Spacer"
