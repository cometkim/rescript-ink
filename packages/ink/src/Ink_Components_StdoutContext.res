type t = {write: string => unit}

@module("ink") external use: unit => t = "useStdout"
