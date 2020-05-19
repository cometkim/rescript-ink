open ReasonInk;

module BigText = ReasonInkCommunity_BigText;

module Root = {
  [@react.component]
  let make = () => {
    let app = Hooks.useApp();

    Hooks.useInput(
      (input, _) =>
        if (input == 'q') {
          app.exit(None);
        },
      (),
    );

    <Box display=`flex flexDirection=`column justifyContent=`spaceBetween>
      <BigText text="Hello, Reason-Ink!" font={Block(`yellowBright, `gray)} />
      <Box marginTop=5>
        <Color fg={`keyword("orange")} bg=`black>
          {React.string("Press q or Ctrl+C to exit")}
        </Color>
      </Box>
    </Box>;
  };
};

let root = <Root />;
let {waitUntilExit} = root->render(~exitOnCtrlC=true, ());

waitUntilExit();
