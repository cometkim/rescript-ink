open Ink

@module
external ms: float => string = "ms"

module PQueue = {
  type t
  type options

  @obj external makeOptions: (~concurrency: int=?, unit) => options = ""

  @module("p-queue") @new
  external make: options => t = "default"

  @inline
  let make = (~concurrency=?, ()) => make(makeOptions(~concurrency?, ()))

  @send
  external add: (t, unit => promise<'a>) => unit = "add"
}

let delayFloat = ms => {
  Js.Promise2.make((~resolve, ~reject as _reject) => {
    Js.Global.setTimeoutFloat(() => {
      resolve(. ())
    }, ms)->ignore
  })
}

let paths = [
  "tests/login.js",
  "tests/signup.js",
  "tests/forgot-password.js",
  "tests/reset-password.js",
  "tests/view-profile.js",
  "tests/edit-profile.js",
  "tests/delete-profile.js",
  "tests/posts.js",
  "tests/post.js",
  "tests/comments.js",
]

module Test = {
  let getBackgroundColor = status => {
    switch status {
    | #runs => Some(#yellow)
    | #pass => Some(#green)
    | #fail => Some(#red)
    | _ => None
    }
  }

  @react.component
  let make = (~status: [#runs | #pass | #fail], ~path) => {
    open Js
    <Box>
      <Text color=#black backgroundColor=?{getBackgroundColor(status)}>
        {React.string(" ")}
        {React.string((status :> string)->String2.toUpperCase)}
        {React.string(" ")}
      </Text>
      <Box marginLeft={1}>
        <Text dimColor=true>
          {React.string(path->String2.split("/")->Belt.Array.getExn(0))}
          {React.string("/")}
        </Text>
        <Text bold=true color=#white>
          {React.string(path->String2.split("/")->Belt.Array.getExn(1))}
        </Text>
      </Box>
    </Box>
  }
}

module Summary = {
  @react.component
  let make = (~isFinished, ~passed, ~failed, ~time) => {
    <Box flexDirection=#column marginTop={1}>
      <Box>
        <Box width={#length(14)}>
          <Text bold=true> {React.string("Test Suites:")} </Text>
        </Box>
        {switch failed > 0 {
        | true =>
          <Text bold=true color=#red>
            {React.int(failed)}
            {React.string(" failed, ")}
          </Text>

        | false => React.null
        }}
        {switch passed > 0 {
        | true =>
          <Text bold=true color=#green>
            {React.int(passed)}
            {React.string(" passed, ")}
          </Text>
        | false => React.null
        }}
        <Text>
          {React.int(passed + failed)}
          {React.string(" total")}
        </Text>
      </Box>
      <Box>
        <Box width={#length(14)}>
          <Text bold=true> {React.string("Time:")} </Text>
        </Box>
        <Text> {React.string(time)} </Text>
      </Box>
      {switch isFinished {
      | true =>
        <Box>
          <Text dimColor=true> {React.string("Ran all test suites.")} </Text>
        </Box>
      | false => React.null
      }}
    </Box>
  }
}

module Jest = {
  @react.component
  let make = () => {
    let (startTime, setStartTime) = React.useState(() => 0.0)
    let (completedTests, setCompletedTests) = React.useState(() => [])
    let (runningTests, setRunningTests) = React.useState(() => [])

    let runTest = async path => {
      setRunningTests(previousTests =>
        previousTests->Belt.Array.concat([
          {
            "status": #runs,
            "path": path,
          },
        ])
      )

      await delayFloat(1000.0 *. Js.Math.random())

      setRunningTests(previousTests =>
        previousTests->Belt.Array.keep(test => test["path"] !== path)
      )
      setCompletedTests(previousTests => {
        previousTests->Belt.Array.concat([
          {
            "status": Js.Math.random() < 0.5 ? #pass : #fail,
            "path": path,
          },
        ])
      })
    }

    React.useEffect0(() => {
      setStartTime(_ => Js.Date.now())

      let queue = PQueue.make(~concurrency=4, ())

      paths->Belt.Array.forEach(path => {
        queue->PQueue.add(() => runTest(path))
      })

      None
    })

    <Box flexDirection=#column>
      <Static
        items={completedTests}
        renderItems={(test, _) =>
          <Test key={test["path"]} status={test["status"]} path={test["path"]} />}
      />
      {switch runningTests->Js.Array2.length > 0 {
      | true =>
        <Box flexDirection=#column marginTop={1}>
          {React.array(
            runningTests->Belt.Array.map(test => {
              <Test key={test["path"]} status={test["status"]} path={test["path"]} />
            }),
          )}
        </Box>
      | false => React.null
      }}
      <Summary
        isFinished={runningTests->Js.Array2.length == 0}
        passed={completedTests->Belt.Array.keep(test => test["status"] == #pass)->Js.Array2.length}
        failed={completedTests->Belt.Array.keep(test => test["status"] == #fail)->Js.Array2.length}
        time={ms(Js.Date.now() -. startTime)}
      />
    </Box>
  }
}

let _ = render(<Jest />, ())
