type t = {exit: option<Js.Exn.t> => unit}

@module("ink") external use: unit => t = "useApp"
