open Ink_Style

let makeProps = (
  ~ref: option<Ink_Ref.t>=?,
  ~children: option<React.element>=?,
  ~display: option<display>=?,
  ~flexGrow: option<length>=?,
  ~flexShrink: option<length>=?,
  ~flexBasis: option<flexBasis>=?,
  ~flexDirection: option<flexDirection>=?,
  ~alignItems: option<alignItems>=?,
  ~justifyContent: option<justifyContent>=?,
  ~width: option<size>=?,
  ~minWidth: option<[#length(length)]>=?,
  ~height: option<size>=?,
  ~minHeight: option<[#length(length)]>=?,
  ~margin: option<length>=?,
  ~marginX: option<length>=?,
  ~marginY: option<length>=?,
  ~marginTop: option<length>=?,
  ~marginBottom: option<length>=?,
  ~marginLeft: option<length>=?,
  ~marginRight: option<length>=?,
  ~padding: option<length>=?,
  ~paddingX: option<length>=?,
  ~paddingY: option<length>=?,
  ~paddingTop: option<length>=?,
  ~paddingBottom: option<length>=?,
  ~paddingLeft: option<length>=?,
  ~paddingRight: option<length>=?,
  (),
) =>
  {
    "ref": ref,
    "children": children,
    "display": display,
    "flexGrow": flexGrow,
    "flexShrink": flexShrink,
    "flexBasis": switch flexBasis {
    | Some(#length(len)) => Some(string_of_int(len))
    | Some(#percent(pct)) => Some(Js.Float.toString(pct) ++ "%")
    | Some(#auto) => Some("auto")
    | Some(#fill) => Some("fill")
    | Some(#content) => Some("content")
    | Some(#"max-content") => Some("max-content")
    | Some(#"min-content") => Some("min-content")
    | Some(#"fit-content") => Some("fit-content")
    | None => None
    },
    "flexDirection": flexDirection,
    "alignItems": alignItems,
    "justifyContent": justifyContent,
    "width": width,
    "minWidth": minWidth,
    "height": height,
    "minHeight": minHeight,
    "margin": margin,
    "marginX": marginX,
    "marginY": marginY,
    "marginTop": marginTop,
    "marginBottom": marginBottom,
    "marginLeft": marginLeft,
    "marginRight": marginRight,
    "padding": padding,
    "paddingX": paddingX,
    "paddingY": paddingY,
    "paddingTop": paddingTop,
    "paddingBottom": paddingBottom,
    "paddingLeft": paddingLeft,
    "paddingRight": paddingRight,
  }

@module("ink") external make: React.component<'a> = "Box"
