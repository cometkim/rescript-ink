module App = ReactInk_App;
module Box = ReactInk_Box;
module Text = ReactInk_Text;
module Color = ReactInk_Color;
module Hooks = ReactInk_Hooks;

type renderInstance = {
  rerender: React.element => unit,
  unmount: option(Js.Exn.t) => unit,
  waitUntilExit: unit => Js.Promise.t(unit),
  cleanup: option(unit => unit),
};

type renderOptions;

[@bs.obj]
external makeRenderOptions:
  (
    ~stdin: NodeJs.Stream.writable=?,
    ~stdout: NodeJs.Stream.readable=?,
    ~stderr: NodeJs.Stream.readable=?,
    ~debug: bool=?,
    ~exitOnCtrlC: bool=?,
    unit
  ) =>
  renderOptions;

[@bs.module "ink"]
external render_: (React.element, renderOptions) => renderInstance = "render";

let render =
    (element, ~stdin=?, ~stdout=?, ~stderr=?, ~debug=?, ~exitOnCtrlC=?, ()) =>
  render_(
    element,
    makeRenderOptions(
      ~stdin?,
      ~stdout?,
      ~stderr?,
      ~debug?,
      ~exitOnCtrlC?,
      (),
    ),
  );
