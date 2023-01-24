open Ink

module Item = {
  @react.component
  let make = (~label) => {
    let {isFocused} = useFocus()

    <Text>
      {React.string(label)}
      {switch isFocused {
      | true => <Text color=#green> {React.string(" (focused)")} </Text>
      | false => React.null
      }}
    </Text>
  }
}

module Focus = {
  @react.component
  let make = () => {
    <Box flexDirection=#column padding={1}>
      <Box marginBottom={1}>
        <Text>
          {React.string(
            "Press Tab to focus next element, Shift+Tab to focus previous element, Esc to reset focus.",
          )}
        </Text>
      </Box>
      <Item label="First" />
      <Item label="Second" />
      <Item label="Third" />
    </Box>
  }
}

let _ = render(<Focus />, ())
