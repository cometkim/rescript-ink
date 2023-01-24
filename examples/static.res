open Ink

module Example = {
  @react.component
  let make = () => {
    let (tests, setTests) = React.useState(() => [])

    React.useEffect0(() => {
      let completedTests = ref(0)
      let timer = ref(None)

      let rec run = () => {
        if completedTests.contents < 10 {
          setTests(previousTests => {
            let len = previousTests->Js.Array2.length
            previousTests->Belt.Array.concat([
              {
                "id": len->Belt.Int.toString,
                "title": `Test #${(len + 1)->Belt.Int.toString}`,
              },
            ])
          })
          timer := Some(Js.Global.setTimeout(run, 100))
          completedTests := completedTests.contents + 1
        }
      }

      run()

      Some(
        () => {
          switch timer.contents {
          | Some(timer) => Js.Global.clearTimeout(timer)
          | None => ()
          }
        },
      )
    })

    <>
      <Static
        items={tests}
        renderItems={(test, _) =>
          <Box key={test["id"]}>
            <Text color=#green> {React.string(`✔ ${test["title"]}`)} </Text>
          </Box>}
      />
      <Box marginTop={1}>
        <Text dimColor=true>
          {React.string("Completed tests: ")}
          {React.int(tests->Js.Array2.length)}
        </Text>
      </Box>
    </>
  }
}

let _ = render(<Example />, ())
