type renderInstance = {
  rerender: React.element => unit,
  unmount: option<Js.Exn.t> => unit,
  waitUntilExit: unit => Js.Promise.t<unit>,
  cleanup: unit => unit,
  clear: unit => unit,
}

type renderOptions

@obj
external makeRenderOptions: (
  ~debug: bool=?,
  ~exitOnCtrlC: bool=?,
  ~patchConsole: bool=?,
  unit,
) => renderOptions = ""

@module("ink")
external render_: (React.element, renderOptions) => renderInstance = "render"

let render = (element, ~debug=?, ~exitOnCtrlC=?, ~patchConsole=?, ()) =>
  render_(element, makeRenderOptions(~debug?, ~exitOnCtrlC?, ~patchConsole?, ()))
