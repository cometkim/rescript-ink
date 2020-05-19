open ReasonInk;

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
    <Box display=`flex justifyContent=`center marginY=5>
      <Text bold=true>
        <Color fg={`keyword("orange")} bg=`black>
          {React.string("Press q or Ctrl+C to exit")}
        </Color>
      </Text>
    </Box>;
  };
};

let root = <Root />;
let {waitUntilExit} = root->render(~exitOnCtrlC=true, ());

waitUntilExit();
