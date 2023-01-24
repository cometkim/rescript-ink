type handle = {isFocused: bool}

let useFocus: (~id: string=?, ~isActive: bool=?, ~autoFocus: bool=?, unit) => handle
