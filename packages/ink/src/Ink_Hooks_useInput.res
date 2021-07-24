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
type inputAsStringHandler = (string, keyState) => unit

type options
@obj external makeUseInputOptions: (~isActive: bool=?, unit) => options = ""

@module("ink")
external useInputAsString: (inputAsStringHandler, options) => unit = "useInput"

let useInput = (inputHandler, ~isActive=?, ()) => {
  useInputAsString(
    (inputAsString, keyState) => inputHandler(inputAsString->String.unsafe_get(0), keyState),
    makeUseInputOptions(~isActive?, ()),
  )
}
