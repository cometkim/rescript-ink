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
type inputHandler_ = (string, keyState) => unit;

type options;

[@bs.obj] external makeUseInputOptions: (~isActive: bool=?, unit) => options;

[@bs.module "ink"]
external useInput_: (inputHandler_, options) => unit = "useInput";

let useInput = (inputHandler, ~isActive=?, ()) => {
  useInput_(
    (inputAsString, keyState) =>
      inputHandler(inputAsString->String.unsafe_get(0), keyState),
    makeUseInputOptions(~isActive?, ()),
  );
};
