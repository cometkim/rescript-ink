type t = {
  stderr: Js.Nullable.t(NodeJs.Stream.writable),
  write: string => unit,
};

[@bs.module "ink"] external context: React.Context.t(t) = "StderrContext";

[@bs.module "ink"] external use: unit => t = "useStderr";

module Provider = {
  let make = context->React.Context.provider;
};
