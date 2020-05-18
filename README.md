# reason-ink

ReasonML (BuckleScript) binding for [Ink](https://github.com/vadimdemedes/ink)

Let's build interactive CLI with React and ReasonML!

## Supports

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

## Requirements

- BuckleScript v7.3.0 or higher (to compile `unit` as `undefined` value)
- Reason React v0.7.0 or higher (to use hooks)

## Install

```bash
yarn add reason-react reason-ink
```

Add it to your `bsconfig.json`

```diff
  "bs-dependencies": [
+   "reason-react",
+   "reason-ink"
  ]
```

## Example

See [examples](./examples)

## License

See [LICENSE](./LICENSE)
