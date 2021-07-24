let makeProps = (~children: React.element, ~transform: string => string, ()) =>
  {
    "children": children,
    "transform": transform,
  }

@module("ink") external make: React.component<'a> = "Transform"
