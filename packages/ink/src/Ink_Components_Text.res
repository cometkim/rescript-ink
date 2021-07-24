include Ink_Style

let makeProps = (
  ~ref: option<Ink_Ref.t>=?,
  ~color: option<color>=?,
  ~backgroundColor: option<color>=?,
  ~dimColor: option<bool>=?,
  ~bold: option<bool>=?,
  ~italic: option<bool>=?,
  ~underline: option<bool>=?,
  ~strikethrough: option<bool>=?,
  ~inverse: option<bool>=?,
  ~wrap: option<textWrap>=?,
  ~children: React.element,
  (),
) =>
  {
    "ref": ref,
    "color": switch color {
    | Some(color) => Some(color->Color.toString)
    | None => None
    },
    "backgroundColor": switch backgroundColor {
    | Some(backgroundColor) => Some(backgroundColor->Color.toString)
    | None => None
    },
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
