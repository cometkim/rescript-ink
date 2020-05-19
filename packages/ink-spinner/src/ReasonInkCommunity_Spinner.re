type spinnerType =
  | Dots
  | Dots2
  | Dots3
  | Dots4
  | Dots5
  | Dots6
  | Dots7
  | Dots8
  | Dots9
  | Dots10
  | Dots11
  | Dots12
  | Dots8Bit
  | Line
  | Line2
  | Pipe
  | SimpleDots
  | SimpleDotsScrolling
  | Star
  | Star2
  | Flip
  | Hamburger
  | GrowVertical
  | GrowHorizontal
  | Balloon
  | Balloon2
  | Noise
  | Bounce
  | BoxBounce
  | BoxBounce2
  | Triangle
  | Arc
  | Circle
  | SquareCorners
  | CircleQuarters
  | CircleHalves
  | Squish
  | Toggle
  | Toggle2
  | Toggle3
  | Toggle4
  | Toggle5
  | Toggle6
  | Toggle7
  | Toggle8
  | Toggle9
  | Toggle10
  | Toggle11
  | Toggle12
  | Toggle13
  | Arrow
  | Arrow2
  | Arrow3
  | BouncingBar
  | BouncingBall
  | Smiley
  | Monkey
  | Hearts
  | Clock
  | Earth
  | Moon
  | Runner
  | Pong
  | Shark
  | Dqpb
  | Weather
  | Christmas
  | Grenade
  | Point
  | Layer
  | BetWave
  ;

let makeProps = (
  ~type_=?,
  (),
) => {
  "type": switch (type_) {
  | Some(Dots) => Some("dots")
  | Some(Dots2) => Some("dots2")
  | Some(Dots3) => Some("dots3")
  | Some(Dots4) => Some("dots4")
  | Some(Dots5) => Some("dots5")
  | Some(Dots6) => Some("dots7")
  | Some(Dots7) => Some("dots7")
  | Some(Dots8) => Some("dots8")
  | Some(Dots9) => Some("dots9")
  | Some(Dots10) => Some("dots10")
  | Some(Dots11) => Some("dots11")
  | Some(Dots12) => Some("dots12")
  | Some(Dots8Bit) => Some("dots8Bit")
  | Some(Line) => Some("line")
  | Some(Line2) => Some("line2")
  | Some(Pipe) => Some("pipe")
  | Some(SimpleDots) => Some("simpleDots")
  | Some(SimpleDotsScrolling) => Some("simpleDotsScrolling")
  | Some(Star) => Some("star")
  | Some(Star2) => Some("star2")
  | Some(Flip) => Some("flip")
  | Some(Hamburger) => Some("hamburger")
  | Some(GrowVertical) => Some("growVertical")
  | Some(GrowHorizontal) => Some("growHorizontal")
  | Some(Balloon) => Some("balloon")
  | Some(Balloon2) => Some("balloon2")
  | Some(Noise) => Some("noise")
  | Some(Bounce) => Some("bounce")
  | Some(BoxBounce) => Some("boxBounce")
  | Some(BoxBounce2) => Some("boxBounce2")
  | Some(Triangle) => Some("triangle")
  | Some(Arc) => Some("arc")
  | Some(Circle) => Some("circle")
  | Some(SquareCorners) => Some("squareCorners")
  | Some(CircleQuarters) => Some("circleQuarters")
  | Some(CircleHalves) => Some("circleHalves")
  | Some(Squish) => Some("squish")
  | Some(Toggle) => Some("toggle")
  | Some(Toggle2) => Some("toggle2")
  | Some(Toggle3) => Some("toggle3")
  | Some(Toggle4) => Some("toggle4")
  | Some(Toggle5) => Some("toggle5")
  | Some(Toggle6) => Some("toggle6")
  | Some(Toggle7) => Some("toggle7")
  | Some(Toggle8) => Some("toggle8")
  | Some(Toggle9) => Some("toggle9")
  | Some(Toggle10) => Some("toggle10")
  | Some(Toggle11) => Some("toggle11")
  | Some(Toggle12) => Some("toggle12")
  | Some(Toggle13) => Some("toggle13")
  | Some(Arrow) => Some("arrow")
  | Some(Arrow2) => Some("arrow2")
  | Some(Arrow3) => Some("arrow3")
  | Some(BouncingBar) => Some("bouncingBar")
  | Some(BouncingBall) => Some("bouncingBall")
  | Some(Smiley) => Some("smiley")
  | Some(Monkey) => Some("monkey")
  | Some(Hearts) => Some("hearts")
  | Some(Clock) => Some("clock")
  | Some(Earth) => Some("earth")
  | Some(Moon) => Some("moon")
  | Some(Runner) => Some("runner")
  | Some(Pong) => Some("pong")
  | Some(Shark) => Some("shark")
  | Some(Dqpb) => Some("dqpb")
  | Some(Weather) => Some("weather")
  | Some(Christmas) => Some("christmas")
  | Some(Grenade) => Some("grenade")
  | Some(Point) => Some("point")
  | Some(Layer) => Some("layer")
  | Some(BetWave) => Some("betWave")
    | None => None
  }
};

[@bs.module "ink-spinner"]
external make: React.component('a) = "default";
