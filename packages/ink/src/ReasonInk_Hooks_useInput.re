type keyState = {
  upArrow: bool,
  downArrow: bool,
  leftArrow: bool,
  rightArrow: bool,
  return: bool,
  escape: bool,
  ctrl: bool,
  shift: bool,
  meta: bool,
};

type inputHandler = (char, keyState) => unit;
type inputAsStringHandler = (string, keyState) => unit;

type options;

[@bs.obj] external makeUseInputOptions: (~isActive: bool=?, unit) => options;

[@bs.module "ink"]
external useInputAsString: (inputAsStringHandler, options) => unit =
  "useInput";

let useInput = (inputHandler, ~isActive=?, ()) => {
  useInputAsString(
    (inputAsString, keyState) =>
      inputHandler(inputAsString->String.unsafe_get(0), keyState),
    makeUseInputOptions(~isActive?, ()),
  );
};
