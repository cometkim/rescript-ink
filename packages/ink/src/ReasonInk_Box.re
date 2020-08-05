open ReasonInk_Style;

let makeProps =
    (
      ~children,
      ~display: option([ | `flex | `none])=?,
      ~flexGrow: option(float)=?,
      ~flexShrink: option(float)=?,
      ~flexBasis: option(flexBasis)=?,
      ~flexDirection: option(flexDirection)=?,
      ~alignItems: option(alignItems)=?,
      ~justifyContent: option(justifyContent)=?,
      ~width: option(Length.t)=?,
      ~minWidth: option(Length.t)=?,
      ~height: option(Length.t)=?,
      ~minHeight: option(Length.t)=?,
      ~margin: option(Length.t)=?,
      ~marginX: option(Length.t)=?,
      ~marginY: option(Length.t)=?,
      ~marginTop: option(Length.t)=?,
      ~marginBottom: option(Length.t)=?,
      ~marginLeft: option(Length.t)=?,
      ~marginRight: option(Length.t)=?,
      ~padding: option(Length.t)=?,
      ~paddingX: option(Length.t)=?,
      ~paddingY: option(Length.t)=?,
      ~paddingTop: option(Length.t)=?,
      ~paddingBottom: option(Length.t)=?,
      ~paddingLeft: option(Length.t)=?,
      ~paddingRight: option(Length.t)=?,
      ~borderStyle: option(borderStyle)=?,
      ~borderColor: option(ForegroundColor.t)=?,
      // ~transformChildren: option(React.element => React.element)=?,
      (),
    ) => {
  "children": children,
  "display": display,
  "flexGrow": flexGrow,
  "flexShrink": flexShrink,
  "flexBasis":
    switch (flexBasis) {
    | Some(`width(length)) => Some(string_of_int(length))
    | Some(`percent(pct)) => Some(pct->Js.Float.toString)
    | Some(`auto) => Some("auto")
    | Some(`fill) => Some("fill")
    | Some(`content) => Some("content")
    | Some(`maxContent) => Some("max-content")
    | Some(`minContent) => Some("min-content")
    | Some(`fitContent) => Some("fit-content")
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
  "borderStyle": borderStyle,
  "borderColor": borderColor,
  // "unstable__transformChildren": transformChildren,
};

[@bs.module "ink"] external make: React.component('a) = "Box";
