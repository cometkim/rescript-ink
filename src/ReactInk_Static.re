let makeProps = (items: array('a), renderItems: ('a, int) => React.element) => {
  "items": items,
  "children": renderItems,
};

[@bs.module "ink"] external make: React.component('a) = "Static";
