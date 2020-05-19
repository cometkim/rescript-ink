let makeProps =
    (~children: React.element, ~transform: React.element => React.element, ()) => {
  "children": children,
  "transform": transform,
};

[@bs.module "ink"] external make: React.component('a) = "Transform";
