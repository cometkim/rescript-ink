let makeProps = (
  ~children: option(React.element)=?,
  ~url: option(string)=?,
  ~fallback: option(string)=?,
  (),
) => {
  "children": children,
  "url": url,
  "fallback": fallback,
};

[@bs.module]
external make: React.component('a) = "ink-link";

