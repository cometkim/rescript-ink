module Length = {
  type t = int;
};

module Percentage = {
  type t = float;
};

module Color = {
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
    | `keyword(string)
    | `rgb(int, int, int)
    | `hex(string)
    | `hsl(int, int, int)
    | `hsv(int, int, int)
    | `hwb(int, int, int)
    | `ansi(int)
    | `ansi256(int)
  ];

  let toString = color =>
    switch (color) {
    | `black => Some("black")
    | `red => Some("red")
    | `green => Some("green")
    | `yellow => Some("yellow")
    | `blue => Some("blue")
    | `magenta => Some("magenta")
    | `cyan => Some("cyan")
    | `white => Some("white")
    | `gray => Some("gray")
    | `grey => Some("grey")
    | `blackBright => Some("blackBright")
    | `redBright => Some("redBright")
    | `greenBright => Some("greenBright")
    | `yellowBright => Some("yelloBright")
    | `blueBright => Some("blueBright")
    | `magentaBright => Some("magentaBright")
    | `cyanBright => Some("cyanBright")
    | `whiteBright => Some("whiteBright")
    | `hex(hexString) => Some(hexString)
    | `keyword(keyword) => Some(keyword)
    | _ => None
    };
};
