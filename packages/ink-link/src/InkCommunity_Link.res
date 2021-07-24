let makeProps = (
  ~children: option<React.element>=?,
  ~url: option<string>=?,
  ~fallback: option<bool>=?,
  (),
) =>
  {
    "children": children,
    "url": url,
    "fallback": fallback,
  }

@module external make: React.component<'a> = "ink-link"
