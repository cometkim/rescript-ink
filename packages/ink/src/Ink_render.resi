type renderInstance = {
  rerender: React.element => unit,
  unmount: option<Js.Exn.t> => unit,
  waitUntilExit: unit => Js.Promise.t<unit>,
  cleanup: unit => unit,
  clear: unit => unit,
}

let render: (
  React.element,
  ~debug: bool=?,
  ~exitOnCtrlC: bool=?,
  ~patchConsole: bool=?,
  unit,
) => renderInstance
