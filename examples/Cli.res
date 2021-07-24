open Ink
open InkCommunity

module Root = {
  @react.component
  let make = () => {
    let app = useApp()

    useInput((input, _) =>
      if input == 'q' {
        app.exit(None)
      }
    , ())

    <Box display=#flex flexDirection=#column justifyContent=#"space-between">
      <BigText text="Hello,\nReScript-Ink!" font={Block(#redBright, #gray)} />
      <Link url="https://github.com/cometkim/reason-ink">
        {React.string("Checkout the repository!")}
      </Link>
      <Text color=#redBright backgroundColor=#black>
        {React.string("Press q or Ctrl+C to exit")}
      </Text>
    </Box>
  }
}

let {waitUntilExit} = render(<Root />, ~exitOnCtrlC=true, ())

waitUntilExit()->ignore
