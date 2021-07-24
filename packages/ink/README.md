# ReScript Ink

[![npm](https://img.shields.io/npm/v/rescript-ink)](https://www.npmjs.com/package/rescript-ink)
[![license](https://img.shields.io/github/license/cometkim/rescript-ink)](#license)

[ReScript](https://rescript-lang.org) bindings for [Ink](https://github.com/vadimdemedes/ink)

Let's build interactive & sound CLI with React and ReScript!

## Features

### Core

Core:

- [x] render
- [x] ref & measureElement

Components:

- [x] Box
- [x] Text
- [x] Newline
- [x] Spacer
- [x] Static
- [x] Transform

Hooks:

- [x] useApp
- [x] useInput
- [x] useFocus
- [x] useFocusManager
- [x] useStdin
- [x] useStdout
- [x] useStderr

Do you find any missing APIs? [Let me know](https://github.com/cometkim/rescript-ink/issues/new)!

### :dancers: Community components bindings

- [@rescript-ink/ink-big-text](./packages/ink-big-text) ([ink-big-text](https://github.com/sindresorhus/ink-big-text))
- [@rescript-ink/ink-spinner](./packages/ink-spinner) ([ink-spinner](https://github.com/vadimdemedes/ink-spinner))
- [@rescript-ink/ink-text-input](./packages/ink-text-input) ([ink-text-iput](https://github.com/vadimdemedes/ink-text-input))
- [@rescript-ink/ink-link](./packages/ink-link) ([ink-link](https://github.com/sindresorhus/ink-link))

## Requirements

- Ink v3.0.0 or higher
- ReScript v9.1.0 or higher

## Install

```bash
yarn add rescript-ink @rescript/react \
  # You can install additional community bindings \
  @reason-ink/ink-big-text
```

Add it to your `bsconfig.json`

```diff
  "bs-dependencies": [
+   "rescript-ink",
+   "@rescript/react",
+   "@reason-ink/ink-big-text
  ]
```

## Example

```res
open Ink;

// Community bindings have `InkCommunity_` prefix.
module BigText = InkCommunity_BigText;

module App = {
  @react.component
  let make = () => {
    <Box display=#flex justifyContent=#center>
      <BigText text="Hello, Reason-Ink!"/>
    </Box>
  };
};

let {waitUntilExit} = render(<App />, ~exitOnCtrlC=true, ());
waitUntilExit()->ignore;
```

See more in [examples](./examples)

## Contributing

Any feedbacks & contributions are welcome!

See more details in [CONTRIBUTING](./CONTRIBUTING.md)

## License

MIT
