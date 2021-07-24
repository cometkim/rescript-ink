let makeProps = (
  ~ref: option<Ink_Ref.t>,
  ~children: React.element,
  ~transform: string => string,
  (),
) =>
  {
    "ref": ref,
    "children": children,
    "transform": transform,
  }

@module("ink") external make: React.component<'a> = "Transform"
