type t

type currentDomRef = React.ref<Js.nullable<Ink_Intrinsic.t>>

external domRef: currentDomRef => t = "%identity"
external callbackDomRef: (Js.nullable<Ink_Intrinsic.t> => unit) => t = "%identity"
