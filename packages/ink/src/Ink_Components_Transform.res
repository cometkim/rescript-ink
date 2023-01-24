let makeProps = (
  ~key: option<string>,
  ~ref: option<Ink_Ref.t>,
  ~children: React.element,
  ~transform: string => string,
  (),
) =>
  {
    "key": key,
    "ref": ref,
    "children": children,
    "transform": transform,
  }

@module("ink") external make: React.component<'a> = "Transform"
