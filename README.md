# reason-ink


![npm](https://img.shields.io/npm/v/reason-ink)
![GitHub](https://img.shields.io/github/license/cometkim/reason-ink)

ReasonML (BuckleScript) binding for [Ink](https://github.com/vadimdemedes/ink)

Let's build interactive CLI with React and ReasonML!

## Supports

### Core

Core:

- [x] render

Context:

- [x] StdinContext
- [x] StdoutContext
- [x] StderrContext

Components:

- [x] App
- [x] Box
- [x] Color
- [x] Text
- [x] Static
- [x] Transform

Hooks:

- [x] useApp
- [x] useInput
- [x] useStdin
- [x] useStdout
- [x] useStderr

Do you find any missing APIs? [Let me know](https://github.com/cometkim/bs-ink/issues/new)!

### :dancers: Community bindings

- [@reason-ink/ink-big-text](packages/ink-big-text) (original is [ink-big-text](https://github.com/sindresorhus/ink-big-text/) by [Sindre Sorhus](https://github.com/sindresorhus))
- [@reason-ink/ink-spinner](packages/ink-spinner) (original is [ink-spinner](https://github.com/vadimdemedes/ink-spinner/) by [Vadim Demedes](https://github.com/vadimdemedes))

## Requirements

- BuckleScript v7.3.0 or higher (to compile `unit` as `undefined` value)
- Reason React v0.7.0 or higher (to use hooks)

## Install

```bash
yarn add reason-react reason-ink \
  # You can install additional community bindings \
  @reason-ink/ink-big-text
```

Add it to your `bsconfig.json`

```diff
  "bs-dependencies": [
+   "reason-react",
+   "reason-ink",
+   "@reason-ink/ink-big-text
  ]
```

## Example

```re
open ReasonInk;

// Community bindings should have `ReasonInkCommunity_` prefix.
module BigText = ReasonInkCommunity_BigText;

module App = {
  [@react.component]
  let make = () => {
    <Box display=`flex justifyContent=`center>
      <BigText text="Hello, Reason-Ink!"/>
    </Box>
  };
};

let root = <App/>;
let {waitUntilExit} = root->render(~exitOnCtrlC=true, ());
waitUntilExit();
```

See more in [examples](./examples)

## Contributing

Any feedbacks are welcome!

See more details in [CONTRIBUTING](./CONTRIBUTING.md)

## License

See [LICENSE](./LICENSE)
