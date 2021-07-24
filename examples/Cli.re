open Ink;

module BigText = ReasonInkCommunity_BigText;
module Link = InkCommunity_Link;

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
      <Link url="https://github.com/cometkim/reason-ink">
        {React.string("Checkout from GitHub!")}
      </Link>
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

waitUntilExit()->ignore;
