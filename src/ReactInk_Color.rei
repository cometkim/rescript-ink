open ReactInk_Style;

let makeProps: (
  ~children: React.element,
  ~fg: Color.t=?,
  ~bg: Color.t=?,
  unit,
) => {
      .
    "children": React.element,
    // Foreground colors
    "rgb": option(array(int)),
    "hex": option(string),
    "keyword": option(string),
    "hsl": option(array(int)),
    "hsv": option(array(int)),
    "hwb": option(array(int)),
    "ansi": option(int),
    "ansi256": option(int),
    // Background colors
    "bgRgb": option(array(int)),
    "bgHex": option(string),
    "bgKeyword": option(string),
    "bgHsl": option(array(int)),
    "bgHsv": option(array(int)),
    "bgHwb": option(array(int)),
    "bgAnsi": option(int),
    "bgAnsi256": option(int),
  };

[@bs.module "ink"] external make: React.component('a) = "Color";
