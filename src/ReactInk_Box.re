open ReactInk_Style;

let makeProps =
    (
      ~children,
      ~display: option([ | `flex | `none])=?,
      ~flexGrow: option(float)=?,
      ~flexShrink: option(float)=?,
      ~flexBasis:
         option(
           [
             | `width(Length.t)
             | `auto
             | `fill
             | `content
             | `maxContent
             | `minContent
             | `fitContent
           ],
         )=?,
      ~flexDirection:
         option([ | `raw | `rowReverse | `column | `columnReverse])=?,
      ~alignItems: option([ | `stretch | `flexStart | `center | `flexEnd])=?,
      ~justifyContent:
         option(
           [ | `flexStart | `center | `flexEnd | `spaceBetween | `spaceAround],
         )=?,
      ~textWrap:
         option(
           [
             | `wrap
             | `truncate
             | `truncateStart
             | `truncateMiddle
             | `truncateEnd
           ],
         )=?,
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
      // ~transformChildren: option(React.element => React.element)=?,
      (),
    ) => {
  "children": children,
  "display":
    switch (display) {
    | Some(`flex) => Some("flex")
    | Some(`none) => Some("none")
    | None => None
    },
  "flexGrow": flexGrow,
  "flexShrink": flexShrink,
  "flexBasis":
    switch (flexBasis) {
    | Some(`width(length)) => Some(string_of_int(length))
    | Some(`auto) => Some("auto")
    | Some(`fill) => Some("fill")
    | Some(`content) => Some("content")
    | Some(`maxContent) => Some("max-content")
    | Some(`minContent) => Some("min-content")
    | Some(`fitContent) => Some("fit-content")
    | None => None
    },
  "flexDirection":
    switch (flexDirection) {
    | Some(`raw) => Some("raw")
    | Some(`rowReverse) => Some("raw-reverse")
    | Some(`column) => Some("column")
    | Some(`columnReverse) => Some("column-reverse")
    | None => None
    },
  "alignItems":
    switch (alignItems) {
    | Some(`stretch) => Some("stretch")
    | Some(`flexStart) => Some("flex-start")
    | Some(`center) => Some("center")
    | Some(`flexEnd) => Some("flex-end")
    | None => None
    },
  "justifyContent":
    switch (justifyContent) {
    | Some(`flexStart) => Some("flex-start")
    | Some(`center) => Some("center")
    | Some(`flexEnd) => Some("flex-end")
    | Some(`spaceBetween) => Some("space-between")
    | Some(`spaceAround) => Some("space-around")
    | None => None
    },
  "textWrap":
    switch (textWrap) {
    | Some(`wrap) => Some("wrap")
    | Some(`truncate) => Some("truncate")
    | Some(`truncateStart) => Some("truncate-start")
    | Some(`truncateMiddle) => Some("truncate-middle")
    | Some(`truncateEnd) => Some("truncate-end")
    | None => None
    },
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
  // "unstable__transformChildren": transformChildren,
};

[@bs.module "ink"] external make: React.component('a) = "Box";
