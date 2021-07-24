// See https://github.com/dominikwilkowski/cfonts#-c---colors
module CFontsColor = {
  type t = [
    | `system
    | `black
    | `red
    | `green
    | `yellow
    | `blue
    | `magenta
    | `cyan
    | `white
    | `gray
    | `redBright
    | `greenBright
    | `yellowBright
    | `blueBright
    | `magentaBright
    | `cyanBright
    | `whiteBright
    | `hex(string)
  ];

  let toString = color => switch(color) {
    | `system => "system"
    | `black => "black"
    | `red => "red"
    | `green => "green"
    | `yellow => "yellow"
    | `blue => "blue"
    | `magenta => "magenta"
    | `cyan => "cyan"
    | `white => "white"
    | `gray => "gray"
    | `redBright => "redBright"
    | `greenBright => "greenBright"
    | `yellowBright => "yellowBright"
    | `blueBright => "blueBright"
    | `magentaBright => "magentaBright"
    | `cyanBright => "cyanBright"
    | `whiteBright => "whiteBright"
    | `hex(hexString) => hexString
  }
};

// See https://github.com/dominikwilkowski/cfonts#-b---background
module CFontsBackground = {
  type t = [
    | `transparent
    | `black
    | `red
    | `green
    | `yellow
    | `blue
    | `magenta
    | `cyan
    | `white
    | `gray
    | `redBright
    | `greenBright
    | `yellowBright
    | `blueBright
    | `magentaBright
    | `cyanBright
    | `whiteBright
  ];

  let toString = color => switch(color) {
    | `transparent => "transparent"
    | `black => "black"
    | `red => "red"
    | `green => "green"
    | `yellow => "yellow"
    | `blue => "blue"
    | `magenta => "magenta"
    | `cyan => "cyan"
    | `white => "white"
    | `gray => "gray"
    | `redBright => "redBright"
    | `greenBright => "greenBright"
    | `yellowBright => "yellowBright"
    | `blueBright => "blueBright"
    | `magentaBright => "magentaBright"
    | `cyanBright => "cyanBright"
    | `whiteBright => "whiteBright"
  }
};

// See https://github.com/dominikwilkowski/cfonts
type font =
  | Block(CFontsColor.t, CFontsColor.t)
  | Slick(CFontsColor.t, CFontsColor.t)
  | Tiny(CFontsColor.t)
  | Grid(CFontsColor.t, CFontsColor.t)
  | Pallet(CFontsColor.t, CFontsColor.t)
  | Shade(CFontsColor.t, CFontsColor.t)
  | Chrome(CFontsColor.t, CFontsColor.t, CFontsColor.t)
  | Simple(CFontsColor.t)
  | SimpleBlock(CFontsColor.t)
  | Simple3d(CFontsColor.t)
  | Normal3d(CFontsColor.t, CFontsColor.t)
  | Huge(CFontsColor.t)
  | Console(CFontsColor.t)
  ;

let makeProps = (
  ~text: string,
  ~font: option(font)=?,
  ~bg: option(CFontsBackground.t)=?,
  ~letterSpacing: option(int)=?,
  ~lineHeight: option(int)=?,
  ~space: option(int)=?,
  ~maxLength: option(int)=?,
  ~align: option([
    | `left
    | `center
    | `right
  ])=?,
  (),
) => {
  "text": text,
  "font": switch (font) {
    | Some(Block(_, _)) => Some("block")
    | Some(Slick(_, _)) => Some("slick")
    | Some(Tiny(_)) => Some("tiny")
    | Some(Grid(_, )) => Some("grid")
    | Some(Pallet(_, _)) => Some("pallet")
    | Some(Shade(_, _)) => Some("shade")
    | Some(Chrome(_, _, _)) => Some("chrome")
    | Some(Simple(_)) => Some("simple")
    | Some(SimpleBlock(_)) => Some("simpleBlock")
    | Some(Simple3d(_)) => Some("simple3d")
    | Some(Normal3d(_, _)) => Some("3d")
    | Some(Huge(_)) => Some("huge")
    | Some(Console(_)) => Some("console")
    | None => None
  },
  "colors": switch(switch (font) {
    | Some(Block(c0, c1)) => Some([|c0, c1|])
    | Some(Slick(c0, c1)) => Some([|c0, c1|])
    | Some(Tiny(c0)) => Some([|c0|])
    | Some(Grid(c0, c1)) => Some([|c0, c1|])
    | Some(Pallet(c0, c1)) => Some([|c0, c1|])
    | Some(Shade(c0, c1)) => Some([|c0, c1|])
    | Some(Chrome(c0, c1, c2)) => Some([|c0, c1, c2|])
    | Some(Simple(c0)) => Some([|c0|])
    | Some(SimpleBlock(c0)) => Some([|c0|])
    | Some(Simple3d(c0)) => Some([|c0|])
    | Some(Normal3d(c0, c1)) => Some([|c0, c1|])
    | Some(Huge(c0)) => Some([|c0|])
    | Some(Console(c0)) => Some([|c0|])
    | None => None
  }) {
    | Some(colors) => Some(colors->Belt.Array.map(CFontsColor.toString))
    | None => None
  },
  "backgroundColor": switch(bg) {
    | Some(color) => Some(color->CFontsBackground.toString)
    | None => None
  },
  "letterSpacing": letterSpacing,
  "lineHeight": lineHeight,
  "space": space,
  "maxLength": maxLength,
  "align": switch (align) {
    | Some(`left) => Some("left")
    | Some(`center) => Some("center")
    | Some(`right) => Some("right")
    | None => None
  },
};

[@bs.module]
external make: React.component('a) = "ink-big-text";