type t = {
  stdout: Js.Nullable.t(NodeJs.Stream.writable),
  write: string => unit,
};

[@bs.module "ink"] external context: React.Context.t(t) = "StdoutContext";

[@bs.module "ink"] external use: unit => t = "useStdout";

module Provider = {
  let make = context->React.Context.provider;
};
