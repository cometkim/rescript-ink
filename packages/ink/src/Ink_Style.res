type any
external unwrap: 'a => any = "%identity"

type length = int

type percent = float

module Size = {
  type t = [
    | #length(length)
    | #percent(percent)
  ]

  let unwrap = t => switch t {
  | #length(length) => length->unwrap
  | #percent(percent) => percent->unwrap
  }
}

type size = Size.t

type textWrap = [
  | #wrap
  | #end
  | #middle
  | #"truncate-end"
  | #truncate
  | #"truncate-middle"
  | #"truncate-start"
]

type position = [
  | #absolute
  | #relative
]

module Color = {
  type t = [
    | #black
    | #red
    | #green
    | #yellow
    | #blue
    | #magenta
    | #cyan
    | #white
    | #gray
    | #grey
    | #blackBright
    | #redBright
    | #greenBright
    | #yellowBright
    | #blueBright
    | #magentaBright
    | #cyanBright
    | #whiteBright
    | #hex(string)
    | #rgb(int, int, int)
    | #ansi256(int)
  ]

  let toString = t =>
    switch t {
    | #black => "black"
    | #red => "red"
    | #green => "green"
    | #yellow => "yellow"
    | #blue => "blue"
    | #magenta => "magenta"
    | #cyan => "cyan"
    | #white => "white"
    | #gray => "gray"
    | #grey => "grey"
    | #blackBright => "blackBright"
    | #redBright => "redBright"
    | #greenBright => "greenBright"
    | #yellowBright => "yellowBright"
    | #blueBright => "blueBright"
    | #magentaBright => "magentaBright"
    | #cyanBright => "cyanBright"
    | #whiteBright => "whiteBright"
    | #hex(hex) => hex
    | #rgb(r, g, b) => `rgb(${r->string_of_int}, ${g->string_of_int}, ${b->string_of_int})`
    | #ansi256(ansi) => ansi->string_of_int
    }
}

type color = Color.t

type content = [
  | #content
  | #fill
  | #"max-content"
  | #"min-content"
  | #"fit-content"
]

type display = [
  | #flex
  | #none
]

type alignItems = [
  | #"flex-start"
  | #center
  | #"flex-end"
]

type alignSelf = [
  | #auto
  | #"flex-start"
  | #center
  | #"flex-end"
]

type justifyContent = [
  | #"flex-start"
  | #center
  | #"flex-end"
  | #"space-between"
  | #"space-around"
]

type flexDirection = [
  | #row
  | #"row-reverse"
  | #column
  | #"column-reverse"
]

type borderStyle = [
  | #single
  | #double
  | #round
  | #bold
  | #singleDouble
  | #doubleSingle
  | #classic
  | #arrow
]

type flexBasis = [
  | #auto
  | content
  | size
]
