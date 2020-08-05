open ReasonInk_Style;

let makeProps =
    (
      ~bold: option(bool)=?,
      ~italic: option(bool)=?,
      ~underline: option(bool)=?,
      ~strikethrough: option(bool)=?,
      ~invert: option(bool)=?,
      ~dimColor: option(bool)=?,
      ~textWrap: option(textWrap)=?,
      ~color: option(ForegroundColor.t)=?,
      ~backgroundColor: option(BackgroundColor.t)=?,
      ~children: React.element,
      // ~transformChildren: option(React.element => React.element)=?,
      (),
    ) => {
  "bold": bold,
  "intalic": italic,
  "underline": underline,
  "strikethrough": strikethrough,
  "invert": invert,
  "dimColor": dimColor,
  "textWrap": textWrap,
  "color": color,
  "backgroundColor": backgroundColor,
  // "unstable__transformChildren": transformChildren,
  "children": children,
};

[@bs.module "ink"] external make: React.component('a) = "Text";
