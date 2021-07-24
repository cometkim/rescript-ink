type keyState = {
  upArrow: bool,
  downArrow: bool,
  leftArrow: bool,
  rightArrow: bool,
  return: bool,
  escape: bool,
  ctrl: bool,
  shift: bool,
  tab: bool,
  backspace: bool,
  delete: bool,
  meta: bool,
}

type inputHandler = (char, keyState) => unit

let useInput: (inputHandler, ~isActive: bool=?, unit) => unit
