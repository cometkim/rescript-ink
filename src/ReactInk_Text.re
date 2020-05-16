let makeProps =
    (
      ~bold: option(bool)=?,
      ~italic: option(bool)=?,
      ~underline: option(bool)=?,
      ~strikethrough: option(bool)=?,
      ~children: React.element,
      // ~transformChildren: option(React.element => React.element)=?,
      (),
    ) => {
  "bold": bold,
  "intalic": italic,
  "underline": underline,
  "strikethrough": strikethrough,
  // "unstable__transformChildren": transformChildren,
  "children": children,
};

[@bs.module "ink"] external make: React.component('a) = "Text";
