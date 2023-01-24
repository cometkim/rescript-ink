open Ink

module Item = {
  @react.component
  let make = (~id, ~label) => {
    let {isFocused} = useFocus(~id, ())

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
    let {focus} = useFocusManager()

    useInput((input, _) => {
      switch input {
      | '1' => focus("1")
      | '2' => focus("2")
      | '3' => focus("3")
      | _ => ()
      }
    }, ())

    <Box flexDirection=#column padding={1}>
      <Box marginBottom={1}>
        <Text>
          {React.string("Press Tab to focus next element, Shift+Tab to focus previous element, Esc to reset focus.")}
        </Text>
      </Box>
      <Item id="1" label="Press 1 to focus"/>
      <Item id="2" label="Press 2 to focus"/>
      <Item id="3" label="Press 3 to focus"/>
    </Box>
  }
}

let _ = render(<Focus />, ())
