let makeProps = (~ref: option<Ink_Ref.t>=?, ~count: option<int>=?, ()) =>
  {
    "ref": ref,
    "count": count,
  }

@module("ink") external make: React.component<'a> = "Newline"
