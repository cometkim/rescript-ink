type props

@obj external makeProps: (~id: string=?, ~isActive: bool=?, ~autoFocus: bool=?, unit) => props = ""

type handle = {isFocused: bool}

@module("ink") external useFocus: props => handle = "useFocus"

@inline
let useFocus = (~id: option<string>=?, ~isActive: option<bool>=?, ~autoFocus: option<bool>=?, ()) =>
  useFocus(makeProps(~id?, ~isActive?, ~autoFocus?, ()))
