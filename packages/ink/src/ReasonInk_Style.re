module Length = {
  type t = int;
};

module Percentage = {
  type t = float;
};

module ForegroundColor = {
  type t = [
    | `black
    | `red
    | `green
    | `yellow
    | `blue
    | `magenta
    | `cyan
    | `white
    | `gray
    | `grey
    | `orange // Yes, there is a orange
    | `blackBright
    | `redBright
    | `greenBright
    | `yellowBright
    | `blueBright
    | `magentaBright
    | `cyanBright
    | `whiteBright
  ];
};

module BackgroundColor = {
  type t = [
    | `black
    | `red
    | `green
    | `yellow
    | `blue
    | `magenta
    | `cyan
    | `white
    | `gray
    | `grey
    | `blackBright
    | `redBright
    | `greenBright
    | `yellowBright
    | `blueBright
    | `magentaBright
    | `cyanBright
    | `whiteBright
  ];
};

module ColorMethod = {
  type t = [
    | `rgb(int, int, int)
    | `hex(string)
    | `hsl(int, int, int)
    | `hsv(int, int, int)
    | `hwb(int, int, int)
    | `ansi(int)
    | `ansi256(int)
    | `keyword(string)
  ];
};

type borderStyle = [
  | `single
  | `double
  | `round
  | `bold
  | `singleDouble
  | `doubleSingle
  | `classic
];

type position = [
  | `absoulte
  | `relative
];

type flexBasis = [
  | `width(Length.t)
  | `percent(Percentage.t)
  | `auto
  | `fill
  | `content
  | [@as "max-content"] `maxContent
  | [@as "min-content"] `minContent
  | [@as "fit-content"] `fitContent
];

type flexDirection = [
  | `raw
  | [@as "row-reverse"] `rowReverse
  | `column
  | [@as "column-reverse"] `columnReverse
];

type alignItems = [
  | `stretch
  | [@as "flex-start"] `flexStart
  | `center
  | [@as "flex-end"] `flexEnd
];

type justifyContent = [
  | [@as "flex-start"] `flexStart
  | `center
  | [@as "flex-end"] `flexEnd
  | [@as "space-between"] `spaceBetween
  | [@as "space-around"] `spaceAround
];

type textWrap = [
  | `wrap
  | [@as "end"] `end_
  | [@as "end"] `_end
  | `middle
  | [@as "truncate-end"] `truncateEnd
  | `truncate
  | [@as "truncate-middle"] `truncateMiddle
  | [@as "truncate-start"] `truncateStart
];

