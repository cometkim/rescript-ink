type nodeName = [
  | #"ink-root"
  | #"ink-box"
  | #"ink-text"
  | #"ink-virtual"
]

type rec t = {
  nodeName: nodeName,
  childNodes: array<t>,
}

type size = {
  width: int,
  height: int,
}

@module("ink") external measureElement: t => size = "measureElement"
