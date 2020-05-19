module App = ReasonInk_App;
module Box = ReasonInk_Box;
module Text = ReasonInk_Text;
module Color = ReasonInk_Color;
module Hooks = ReasonInk_Hooks;

type renderInstance = {
  rerender: React.element => unit,
  unmount: option(Js.Exn.t) => unit,
  waitUntilExit: unit => Js.Promise.t(unit),
  cleanup: option(unit => unit),
};

let render:
  (
    React.element,
    ~stdin: NodeJs.Stream.writable=?,
    ~stdout: NodeJs.Stream.readable=?,
    ~stderr: NodeJs.Stream.readable=?,
    ~debug: bool=?,
    ~exitOnCtrlC: bool=?,
    unit
  ) =>
  renderInstance;
