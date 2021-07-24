module Style = Ink_Style

let makeProps = (
  ~color: option<Style.color>=?,
  ~backgroundColor: option<Style.color>=?,
  ~dimColor: option<bool>=?,
  ~bold: option<bool>=?,
  ~italic: option<bool>=?,
  ~underline: option<bool>=?,
  ~strikethrough: option<bool>=?,
  ~inverse: option<bool>=?,
  ~wrap: option<Style.textWrap>=?,
  ~children: React.element,
  (),
) =>
  {
    "color": color,
    "backgroundColor": backgroundColor,
    "dimColor": dimColor,
    "bold": bold,
    "intalic": italic,
    "underline": underline,
    "strikethrough": strikethrough,
    "inverse": inverse,
    "wrap": wrap,
    "children": children,
  }

@module("ink") external make: React.component<'a> = "Text"
