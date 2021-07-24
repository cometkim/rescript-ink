open Ink_Style

type styleProp = {
  textWrap: option<textWrap>,
  marginTop: option<length>,
  marginBottom: option<length>,
  marginLeft: option<length>,
  marginRight: option<length>,
  paddingTop: option<length>,
  paddingBottom: option<length>,
  paddingLeft: option<length>,
  paddingRight: option<length>,
  flexGrow: option<length>,
  flexShrink: option<length>,
  flexDirection: option<flexDirection>,
  flexBasis: option<flexBasis>,
  alignItems: option<alignItems>,
  alignSelf: option<alignSelf>,
  justifyContent: option<justifyContent>,
  width: option<length>,
  height: option<length>,
  minWidth: option<length>,
  minHeight: option<length>,
  dispay: option<display>,
  borderStyle: option<borderStyle>,
  borderColor: option<color>,
}

@obj
external makeStyleProp: (
  ~textWrap: textWrap=?,
  ~marginTop: length=?,
  ~marginBottom: length=?,
  ~marginLeft: length=?,
  ~marginRight: length=?,
  ~paddingTop: length=?,
  ~paddingBottom: length=?,
  ~paddingLeft: length=?,
  ~paddingRight: length=?,
  ~flexGrow: length=?,
  ~flexShrink: length=?,
  ~flexDirection: flexDirection=?,
  ~flexBasis: flexBasis=?,
  ~alignItems: alignItems=?,
  ~alignSelf: alignSelf=?,
  ~justifyContent: justifyContent=?,
  ~width: length=?,
  ~height: length=?,
  ~minWidth: length=?,
  ~minHeight: length=?,
  ~dispay: display=?,
  ~borderStyle: borderStyle=?,
  ~borderColor: color=?,
  unit,
) => styleProp = ""

type style = {
  textWrap: option<textWrap>,
  marginTop: option<length>,
  marginBottom: option<length>,
  marginLeft: option<length>,
  marginRight: option<length>,
  paddingTop: option<length>,
  paddingBottom: option<length>,
  paddingLeft: option<length>,
  paddingRight: option<length>,
  flexGrow: option<length>,
  flexShrink: option<length>,
  flexDirection: option<flexDirection>,
  flexBasis: option<string>,
  alignItems: option<alignItems>,
  alignSelf: option<alignSelf>,
  justifyContent: option<justifyContent>,
  width: option<length>,
  height: option<length>,
  minWidth: option<length>,
  minHeight: option<length>,
  dispay: option<display>,
  borderStyle: option<borderStyle>,
  borderColor: option<string>,
}

let convert = (styleProp: option<styleProp>) =>
  switch styleProp {
  | None => None
  | Some({
      textWrap,
      marginTop,
      marginBottom,
      marginLeft,
      marginRight,
      paddingTop,
      paddingBottom,
      paddingLeft,
      paddingRight,
      flexGrow,
      flexShrink,
      flexDirection,
      flexBasis,
      alignItems,
      alignSelf,
      justifyContent,
      width,
      height,
      minWidth,
      minHeight,
      dispay,
      borderStyle,
      borderColor,
    }) =>
    Some({
      textWrap: textWrap,
      marginTop: marginTop,
      marginBottom: marginBottom,
      marginLeft: marginLeft,
      marginRight: marginRight,
      paddingTop: paddingTop,
      paddingBottom: paddingBottom,
      paddingLeft: paddingLeft,
      paddingRight: paddingRight,
      flexGrow: flexGrow,
      flexShrink: flexShrink,
      flexDirection: flexDirection,
      flexBasis: switch flexBasis {
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
      alignItems: alignItems,
      alignSelf: alignSelf,
      justifyContent: justifyContent,
      width: width,
      height: height,
      minWidth: minWidth,
      minHeight: minHeight,
      dispay: dispay,
      borderStyle: borderStyle,
      borderColor: switch borderColor {
      | Some(borderColor) => Some(borderColor->Color.toString)
      | None => None
      },
    })
  }

let makeProps = (
  ~ref: option<Ink_Ref.t>=?,
  ~items: array<'a>,
  ~renderItems: ('a, int) => React.element,
  ~style: option<styleProp>=?,
  (),
) =>
  {
    "ref": ref,
    "items": items,
    "children": renderItems,
    "style": style->convert,
  }

@module("ink") external make: React.component<'a> = "Static"
