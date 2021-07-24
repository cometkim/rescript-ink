type t = {
  setRawMode: bool => unit,
  isRawModeSupported: bool,
}

@module("ink") external use: unit => t = "useStdin"
