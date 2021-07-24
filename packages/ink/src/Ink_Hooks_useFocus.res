type props

@obj external makeProps: (~isActive: bool=?, ~autoFocus: bool=?, unit) => props = ""

type handle = {isFocused: bool}

@module("ink") external _useFocus: props => handle = "useFocus"

let useFocus = (~isActive: option<bool>=?, ~autoFocus: option<bool>=?, ()) =>
  _useFocus(makeProps(~isActive?, ~autoFocus?, ()))
