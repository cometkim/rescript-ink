open Ink

module Robot = {
  @react.component
  let make = () => {
    let {exit} = useApp()
    let (x, setX) = React.useState(() => 1)
    let (y, setY) = React.useState(() => 1)

    useInput((input, key) => {
      if input == 'q' {
        exit(None)
      }

      open Js

      if key.leftArrow {
        setX(x => Math.max_int(1, x - 1))
      }

      if key.rightArrow {
        setX(x => Math.min_int(20, x + 1))
      }

      if key.upArrow {
        setY(y => Math.max_int(1, y - 1))
      }

      if key.downArrow {
        setY(y => Math.min_int(10, y + 1))
      }
    }, ())

    <Box flexDirection=#column>
      <Text> {React.string("Use arrow keys to move the face. Press “q” to exit.")} </Text>
      <Box height={#length(12)} paddingLeft={x} paddingTop={y}>
        <Text> {React.string("^_^")} </Text>
      </Box>
    </Box>
  }
}

let _ = render(<Robot />, ())
