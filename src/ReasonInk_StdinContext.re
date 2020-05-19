type t = {
  stdin: Js.Nullable.t(NodeJs.Stream.readable),
  setRawMode: bool => unit,
  isRawModeSupported: bool,
};

[@bs.module "ink"] external context: React.Context.t(t) = "StdinContext";

[@bs.module "ink"] external use: unit => t = "useStdin";

module Provider = {
  let make = context->React.Context.provider;
};
