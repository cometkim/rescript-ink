let makeProps = (~count: option<int>=?, ()) =>
  {
    "count": count,
  }

@module("ink") external make: React.component<'a> = "Newline"
