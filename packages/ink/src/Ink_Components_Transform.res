let makeProps = (
  ~children: React.element,
  ~transform: string => string,
  ~ref: option<Ink_Ref.r>,
  (),
) =>
  {
    "children": children,
    "transform": transform,
  }

@module("ink") external make: React.component<'a> = "Transform"
