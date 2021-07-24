type handle = {isFocused: bool}

let useFocus: (~isActive: bool=?, ~autoFocus: bool=?, unit) => handle
