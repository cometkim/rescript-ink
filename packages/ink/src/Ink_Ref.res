type t

type currentDomRef = React.ref<Js.nullable<Ink_Element.t>>

external domRef: currentDomRef => t = "%identity"
external callbackDomRef: (Js.nullable<Ink_Element.t> => unit) => t = "%identity"
