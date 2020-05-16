open ReactInk_Style;

let makeRgbProp = color =>
  switch (color) {
  | Some(`rgb(r, g, b)) => Some([|r, g, b|])
  | _ => None
  };

let makeHexProp = color =>
  switch (color) {
  | Some(`hex(hexString)) => Some(hexString)
  | _ => None
  };

let makeKeywordProp = color =>
  switch (color) {
  | Some(color) => color->Color.toString
  | None => None
  };

let makeHslProp = color =>
  switch (color) {
  | Some(`hsl(h, s, l)) => Some([|h, s, l|])
  | _ => None
  };

let makeHsvProp = color =>
  switch (color) {
  | Some(`hsv(h, s, v)) => Some([|h, s, v|])
  | _ => None
  };

let makeHwbProp = color =>
  switch (color) {
  | Some(`hwb(h, w, b)) => Some([|h, w, b|])
  | _ => None
  };

let makeAnsiProp = color =>
  switch (color) {
  | Some(`ansi(ansiValue)) => Some(ansiValue)
  | _ => None
  };

let makeAnsi256Prop = color =>
  switch (color) {
  | Some(`ansi(ansi256Value)) => Some(ansi256Value)
  | _ => None
  };

let makeProps =
    (
      ~children: React.element,
      ~fg: option(Color.t)=?,
      ~bg: option(Color.t)=?,
      (),
    ) => {
  {
    "children": children,
    // Foreground colors
    "rgb": makeRgbProp(fg),
    "hex": makeHexProp(fg),
    "keyword": makeKeywordProp(fg),
    "hsl": makeHslProp(fg),
    "hsv": makeHsvProp(fg),
    "hwb": makeHwbProp(fg),
    "ansi": makeAnsiProp(fg),
    "ansi256": makeAnsi256Prop(fg),
    // Background colors
    "bgRgb": makeRgbProp(bg),
    "bgHex": makeHexProp(bg),
    "bgKeyword": makeKeywordProp(bg),
    "bgHsl": makeHslProp(bg),
    "bgHsv": makeHsvProp(bg),
    "bgHwb": makeHwbProp(bg),
    "bgAnsi": makeAnsiProp(bg),
    "bgAnsi256": makeAnsi256Prop(bg),
  };
};

[@bs.module "ink"] external make: React.component('a) = "Color";
