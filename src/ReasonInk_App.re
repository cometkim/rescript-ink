module Context = {
  type t = {exit: option(Js.Exn.t) => unit};

  [@bs.module "ink"] external use: unit => t = "useApp";
};

let makeProps =
    (
      ~children: React.element,
      ~stdin: NodeJs.Stream.readable,
      ~stdout: NodeJs.Stream.writable,
      ~stderr: NodeJs.Stream.writable,
      ~writeToStdout: string => unit,
      ~writeToStderr: string => unit,
      ~exitOnCtrlC: bool,
      ~onExit: option(Js.Exn.t) => unit,
      (),
    ) => {
  "children": children,
  "stdin": stdin,
  "stdout": stdout,
  "stderr": stderr,
  "writeToStdout": writeToStdout,
  "writeToStderr": writeToStderr,
  "exitOnCtrlC": exitOnCtrlC,
  "onExit": onExit,
};

[@bs.module "ink"] external make: React.component('a) = "App";
