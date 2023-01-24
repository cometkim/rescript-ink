open Ink

module Borders = {
  @react.component
  let make = () => {
    <Box flexDirection=#column padding={2}>
      <Box>
        <Box borderStyle=#single marginRight={2}>
          <Text> {React.string("single")} </Text>
        </Box>
        <Box borderStyle=#double marginRight={2}>
          <Text> {React.string("double")} </Text>
        </Box>
        <Box borderStyle=#round marginRight={2}>
          <Text> {React.string("round")} </Text>
        </Box>
        <Box borderStyle=#bold>
          <Text> {React.string("bold")} </Text>
        </Box>
      </Box>
      <Box marginTop={1}>
        <Box borderStyle=#singleDouble marginRight={2}>
          <Text> {React.string("singleDouble")} </Text>
        </Box>
        <Box borderStyle=#doubleSingle marginRight={2}>
          <Text> {React.string("doubleSingle")} </Text>
        </Box>
        <Box borderStyle=#classic>
          <Text> {React.string("classic")} </Text>
        </Box>
      </Box>
    </Box>
  }
}

let _ = render(<Borders />, ())
