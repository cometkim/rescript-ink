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

type color = [
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
]

type length = int

type percent = float

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
  | #row
  | #column
  | #"row-reverse"
  | #"column-reverse"
]

type alignSelf = [
  | #"flex-start"
  | #center
  | #"flex-end"
  | #stretch
]

type justifyContent = [
  | #"flex-start"
  | #"flex-end"
  | #"space-between"
  | #"space-around"
  | #center
]

type flexDirection = [
  | #row
  | #column
  | #"row-reverse"
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

type width = [
  | #auto
  | #percent(percent)
  | #length(length)
]

type flexBasis = [
  | content
  | width
]
